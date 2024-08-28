# Easy, Simple Disk Usage Report

Disk space is finite. Freedom isn't free. Healthy boundaries allow everyone to have their personal space.

This is a way of finding were the free disk space has gone.

## Usage

```
sbatch ./scripts/du-check.sh /group/ctbrowngrp/ /group/ctbrowngrp2/ /group/ctbrowngrp3/ /group/ctbrowngrp4/
```

## Highlights that you probably care about

Ever run a long running workflow or need some disk space?

Run this and find what can be cast into the void.

## Backstory of this project

I just wanted to run a workflow that wrote some text files. To my surprise, there wasn't even enough space for a few KB text files on the shared disk of the HPC.

Turns out there were two directories taking up 66% of the available space while every other directory was trying to get by with a pittance.

## How to Contribute

1. Clone this repo
2. Make some changes
3. Create a pull request
4. Request a review when completed
