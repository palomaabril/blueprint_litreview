#### #################################################################### ####
####  Splitting articles for title screening                              ####
###  --------------------------------------------------------------------  ###
###  Author: Rens Chazottes                                                ###
###  Date: 15/05/2025                                                      ###
##############################################################################

##############################################################################
# R version 4.3.3 (2024-02-29) -- "Angel Food Cake"                          #
# Copyright (C) 2024 The R Foundation for Statistical Computing              #
# Platform: x86_64-pc-linux-gnu (64-bit)                                     #
##############################################################################

###########################################################################
# 0. Set up the working environment ---------------------------------------
###########################################################################
# 0.1. Remove existing files ----
rm(list = ls())
# 0.2. Load libraries ----
if (!require("pacman")) install.packages("pacman")
pacman::p_load(readr, dplyr, tidyr, randomizr)
# 0.3 Get dataset ----
data <- read_csv("01_raw_data/systematic_literature_130525.csv")

###########################################################################
# 1. make the split ---------------------------------------
###########################################################################
# 1.0 seting up the flow ----
### 1.0.1 Set a seed ----
set.seed(1234)
### 1.0.2 Create dataset unique_ids
data_new <- data%>%
  mutate(unique_id = paste("paper", 1:n(), sep="_"))
write.csv(data_new, "01_raw_data/systematic_literature_130525_with_ids.csv")
# 1.1 Make a random selection of lines ----
train_idx <- sample(nrow(data_new), size = floor(nrow(data)/2))
# 1.2 Split the dataset ----
df1 <- data_new[train_idx,   , drop = FALSE]
df2 <- data_new[-train_idx,  , drop = FALSE]
# 1.3 Check whether the split was done acurately ----
paste("Number of duplicates in both dataset:", sum(df1$unique_id%in%df2$unique_id))
# 1.3 Save the datasets in csv format ----
write.csv(df1, "03_step1_screening_title/df_paloma_raw.csv")
write.csv(df2, "03_step1_screening_title/df_rens_raw.csv")