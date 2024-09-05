# Easy, Simple Disk Usage Report

Disk space is finite. Freedom isn't free. Healthy boundaries allow everyone to have their personal space.

This is a way of finding were the free disk space has gone.

## Getting Started

Clone the repo:
```
git clone git@github.com:ccbaumler/diskspace-checker.git
```

`cd` into the directory:
```
cd diskspace-checker
```

## Usage

Run whenever you need to see where the diskspace has gone...

To run point the `sbatch` command at the `du-check.sh` script in the `./scripts/` directory. Give the bash script the absolute path to any directory for which you wish to see diskusage report.

CLI example:
```
sbatch ./scripts/du-check.sh /group/ctbrowngrp/ /group/ctbrowngrp2/ /group/ctbrowngrp3/ /group/ctbrowngrp4/
```

Output:
```

```

## Workflow

1. Run the CLI example above
    a. Optionally, use `less overall_report.txt` and `Shift + f` to load the appended data
2. Review the `overall_report.txt`
3. Enter the directory you would like to begin purging files
4. Run `ncdu` within that directory
> `ncdu` or "NCurses Disk Usage" utilizes an interactive terminal experience that makes this task more pleasant [Documenation](https://dev.yorhel.nl/ncdu)

## Highlights that you probably care about

Ever need to see a print out of diskspace by directory?
Ever need to run a long running workflow and do not want it to suddenly receive a `OOM` error?
Ever need some disk space?

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
