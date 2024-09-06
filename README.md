# Easy, Simple Disk Usage Report

Disk space is finite. Freedom isn't free. Healthy boundaries allow everyone to have their personal space.

This is a way of finding were the free disk space has gone.

## Output

The workflow will automatically generate two directories:

- In `<date>-reports` directory:
  - `overall_report.txt`
    - This will contain the output for `df -h`, `ls -lathr`, and `ncdu`.
    - This will allow the user to identify the total diskspace free, the date of lasat modification of files in sub-directories within the CLI directory, and the amount of diskspace each sub-directory is using at the time of execution.
  - `<basename_directory>_log.txt`
    - This will contain the output for `ls -lathr`, and `ncdu`.
    - This will be a simpler text file to see the modification date and diskusage of each sub-directory.
> [!CAUTION]
>
> "One thing that will require an admin to run this script is that typical users can't estimate the size of other users' protected directories."
> 
> \- [@mr-eyes](https://github.com/mr-eyes)

- In `logs` directory:
  - `ncdu.<slurm_jobid>.err`
  - `ncdu.<slurm_jobid>.out`

## Workflow

1. Run the CLI example below
    a. Optionally, use `less +F overall_report.txt` to automatically load the appended data as the script runs
2. Review the `overall_report.txt`
3. Enter the directory you would like to begin purging files
4. Run `ncdu` within that directory
> `ncdu` or "NCurses Disk Usage" utilizes an interactive terminal experience that makes this task more pleasant [Documenation](https://dev.yorhel.nl/ncdu)

## Getting Started

Clone the repo:
```
git clone git@github.com:ccbaumler/diskspace-checker.git
```

`cd` into the directory:
```
cd diskspace-checker
```

Please edit line 3 and line 14 in `scripts/du-check.sh`:

> line 3
> ```
> #SBATCH -D /home/baumlerc/diskspace-checker  # Working directory for the job
> ```

> line 14
> ```
> #SBATCH --mail-user=ccbaumler@ucdavis.edu   # Email address for notifications
> ```

## Usage

Run whenever you need to see where the diskspace has gone...

To run point the `sbatch` command at the `du-check.sh` script in the `./scripts/` directory. Give the bash script the absolute path to any directory for which you wish to see diskusage report.

CLI example:
```
sbatch ./scripts/du-check.sh /group/ctbrowngrp/ /group/ctbrowngrp2/ /group/ctbrowngrp3/ /group/ctbrowngrp4/
```

Output tree:
```
.
├── 20240905-reports
│   ├── ctbrowngrp2_log.txt
│   ├── ctbrowngrp3_log.txt
│   ├── ctbrowngrp4_log.txt
│   ├── ctbrowngrp_log.txt
│   └── overall_report.txt
├── README.md
├── logs
│   ├── ncdu.15240654.err
│   └── ncdu.15240654.out
└── scripts
    ├── du-check.sh
    └── read_ncdu.py

4 directories, 10 files
```

<details>

<summary>`overall_report.txt` for above command example</summary>

### `overall_report.txt`

```
Disk Usage Report
==================
Job ID: 15240654
Job Name: ncdu_check
Start Time: Thu Sep  5 10:12:00 PDT 2024

Checking directory: /group/ctbrowngrp/
------------------------------------------------------------------------------------------
Filesystem                            Size  Used Avail Use% Mounted on
nas-6-0-ib:/nas-6-0/ctbrowngrp/group  220T  218T  2.8T  99% /group/ctbrowngrp

Per.      Links  Owner Group    Size  Date Modified   Name
total 834K
drwxr-sr-x   2 bill     ctbrowngrp   4 Mar  4  2020 bill
drwxrwsr-x   4 ctbrown  ctbrowngrp   9 May  8  2020 ncbi-genomes
drwxr-sr-x   4 irber    ctbrowngrp   4 Jul 11  2020 irber
drwxrwsr-x   3 ntpierce ctbrowngrp   9 Jan 11  2021 progenomes
drwxrwsr-x   4 ntpierce ctbrowngrp  33 Jan 22  2021 dammit-databases
drwxrwsr-x   3 cjfinno  ctbrowngrp   6 Jan 29  2021 finno
drwxrwsr-x   2 hehouts  ctbrowngrp   3 Jul 28  2021 non-microbial-reference
drwxr-sr-x   2 tereiter ctbrowngrp  61 Jan  8  2022 killifish
lrwxrwxrwx   1 root     ctbrowngrp  14 Jan 27  2022 scratch -> ../ctbrowngrp2
drwxrwsr-x   2 ntpierce ctbrowngrp   3 Jan 31  2022 mmetsp
drwxrwsr-x   7 ntpierce ctbrowngrp  23 Apr 11  2022 gtdb
drwxrwsr-x   3 ntpierce ctbrowngrp   5 May 24  2022 sra_search
drwxrwsr-x   6 pengsc   ctbrowngrp   9 Jun 13  2022 speng
drwxrwsr-x  11 dani314  ctbrowngrp  11 Jun 15  2022 toedlab
drwxrwsr-x   7 camw     ctbrowngrp   8 Jul 22  2022 camw
drwxr-sr-x   7 olgabot  ctbrowngrp   9 Sep  9  2022 olgabot
drwxrwsr-x   5 ffavila  ctbrowngrp   7 Oct  4  2022 bellonelab_shared
-rw-rw-r--   1 mshokrof ctbrowngrp  44 Dec 30  2022 cattle_pan.log
drwxrwsr-x  10 ntpierce ctbrowngrp  10 Feb  6  2023 virus-references
-rw-rw-r--   1 ctbrown  ctbrowngrp 444 Mar 14  2023 du.out.2023.03.14
drwxrwsr-x   2 ntpierce ctbrowngrp  10 Mar 28  2023 genbank
-r--rw-r--   1 ctbrown  ctbrowngrp 507 Sep 19  2023 du.out.2023.09.19
drwxrwsr-x   3 jyge     ctbrowngrp   3 Jan 12  2024 jyge
drwxrwsr-x   3 ntpierce ctbrowngrp  10 Jan 30  2024 gtdb-fastas
drwxrwsr-x  22 mshokrof ctbrowngrp  44 Apr 14 00:25 mshokrof
drwxrwsr-t  27 ctbrown  ctbrowngrp  31 May 14 07:29 .
drwxrwsr-x 202 ctbrown  ctbrown    341 Jun  6 09:34 ctbrown
drwxrwsr-x  18 pengsc   ctbrowngrp  20 Jul  1 12:35 finnolab_shared
drwxrwsrwt   5 ctbrown  ctbrowngrp   6 Jul 25 08:15 projects
drwxrwsrwt  13 ctbrown  ctbrowngrp  17 Aug 16 15:47 sourmash-db
drwxr-xr-x 162 root     root         0 Sep  4 16:59 ..

Running ncdu for /group/ctbrowngrp/
------ /group/ctbrowngrp --- 84.4TiB -------
   39.0TiB  (46.2%) [##########] finnolab_shared
   16.0TiB  (19.0%) [####------] irber
   12.4TiB  (14.7%) [###-------] mshokrof
    8.5TiB  (10.1%) [##--------] bellonelab_shared
    1.9TiB   (2.3%) [----------] ctbrown
    1.6TiB   (1.9%) [----------] gtdb
    1.2TiB   (1.4%) [----------] olgabot
 1011.3GiB   (1.2%) [----------] sourmash-db
  805.8GiB   (0.9%) [----------] projects
  664.5GiB   (0.8%) [----------] gtdb-fastas
  411.7GiB   (0.5%) [----------] virus-references
  345.1GiB   (0.4%) [----------] killifish
  260.3GiB   (0.3%) [----------] progenomes
   98.4GiB   (0.1%) [----------] toedlab
   78.5GiB   (0.1%) [----------] camw
   66.8GiB   (0.1%) [----------] ncbi-genomes
   23.8GiB   (0.0%) [----------] genbank
   13.8GiB   (0.0%) [----------] speng
   10.6GiB   (0.0%) [----------] dammit-databases
  840.3MiB   (0.0%) [----------] non-microbial-reference
  290.9MiB   (0.0%) [----------] sra_search
  100.6MiB   (0.0%) [----------] mmetsp
   89.9MiB   (0.0%) [----------] finno
  106.0KiB   (0.0%) [----------] bill
   12.0KiB   (0.0%) [----------] du.out.2023.03.14
   12.0KiB   (0.0%) [----------] du.out.2023.09.19
    1.5KiB   (0.0%) [----------] jyge
    512.0B   (0.0%) [----------] cattle_pan.log
    512.0B   (0.0%) [----------] scratch
Disk usage information for /group/ctbrowngrp/ has been written to ./20240905-reports/ctbrowngrp_log.txt
------------------------------------------------------------------------------------------
Checking directory: /group/ctbrowngrp2/
------------------------------------------------------------------------------------------
Filesystem                       Size  Used Avail Use% Mounted on
nas-4-0-ib:/nas-4-0/ctbrowngrp2  100T  100T  450G 100% /group/ctbrowngrp2

Per.      Links  Owner Group    Size  Date Modified   Name
total 2.1M
-rw-rw-r--   1 ctbrown  ctbrowngrp  166 Jan 28  2022 README.md
drwxr-sr-x   3 tereiter ctbrowngrp    3 Mar 16  2022 tereiter
-rw-rw-r--   1 mshokrof ctbrowngrp    0 Feb 21  2023 log
-rw-rw-r--   1 cbquinn  ctbrowngrp    0 May  5  2023 K8.summary.txt
-rw-rw-r--   1 vkrojas  ctbrowngrp    0 Jun 21  2023 chuck.txt
drwxrwsr-x   3 baumlerc ctbrowngrp    3 Aug 19  2023 baumlerc
-rw-rw-r--   1 ctbrown  ctbrowngrp  428 Sep 19  2023 du.out.2023.09.19
drwxrwsr-t   6 ntpierce ctbrowngrp    6 Oct  1  2023 ntpierce
drwxrwsr-x   6 cbquinn  ctbrowngrp    6 Oct 19  2023 scratch
drwxr-xr-x   8 hennelly ctbrowngrp    8 Nov 27  2023 hennelly
drwxrwsr-x  13 tahmed   ctbrowngrp   15 Dec  5  2023 tamer
-rw-rw-r--   1 cbquinn  ctbrowngrp   14 Dec 24  2023 K7.loglikelihood.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    9 Dec 24  2023 K7.CV_error.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    0 Dec 24  2023 K7.summary.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    0 Dec 24  2023 K7.best_run.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp 4.4K Dec 24  2023 K7.subjects.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp 4.6K Dec 24  2023 K7.results.txt
drwxrwxrwx  11 cbquinn  ctbrowngrp   23 Dec 25  2023 cbquinn
-rw-rw-r--   1 cbquinn  ctbrowngrp   14 Dec 25  2023 K8.loglikelihood.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    9 Dec 25  2023 K8.CV_error.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    0 Dec 25  2023 K8.best_run.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    0 Dec 25  2023 K8.subjects.txt
-rw-rw-r--   1 cbquinn  ctbrowngrp    0 Dec 25  2023 K8.results.txt
drwxrwsr-x   3 baumlerc ctbrowngrp    3 Jan  8  2024 ${USER}
drwxrwsr-x   3 baumlerc ctbrowngrp    3 Jan  8  2024 {USER}
drwxrwsr-x   3 baumlerc ctbrowngrp    3 Jan  8  2024 $USER
drwxrwsr-x   3 baumlerc ctbrowngrp    3 Jan  8  2024 {{$USER}}
drwxrwsr-x   3 baumlerc ctbrowngrp    3 Jan  8  2024 {{ os.environ['USER'] }}
drwxrwsr-x   9 jdowen   ctbrowngrp    9 Jan 22  2024 jdowen
drwxrwsr-x  40 ctbrown  ctbrowngrp   45 Jan 27  2024 ctbrown
drwxrwsr-x   7 mhussien ctbrowngrp    8 Feb 27  2024 mhussien
drwxrwsr-x   7 hehouts  ctbrowngrp    7 Feb 27  2024 hehouts
drwxrwsr-x  18 mshokrof ctbrowngrp   23 Mar  5  2024 mshokrof
drwxrwsr-x   2 yc22     ctbrowngrp   10 Mar 17 21:22 yc22
drwxr-xr-x  61 yote     yote         75 Apr 19 05:07 yote
drwxrwsr-x   5 sereng   ctbrowngrp    5 May  2 23:05 sereng
drwxrwsr-x  21 sophiepq ctbrowngrp   23 May 22 09:05 sophiepq
-rw-rw-r--   1 jdowen   ctbrowngrp    0 May 23 05:41 jdow
-rw-rw-r--   1 jdowen   ctbrowngrp    0 May 23 05:41 jdo
drwxrwsr-x   8 cassrod7 ctbrowngrp    8 Jun 23 10:06 cassrod7
drwxrwsr-x   6 vkrojas  ctbrowngrp    8 Jun 28 14:51 vkrojas
drwxrwsr-x   5 pengsc   ctbrowngrp    5 Jul 18 12:15 pengsc
drwxrwsrwt  26 ctbrown  ctbrowngrp   44 Aug 22 19:16 .
drwxr-xr-x 162 root     root          0 Sep  4 16:59 ..

Running ncdu for /group/ctbrowngrp2/
------ /group/ctbrowngrp2 --- 94.7TiB -------
   16.8TiB  (17.7%) [##########] tereiter
   13.4TiB  (14.1%) [########--] yote
   12.3TiB  (13.0%) [#######---] cbquinn
   11.3TiB  (11.9%) [#######---] pengsc
    8.7TiB   (9.2%) [#####-----] scratch
    7.5TiB   (7.9%) [####------] hennelly
    6.0TiB   (6.3%) [####------] sophiepq
    5.9TiB   (6.3%) [####------] mshokrof
    3.6TiB   (3.8%) [##--------] jdowen
    3.2TiB   (3.3%) [##--------] tamer
    1.9TiB   (2.0%) [#---------] hehouts
    1.8TiB   (1.9%) [#---------] mhussien
  817.5GiB   (0.8%) [----------] ctbrown
  794.0GiB   (0.8%) [----------] sereng
  451.0GiB   (0.5%) [----------] vkrojas
  275.0GiB   (0.3%) [----------] cassrod7
    9.0GiB   (0.0%) [----------] yc22
  677.9MiB   (0.0%) [----------] ntpierce
   33.0KiB   (0.0%) [----------] baumlerc
   12.0KiB   (0.0%) [----------] du.out.2023.09.19
   12.0KiB   (0.0%) [----------] README.md
   12.0KiB   (0.0%) [----------] K7.subjects.txt
   12.0KiB   (0.0%) [----------] K7.results.txt
    1.5KiB   (0.0%) [----------] {USER}
    1.5KiB   (0.0%) [----------] ${USER}
    1.5KiB   (0.0%) [----------] {{$USER}}
    1.5KiB   (0.0%) [----------] $USER
    1.5KiB   (0.0%) [----------] {{ os.environ['USER'] }}
    512.0B   (0.0%) [----------] K8.loglikelihood.txt
    512.0B   (0.0%) [----------] jdo
    512.0B   (0.0%) [----------] jdow
    512.0B   (0.0%) [----------] chuck.txt
    512.0B   (0.0%) [----------] K8.CV_error.txt
    512.0B   (0.0%) [----------] K7.summary.txt
    512.0B   (0.0%) [----------] K8.summary.txt
    512.0B   (0.0%) [----------] K7.CV_error.txt
    512.0B   (0.0%) [----------] log
    512.0B   (0.0%) [----------] K7.loglikelihood.txt
    512.0B   (0.0%) [----------] K7.best_run.txt
    512.0B   (0.0%) [----------] K8.results.txt
    512.0B   (0.0%) [----------] K8.subjects.txt
    512.0B   (0.0%) [----------] K8.best_run.txt
Disk usage information for /group/ctbrowngrp2/ has been written to ./20240905-reports/ctbrowngrp2_log.txt
------------------------------------------------------------------------------------------
Checking directory: /group/ctbrowngrp3/
------------------------------------------------------------------------------------------
Filesystem                       Size  Used Avail Use% Mounted on
nas-4-0-ib:/nas-4-0/ctbrowngrp3   50T   50T  926G  99% /group/ctbrowngrp3

Per.      Links  Owner Group    Size  Date Modified   Name
total 1.1M
drwxrwsr-x  13 chanyue  chanyue     21 Apr 20  2022 chanyue
drwxrwsr-x   2 sophiez  sophiez      2 Jun 22  2022 sophiez
drwxrwsr-x  12 evanjh19 evanjh19    20 Dec  3  2022 evanjh19
drwxrwsr-x   2 kreagan  kreagan      2 Jan 25  2023 kreagan
drwxrwsr-x   4 falima   falima       5 Feb  8  2023 falima
drwxrwsr-x   5 mamahmou mamahmou     7 Mar 31  2023 mamahmou
drwxrwsr-x  34 rgtoed   rgtoed      47 Jun  9  2023 rgtoed
drwxrwsr-x  17 makan    makan       24 Jun 27  2023 makan
-rw-rw-r--   1 ctbrown  ctbrowngrp 385 Sep 19  2023 du.out.2023.09.19
drwxrwsr-x   5 ajoyeux  ajoyeux      7 Oct  2  2023 ajoyeux
-rw-r--r--   1 root     ctbrowngrp  12 Oct  2  2023 du.2023-10-02
drwxrwsr-x  19 sjnair   sjnair      31 Feb 24  2024 sjnair
drwxrwsr-t  30 ctbrown  ctbrowngrp  32 Mar  6  2024 .
drwxrwsr-x   5 jmcphers jmcphers     8 Mar  8 11:23 jmcphers
drwxrwsr-x   3 mmcadam  mmcadam      5 Mar  8 11:23 mmcadam
drwxrwsrwt  11 ctbrown  ctbrowngrp  12 Mar 13 10:45 scratch
drwxrwsr-x   2 pmagalan ctbrowngrp  17 Mar 21 13:24 prmagalang
drwxrwsr-x   4 karobert ctbrowngrp   5 Apr 23 14:01 karobert
drwxrwsr-x   7 jyge     ctbrowngrp   9 May  6 14:35 jyge
drwxrwsr-x   8 vanburen ctbrowngrp   8 Jun  5 21:20 vanburen
drwxrwsr-x   7 mhussien ctbrowngrp   7 Jul 19 17:46 mhussien
drwxrwsr-x  54 dani314  dani314     88 Aug 13 14:27 dani314
drwxrwsr-x  32 hfm      hfm         51 Sep  2 01:44 hfm
drwxrwsr-x  25 zyzhao   zyzhao      37 Sep  3 10:36 zyzhao
drwxrwsr-x   9 sjryan12 sjryan12    15 Sep  3 12:13 sjryan12
drwxrwsr-x  34 clgrett  clgrett     41 Sep  3 20:20 clgrett
drwxrwsr-x  26 hdheath  hdheath    153 Sep  4 11:18 hdheath
drwxrwsr-x  28 gmvaz    gmvaz       50 Sep  4 15:31 gmvaz
drwxr-xr-x 162 root     root         0 Sep  4 16:59 ..
drwxrwsr-x  31 msleeper msleeper    45 Sep  5 12:34 msleeper
drwxrwsr-x  67 baumlerc baumlerc    91 Sep  5 13:40 baumlerc
drwxrwsr-x  25 tpowell7 tpowell7    30 Sep  5 13:49 tpowell7

Running ncdu for /group/ctbrowngrp3/
------ /group/ctbrowngrp3 --- 48.8TiB -------
   15.6TiB  (31.9%) [##########] hfm
   13.7TiB  (28.0%) [#########-] scratch
    4.7TiB   (9.6%) [###-------] zyzhao
    3.4TiB   (6.9%) [##--------] mhussien
    2.2TiB   (4.6%) [#---------] tpowell7
    2.2TiB   (4.4%) [#---------] dani314
    1.9TiB   (3.9%) [#---------] msleeper
    1.6TiB   (3.2%) [#---------] rgtoed
  962.9GiB   (1.9%) [#---------] clgrett
  813.3GiB   (1.6%) [#---------] vanburen
  685.4GiB   (1.4%) [----------] hdheath
  227.8GiB   (0.5%) [----------] jyge
  206.1GiB   (0.4%) [----------] sjryan12
  203.5GiB   (0.4%) [----------] baumlerc
  196.5GiB   (0.4%) [----------] karobert
  190.8GiB   (0.4%) [----------] gmvaz
  102.4GiB   (0.2%) [----------] makan
   79.8GiB   (0.2%) [----------] sjnair
   48.9GiB   (0.1%) [----------] evanjh19
   44.3GiB   (0.1%) [----------] prmagalang
    4.4GiB   (0.0%) [----------] chanyue
  742.3MiB   (0.0%) [----------] mamahmou
   50.0KiB   (0.0%) [----------] jmcphers
   38.0KiB   (0.0%) [----------] ajoyeux
   13.5KiB   (0.0%) [----------] falima
   12.0KiB   (0.0%) [----------] du.out.2023.09.19
    2.0KiB   (0.0%) [----------] mmcadam
    512.0B   (0.0%) [----------] sophiez
    512.0B   (0.0%) [----------] du.2023-10-02
    512.0B   (0.0%) [----------] kreagan
Disk usage information for /group/ctbrowngrp3/ has been written to ./20240905-reports/ctbrowngrp3_log.txt
------------------------------------------------------------------------------------------
Checking directory: /group/ctbrowngrp4/
------------------------------------------------------------------------------------------
Filesystem                       Size  Used Avail Use% Mounted on
nas-4-3-ib:/nas-4-3/ctbrowngrp4   75T   39T   37T  52% /group/ctbrowngrp4

Per.      Links  Owner Group    Size  Date Modified   Name
total 242K
drwx--S---   5 mhussien ctbrowngrp  6 May 13 16:06 2024-mhussien-QC
drwxrwsr-x   5 statham  ctbrowngrp  5 Jul 19 11:04 2024-statham
drwxrwsr-x   5 nchin    ctbrowngrp 10 Jul 30 11:22 2024-nchin-virus
drwxrwsr-x   8 cbquinn  ctbrowngrp  9 Aug  1 21:50 2024-cbquinn-redfoxWGS
drwxrwsr-x   3 baumlerc ctbrowngrp  3 Aug  1 23:00 2024-ccbaumler-allthebacteria
drwxrwsr-x   8 vanburen ctbrowngrp 14 Aug 12 12:23 2024-vanburen-horse-genomes
drwxrwsr-x   3 baumlerc ctbrowngrp  3 Aug 14 12:17 2024-ccbaumler-gtdb
drwxrwsrwt  15 ctbrown  ctbrowngrp 15 Aug 14 12:18 .
drwxrwsr-x   7 mmerid   ctbrowngrp  8 Aug 16 09:30 mmerid
drwxrwsr-x   4 jdowen   ctbrowngrp  4 Aug 21 16:04 2024-jdowen-islandskunk
drwxrwsr-x   6 tmathieu ctbrowngrp  6 Aug 22 12:28 2024-tell-nanopore
drwxrwxrwx   5 cbquinn  ctbrowngrp  6 Aug 29 13:28 2024-cbquinn-redwolf
drwxrwsr-x   5 baumlerc ctbrowngrp 10 Sep  4 14:21 2024-ccbaumler-genbank
drwxrwsr-x   6 sophiepq ctbrowngrp  6 Sep  5 00:35 2024-sophiepq-kitfoxGBS
drwxr-xr-x 162 root     root        0 Sep  5 20:17 ..

Running ncdu for /group/ctbrowngrp4/
------ /group/ctbrowngrp4 --- 32.5TiB -------
   30.6TiB  (94.0%) [##########] 2024-vanburen-horse-genomes
  636.0GiB   (1.9%) [----------] 2024-ccbaumler-allthebacteria
  527.5GiB   (1.6%) [----------] 2024-ccbaumler-genbank
  241.6GiB   (0.7%) [----------] 2024-cbquinn-redwolf
  195.1GiB   (0.6%) [----------] 2024-tell-nanopore
  141.2GiB   (0.4%) [----------] mmerid
   79.5GiB   (0.2%) [----------] 2024-ccbaumler-gtdb
   70.9GiB   (0.2%) [----------] 2024-sophiepq-kitfoxGBS
   55.8GiB   (0.2%) [----------] 2024-jdowen-islandskunk
   41.4GiB   (0.1%) [----------] 2024-statham
   10.8GiB   (0.0%) [----------] 2024-cbquinn-redfoxWGS
    8.8GiB   (0.0%) [----------] 2024-nchin-virus
   24.0KiB   (0.0%) [----------] 2024-mhussien-QC
Disk usage information for /group/ctbrowngrp4/ has been written to ./20240905-reports/ctbrowngrp4_log.txt
------------------------------------------------------------------------------------------
Disk usage check completed for all provided directories.
End Time: Fri Sep  6 00:54:14 PDT 2024
```

</details>

## Why you should probably care about this

- Ever need to see a print out of diskspace by directory?
- Ever need to run a long running workflow and do not want it to suddenly receive a `OOM` error?
- Ever need some disk space?

Run this and find what can be cast into the void.

## Backstory of this project

I just wanted to run a workflow that wrote some text files. To my surprise, there wasn't even enough space for a few KB text files on the shared disk of the HPC.

Turns out there were two directories taking up 66% of the available space while every other directory was trying to get by with a pittance.

## How to Contribute

1. Clone this repo
2. Make some changes
3. Create a pull request
4. Request a review when completed

## Authors

Colton Baumler

[![UC Davis Email](https://img.shields.io/badge/UC_Davis-Email-blue?style=for-the-badge&colorA=blue&colorB=gold)](mailto:ccbaumler@ucdavis.edu) <a href="mailto:ccbaumler@gmail.com"><img src="https://img.shields.io/badge/gmail-%23DD0031.svg?&style=for-the-badge&logo=gmail&logoColor=white"/></a>
