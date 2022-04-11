#### Preamble ####
# Purpose: Obtain and prepare data about nutritional status of children by backgrounds
# characterists and create a graph 
# Author: Oluwabusayomi Adekuajo
# Email:bussy.adekuajo@mail.utoronto.ca
# Date: 8 Apr. 2022
# Prerequisites: - 

#### Workspace set-up ####
library(janitor)
library(lubridate)
library(tidyverse)
packageVersion('tidyverse')
packageVersion('janitor')

#The script is clearly commented and structured. 
#All variables are appropriately simulated.
#### Simulate data ####
set.seed(855)


simulated_dhs_data <- 
  tibble(
    region = 
      c(
        rep('Dodoma', 1),
        rep('Arusha', 1),
        rep('Kilimanjaro', 1),
        rep('Tanga', 1),
        rep('Morogoro', 1),
        rep('Coast', 1)
      ), #  simulate a few region columns
    no_mass_media_f = 
    runif(n = 6,
          min = 0, 
          max = 100),
    no_mass_media_m = 
      runif(n = 6,
            min = 0, 
            max = 100),
    all_f = 
      runif(n = 6,
            min = 0, 
            max = 100),
    all_m = 
      runif(n = 6,
            min = 0, 
            max = 100)
  )# we only choose a few factors between male and female to stimulate 

#data shows that ...




