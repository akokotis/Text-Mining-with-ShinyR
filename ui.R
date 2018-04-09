# User Interface portion of Text Mining Shiny App

ui = fluidPage(
  title = 'Product Text Mining',
  sidebarLayout(
    sidebarPanel(
      tags$head(
        tags$style(HTML('#downloadData{background-color:#FFD700}'))),
      

      # Choose Buckets to Analyze                   
      verbatimTextOutput('out3'),
      selectInput('in3', 'Choose Buckets', buckets, multiple=TRUE, selectize=TRUE, selected=buckets[2]),
      textInput("max", label = h6("Number of Results"), value = "20"),
      
      tags$hr(),
      
      # Load Stop Words Dataset
      fileInput("stopwords", "Choose Stop Words File",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      # Stopwords Load Button
      actionButton("loadStop", "Load"),
      
      hr(),
      
      # Append Stop Words
      textInput("addStop", label = h4("Add New Stop Word"), value = ""),                   
      
      # Download Stopwords List Load Button
      actionButton("loadAdd", "Add Stop Word"),
      downloadButton("downloadData", "Download"),
      h6("Prevew of Stop Words"),
      verbatimTextOutput("test1"),
      
      hr(),
      
      # Search product description by keyword
      textInput("search", label = h4("Search For Keyword"), value = "")
    ),
    
    
    
    mainPanel(
      # Number of Products Analyzed
      h4("Number of Products Being Analyzed"),
      verbatimTextOutput("numproducts"),
      
      tags$hr(),
      
      # Trigrams
      h4("Top Most Frequent Trigrams"),
      tableOutput("trigrams"),
      
      tags$hr(),
      
      # Keyword Search
      h4("Keyword Search"),
      tableOutput("search")
      
    )
  )
)
