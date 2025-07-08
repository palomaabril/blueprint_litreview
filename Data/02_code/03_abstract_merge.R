library(readr)
library(dplyr)

df_abstract_to_code_paloma <- read_csv("04_step2_screening_abstract/df_abstract_to_code_paloma.csv")
df_abstract_to_code_rens <- read_csv("04_step2_screening_abstract/df_abstract_to_code_rens.csv")

df_abstract_to_code_rens <- df_abstract_to_code_rens%>%
  select(unique_id, to_include)%>%
  rename(to_include_rens=2)

df_abstract_coded <- merge(df_abstract_to_code_paloma, 
                           df_abstract_to_code_rens, 
                           by="unique_id")

write.csv(df_abstract_coded, "04_step2_screening_abstract/df_abstract_coded.csv")
