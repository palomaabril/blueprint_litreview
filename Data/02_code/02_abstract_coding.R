#### #################################################################### ####
####  Get the abstract files                                              ####
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
pacman::p_load(readr, dplyr, tidyr, randomizr, purrr)
# 0.3 Get dataset ----
df_paloma_coded <- read_csv("03_step1_screening_title/df_paloma_coded.csv")
df_rens_coded <- read_csv("03_step1_screening_title/df_rens_coded.csv")
abstract_included <- read_csv("03_step1_screening_title/abstracts_included.csv")
###########################################################################
# 1. Create variables for coding
###########################################################################
df_abstract_to_code <- abstract_included%>%
  rename(abstract = Abstract...5)%>%
  select(
    unique_id, Cites, Authors, Title, title_lower, abstract, Source, inclusion_paloma, 
    inclusion_rens, Publisher, Year, ArticleURL, CitesURL, GSRank, Type, DOI, ISSN, 
    CitationURL, Volume, Issue, StartPage, EndPage, ECC, CitesPerYear, CitesPerAuthor, 
    AuthorCount, Age, FullTextURL, RelatedURL, source_dataset 
         )%>%
  mutate(
    outcome_variable = "", # The outcome is related to forest ecosystem health
    treatment_variable = "", # The treatment is related to elections / democracy broadly defined
    exp_methods = "", # The method relies on experimental or quasi experimental methods
    theoretical_interest = "" # The paper gives theoretical insights
  )
write.csv(df_abstract_to_code, "04_step2_screening_abstract/df_abstract_to_code.csv")

