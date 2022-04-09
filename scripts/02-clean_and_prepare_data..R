library(tidyverse)
library(pointblank)
library(dplyr)
install.packages("pointblank")
library(stringr)

raw_data <- read_csv("outputs/data/raw_data.csv")

raw_data <- 
  raw_data |> 
  separate_rows(table, sep = "\\n", convert = FALSE)

g <- raw_data[56:76,]


raw_data <- 
  g |> 
  separate(col = table, 
           into = c("space", "region", "no_mass_media_f", "read_news_weekly_f", "watch_tele_weekly_f", "listen_radio_weekly_f", "all_f","number_f",
                    "no_mass_media_m", "read_news_weekly_m", "watch_tele_weekly_m", "listen_radio_weekly_m", "all_m","number_m"), 
           sep = "\\s{2,}", 
           remove = FALSE,
           fill = "right"
  )


messy_data <- 
  raw_data %>% 
  select(region, no_mass_media_f, read_news_weekly_f, watch_tele_weekly_f, listen_radio_weekly_f, all_f,number_f,
         no_mass_media_m, read_news_weekly_m, watch_tele_weekly_m, listen_radio_weekly_m, all_m, number_m)|>
  mutate(all_f = str_replace_all(all_f, 'IA', '1.1'), 
         watch_tele_weekly_m = str_replace_all(watch_tele_weekly_m, '9.l', '9.1'),
         listen_radio_weekly_m = str_replace_all(listen_radio_weekly_m, '69.l', '69.1'), 
         listen_radio_weekly_m = str_replace_all(listen_radio_weekly_m, '93.l', '93.1'),
         listen_radio_weekly_m = str_replace_all(listen_radio_weekly_m, '5%3', '57.3'),
         all_m = str_replace_all(all_m, '10.l', '10.1'))
         

cleaned_data <-
  messy_data %>% 
  drop_na(no_mass_media_f) |>
  mutate(across(!region, as.numeric))

  
  
agent <-
  create_agent(tbl = cleaned_data) |>
  col_is_numeric(columns = 2:12) |> # test that the variables that should be numeric are
  col_is_character(columns = vars(region)) |> # test that the variables that should be characters are
  interrogate()

agent

write.csv(cleaned_data, "outputs/data/cleaned_data.csv", row.names=FALSE)


##done