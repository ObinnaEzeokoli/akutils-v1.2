#!/usr/bin/env Rscript
#
#  two-way_permanova.r - R slave for two-way permanova analysis with R package vegan
#
#  Version 1.0.0 (July, 15, 2016)
#
#  Copyright (c) 2016 Andrew Krohn
#
#  This software is provided 'as-is', without any express or implied
#  warranty. In no event will the authors be held liable for any damages
#  arising from the use of this software.
#
#  Permission is granted to anyone to use this software for any purpose,
#  including commercial applications, and to alter it and redistribute it
#  freely, subject to the following restrictions:
#
#  1. The origin of this software must not be misrepresented; you must not
#     claim that you wrote the original software. If you use this software
#     in a product, an acknowledgment in the product documentation would be
#     appreciated but is not required.
#  2. Altered source versions must be plainly marked as such, and must not be
#     misrepresented as being the original software.
#  3. This notice may not be removed or altered from any source distribution.
#

## Recieve input files from bash
args <- commandArgs(TRUE)
map=(args[1])
dmfile=(args[2])
factor1=(args[3])
factor2=(args[4])
f1temp=(args[5])
f2temp=(args[6])
outdir=(args[7])

## Load libraries
library(vegan)
#library(Hmisc)

## Read in data
mapfile <- read.csv(map, sep="\t", header=TRUE)
dm <- read.csv(dmfile, sep="\t", header=TRUE)
f1 <- mapfile[,factor1]
f2 <- mapfile[,factor2]
#factor1 <- read.csv(f1temp, sep="\t", header=TRUE)
#factor2 <- read.csv(f2temp, sep="\t", header=TRUE)

## Run permanova
pm <- adonis(formula = dm ~ f1 * f2, permutations = 999)

## Print output to screen (change to file output)
pm
#write(pm, paste0(outdir, "two-way_permanova_", f1, "_by_", f2 ".txt"))

#LS.pm <- as.data.frame(do.call(cbind, pm))
#write.csv(LS.pm, sep="\t", paste0(outdir, "two-way_permanova.txt"))
