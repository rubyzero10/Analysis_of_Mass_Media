install.packages("pdftools")
library(pdftools)
library(tidyverse)

download.file(
  "https://dhsprogram.com/pubs/pdf/FR83/FR83.pdf", 
  "inputs/literature/Tanzinia pdft.pdf",
  mode="wb"
)

pdf_tans <- pdf_text("inputs/literature/Tanzinia pdf.pdf")

check <- pdf_tans[1:336]
check <- tibble(check)

table <- pdf_tans[48:48]
table <- tibble(table)

write.csv(table, "outputs/data/raw_data.csv", row.names=FALSE)

###done

