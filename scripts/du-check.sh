#! /bin/bash -login

#SBATCH -D /home/baumlerc/diskspace-checker  # Working directory for the job
#SBATCH -o ./logs/ncdu.%j.out              # Standard output file
#SBATCH -e ./logs/ncdu.%j.err              # Standard error file
#SBATCH -p high2                            # Partition to submit to
#SBATCH -J ncdu_check                       # Job name
#SBATCH -t 7-00:00:00                       # Time limit (7 days and 0 hours)
#SBATCH -N 1                                # Number of nodes
#SBATCH -n 1                                # Number of tasks
#SBATCH -c 1                                # Number of CPU cores per task
#SBATCH --mem=32G                           # Memory per node
#SBATCH --mail-type=ALL                     # Send email on all job events
#SBATCH --mail-user=ccbaumler@ucdavis.edu   # Email address for notifications

# Fail on weird errors
set -e
set -x

# Load necessary modules or activate environments if needed
# module load ncdu (if ncdu is a module)

# Initialize conda if needed
# conda_base=$(conda info --base)
# . ${conda_base}/etc/profile.d/conda.sh

# Activate relevant environment if needed
# conda activate environment

# Check if any directory arguments are provided; exit if none are found
if [ "$#" -eq 0 ]; then
    echo "Error: No directories specified. Please provide one or more directories to check." | tee -a ./reports/overall_report.txt
    exit 1
fi

# Create a report directory if it does not exist
mkdir -p ./reports

# Create overall report file containing all the information in one place
REPORT_FILE="./reports/overall_report.txt"
{
    echo "Disk Usage Report"
    echo "=================="
    echo "Job ID: $SLURM_JOB_ID"
    echo "Job Name: $SLURM_JOB_NAME"
    echo "Start Time: $(date)"
    echo ""
} > "$REPORT_FILE"

# Loop over all the directories provided in CLI 
for DIR_CHECK in "$@"; do
    # Check that the directories are existing directories
    if [ -d "$DIR_CHECK" ]; then
        {
            echo "Checking directory: $DIR_CHECK"
            echo "------------------------------------------------------------------------------------------"
        } >> "$REPORT_FILE"

        BASE_NAME=$(basename "$DIR_CHECK")
        LOG_FILE="./reports/${BASE_NAME}_log.txt"

        # Return the free diskspace for directory
        {
            df -h "$DIR_CHECK"
            echo ""
        } | tee "$LOG_FILE" >> "$REPORT_FILE"

        # Log disk usage using ncdu and custom script https://unix.stackexchange.com/questions/689668/bash-make-du-show-output-similar-to-ncdu/689673#689673
        {
            echo "Running ncdu for $DIR_CHECK"
            ncdu "$DIR_CHECK" -o- | ./scripts/read_ncdu.py
        } | tee -a "$LOG_FILE" >> "$REPORT_FILE"

        {
            echo "Disk usage information for $DIR_CHECK has been written to $LOG_FILE"
            echo "------------------------------------------------------------------------------------------"
        } >> "$REPORT_FILE"
    else
        {
            echo "------------------------------------------------------------------------------------------"
            echo "Warning: The specified path '$DIR_CHECK' is not a directory or does not exist. Skipping."
            echo "------------------------------------------------------------------------------------------"
        } >> "$REPORT_FILE"
    fi
done

{
    echo "Disk usage check completed for all provided directories."
    echo "End Time: $(date)"
} >> "$REPORT_FILE"

# Other possible commands that perform similarly

## find -maxdepth 1 -type d -name '[!.]*' -exec du -sh {} + | sort -hr

## find . -maxdepth 1 -type d -print0 | xargs -0 -n 1 -P 4 du -sh | sort -hr

## du -sh --max-depth=1 | sort -hr
