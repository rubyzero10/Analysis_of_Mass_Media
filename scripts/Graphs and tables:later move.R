#Graphs and Tables 

library(knitr)
library(tidyverse)
library(tidyr)
library(dplyr)
library(viridis)
library(patchwork)


data <-read_csv("outputs/data/cleaned_data.csv")
data

write.csv(data, file="cleaned.csv")
read.csv("cleaned.csv", header=T)

overveiw <-
data |> 
  select(region, no_mass_media_f, no_mass_media_m, all_f, all_m, number_f, number_m) |> 
  #slice(1:10) |> 
  kable(
    caption = "First ten rows of a dataset of factors that contribute to commonality of marriage",
    col.names = c("Region", "No Media Female", "No Media Male",
                  "All Media Female", "All Media Male", "Number of Female",
                  "Number of Male"),
    digits = 1,
    booktabs = TRUE, 
    linesep = "")


data |> 
  datasummary_skim(type = "numeric",
                   title = "Summary of numerical ditrubution indicators 
                   variables for regions")


include_graphics(here::here("inputs/literature/Figure Tanz.png"))


fm<- 
  data |>
  #slice(1:10) |> 
  ggplot(mapping = aes(x = reorder(region, -no_mass_media_f), y = no_mass_media_f, fill=region)) +
  geom_bar(stat = "identity", show.legend = FALSE)+
  labs(x = "Region", y = "Females Without Mass Media")+
  theme_classic() +
  scale_fill_viridis(discrete = TRUE)
                     #option = "magma")

m<- 
  data |>
  #slice(1:10) |> 
  ggplot(mapping = aes(x = reorder(region, -no_mass_media_m), y = no_mass_media_m, fill=region)) +
  geom_bar(stat = "identity", show.legend = FALSE)+
  labs(x = "Region", y = "Males Without Mass Media")+
  theme_classic() +
  scale_fill_viridis(discrete = TRUE)

fm/m

fm2<- 
  data |>
  #slice(1:10) |> 
  ggplot(mapping = aes(x = reorder(region, -all_f), y = all_f, fill=region)) +
  geom_bar(stat = "identity", show.legend = FALSE)+
  labs(x = "Region", y = "Females With All 3 Mass Media")+
  theme_classic() +
  scale_fill_viridis(discrete = TRUE,
                     option = "magma")

m2<- 
  data |>
  #slice(1:10) |> 
  ggplot(mapping = aes(x = reorder(region, -all_m), y = all_m, fill=region)) +
  geom_bar(stat = "identity", show.legend = FALSE)+
  labs(x = "Region", y = "Males With All 3 Mass Media")+
  theme_classic() +
  scale_fill_viridis(discrete = TRUE,
                     option = "magma")

fm2/m2

data |>
  ggplot(mapping = aes(x = no_mass_media_m, y = no_mass_media_f, color = region)) +
  geom_point()+
  labs(title= "No Mass Media", x = "Males", y = "Female")

data |>
  ggplot(mapping = aes(x = all_m, y = all_f, color = region)) +
  geom_point()+
  labs(title= "All 3 Mass Media", x = "Males", y = "Female")

newsm<- 
data |>
  ggplot(mapping = aes(x = all_m, y = read_news_weekly_m, color = region)) +
  geom_point()+
  labs(x = "All Males With Media", y = "Read Newspaper Weekly")+
  theme(legend.position="top")

telem<- 
data |>
  ggplot(mapping = aes(x = all_m, y = watch_tele_weekly_m, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(x = "All Males With Media", y = "Watch Television Weekly")+
  scale_colour_viridis_d(option = "plasma")


radm<- 
data |>
  ggplot(mapping = aes(x = all_m, y = listen_radio_weekly_m, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(x = "All Males With Media", y = "Listen to Radio Weekly ")

newsm/telem/radm

rwm<- 
data |>
  ggplot(mapping = aes(x = listen_radio_weekly_m, y = watch_tele_weekly_m, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(title= "Males", x = "Listen to Radio Weekly", y = "Watch Television Weekly")

rnm<-
data |>
  ggplot(mapping = aes(x = listen_radio_weekly_m, y = read_news_weekly_m, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(x = "Listen to Radio Weekly", y = "Read Newspaper Weekly")

nwm<- 
data |>
  ggplot(mapping = aes(x = read_news_weekly_m, y = watch_tele_weekly_m, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(x = "Read Newspaper Weekly", y = "Watch Television Weekly")
rwm/rnm/nwm

rwf<- 
data |>
  ggplot(mapping = aes(x = listen_radio_weekly_f, y = watch_tele_weekly_f, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(title= "Females", x = "Listen to Radio Weekly", y = "Watch Television Weekly")

rnf<- 
data |>
  ggplot(mapping = aes(x = listen_radio_weekly_f, y = read_news_weekly_f, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(x = "Listen to Radio Weekly", y = "Read Newspaper Weekly")

nwf<- 
data |>
  ggplot(mapping = aes(x = read_news_weekly_f, y = watch_tele_weekly_f, color = region)) +
  geom_point(show.legend = FALSE)+
  labs(x = "Read Newspaper Weekly", y = "Watch Television Weekly")
rwf/rnf/nwf





