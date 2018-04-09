# Hi!
This is script to run a simple text mining exercise in R-Shiny. It includes the ability to
* load data and filter on a category
* load in stopwords and add to stopwords list
* see tokens and frequency

## Getting Started
You must have R or R studio installed on your computer. The app is contained in two files, the interface part (ui.R) and the operational part (server.R). 

You will need a data input file, structured as such:

![Alt text](https://github.com/akokotis/Text-Mining-with-ShinyR/blob/master/images/input-data.PNG)

and a stopwords file, structured as such:

![Alt text](https://github.com/akokotis/Text-Mining-with-ShinyR/blob/master/images/stopwords.PNG)

## Limitations
Because I created the dropdown to contain the list of categories for subsetting the data, the data input file must be loaded in first, then the shiny app run. In order to apply the app to a different dataset, everything must be run again :running:

## Shiny Resources
Thanks to all the open source code out there that helped me in creating this thing! The two main resources I used to debug and figure out how to code the UI experience I wanted are:
* [Stack Overlfow](https://stackoverflow.com/questions/tagged/shiny)
* [Shiny App Gallery](https://shiny.rstudio.com/gallery/)
