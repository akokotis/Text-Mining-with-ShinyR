# Text Mining Shiny App
# 2017-10-20
# Copy and run all code in R and interface should come up in internet browser
# Dependencies: 2 input files must be on local machine

# Load Packages
# (to install, replace 'require' with 'install.packages')
require("data.table", quiet=T)
require("dplyr", quiet=T)
require("tidytext", quiet=T)
require("stringr", quiet=T)
require("tidyr", quiet=T)
require("widyr", quiet=T)
require("shiny")
require("RCurl")

# Load local .csv data input file
data = read.csv(file.choose(), stringsAsFactors=F)

# Generate list of categories for drop-down menu
buckets=sort(unique(data$buckets),na.last=NA)

### Run ui.R and server.R files here ###

# Run Shiny app
shinyApp(ui, server)