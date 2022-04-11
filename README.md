# Use of mass media in Tanzania 

We use the Tanzania DHS Final Reports , 1996 - available here: https://dhsprogram.com/ ->  Publications -> Tanzania: DHS, 1996 - Final Report (English).

This repository is organized as follows:

PDF is saved to ‘inputs’, in 'literature' as Tanzinia pdf

Simulation of plan for usable dataset is saved in script ‘scripts/00-simulation.R’.

R code to OCR PDF is saved in 'scripts' as ‘scripts/01-gather_data.R’

The raw data is saved in output to ‘outputs/data/raw_data.csv’


R code that draws on ‘raw_data.csv’ to clean and prepare the dataset is saved in 'scripts' as ‘scripts/02-clean_and_prepare_data.R’, 

Cleaned dataset is saved to 'outputs' as ‘outputs/data/cleaned_data.csv’.

1. Inputs contains literature from which data was extracted
2. Output contains the folders data and paper. Paper includes a pdf of report, and R markdown that helped produced file, with a reference documented containing cited literature, along with cleaned data saved as cleaned.csv to be accessed in R markdown 
3. Scripts included the R script that manipulated and cleaned raw data, to be presented in Output 
