# Functions for Text Mining App
server <- function(input, output, session) {
  
  maindata = reactive({
    if(input$load == 0){return()}
    
    df = data
    df = df[which(df$buckets %in% input$in3),]

  })
  
  values = reactiveValues()
  
  stopwords = reactive({
    if(input$loadStop == 0){return()}
    inFile <- input$stopwords
    if (is.null(inFile)){return(NULL)}
    
    isolate({
      input$loadStop
      df2 = read.csv(input$stopwords$datapath,
                     header = TRUE, stringsAsFactors=FALSE)
    })
    
    values$df = data.frame(df2, stringsAsFactors=F)
    
  })
  
  newEntry <- observe({
    if(input$loadAdd > 0) {
      newLine <- isolate(c(input$addStop))
      isolate(values$df <- rbind(values$df, as.character(newLine)))
    }
  })
  
  
  
  output$downloadData <- downloadHandler(
    filename = function() {
      paste("Stop Word List", ".csv", sep = "")
    },
    content = function(file) {
      write.csv(values$df, file, row.names = FALSE)
    }
  )
  
  
  # Find Trigrams in main data
  threetoken = reactive({
    req(maindata())
    maindata() %>%
      unnest_tokens(trigram, text, token="ngrams", n=3) %>%
      separate(trigram, c("word1","word2","word3"), sep=" ") %>%
      filter(!word1 %in% stopwords()$word, !word2 %in% stopwords()$word, !word3 %in% stopwords()$word) %>%
      filter(!word1 %in% values$df$word, !word2 %in% values$df$word, !word3 %in% values$df$word) %>%
      unite(trigram,word1,word2,word3,sep=" ")
  })
  
  
  # Find Trigrams in main data
  output$trigrams <- renderTable({
    max= as.numeric(input$max)
    threetoken() %>%
      count(trigram, sort=T) %>%
      slice(1:max) 
  })
  
  
  
  # Count Number of Products in main data
  output$numproducts <- renderPrint({     
    nrow(maindata())
    
  })
  
  # Count Number of Products in main data
  output$test1 <- renderPrint({     
    tail(values$df)
    
  })
  
  # Keyword Search
  searchresults <- reactive({
    req(maindata())
    keyword=input$search
    onetoken= maindata() %>%
      unnest_tokens(unigram, text, token="ngrams", n=1) %>%
      filter(unigram == as.character(keyword)) %>%
      select(rowid)
    unique(onetoken)
    
  })
  
  output$search <- renderTable({
    req(maindata())
    head(maindata() %>% 
           filter(rowid %in% searchresults()$rowid))
  })
  
}