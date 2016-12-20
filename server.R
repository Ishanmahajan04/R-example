

library(shiny)
library(sqldf)


shinyServer(function(input, output) {

  
  if (file.exists("Test.sqlite") == TRUE) file.remove("Test.sqlite")
  
  db <- dbConnect(SQLite(), dbname='Test.sqlite')
  
    dbSendQuery(conn = db, "CREATE TABLE School (SchID INTEGER,  Location TEXT, Authority TEXT, SchSize TEXT)")
  
    
   
    
    
    
    observeEvent(input$save,{
      cat("Hi.....") 
      
      dbGetQuery(conn = db, 
                 "INSERT INTO School VALUES (1, 'urban', 'state','medium')")
      
      # dbSendQuery(conn = db,"INSERT INTO School VALUES (2, "urban1", "independent", "large")")
      
      # dbSendQuery(conn = db,'INSERT INTO School VALUES (3, ‘rural’, ‘state’, ‘small’)')
      
      dbGetQuery(conn = db, 
                 "INSERT INTO 
                 School VALUES (2, 'urban1', 'state','medium')")
      
      dbGetQuery(conn = db, 
                 "INSERT INTO 
                 School VALUES (3, 'urban2', 'state','Large')")
    
      
      print( cat(dbListTables(db)),      
             cat(dbListFields(db, 'School'))
            )
      
      print (dbReadTable(db, 'School'))
      
       }
      )

    
    
})
