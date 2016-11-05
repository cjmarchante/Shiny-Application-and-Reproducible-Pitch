library(shiny)
library(ggplot2)




BMIds <- read.table('BMI.csv',header=TRUE, sep=";",na.strings='?')

shinyServer(
  function(input,output){
    
    
    output$distPlot <- renderPlot({

      top<-ifelse(pp()>=40,pp(),40)

      p <- ggplot(BMIds,aes(EDAD, P3,P10)) 
      p<- p +  geom_line() 
      p<- p +  geom_area(aes(EDAD, top,fill="P97++"))     
      p<- p +  geom_area(aes(EDAD, P97,fill="P97")) 
      p<- p +  geom_area(aes(EDAD, P90,fill="P90")) 
      p<- p +  geom_area(aes(EDAD, P75,fill="P75"))       
      p<- p +  geom_area(aes(EDAD, P50,fill="P50")) 
      p<- p +  geom_area(aes(EDAD, P25,fill="P25"))      
      p<- p +  geom_area(aes(EDAD, P10,fill="P10")) 
      p<- p +  geom_area(aes(EDAD, P3,fill="P03")) 
      p<- p + theme(legend.background = element_rect())
      p<- p + theme(legend.background = element_rect(fill="gray90", size=.5, linetype="dotted"))
      p<- p + scale_fill_discrete(name="Percentiles")
      p<- p+ geom_point(aes(x=input$age, y=pp()),colour = 'red', size = 3)
      p<- p+ labs(y = "BMI")+labs(x = "AGE")+labs(title = "BMI Percentile")
      
      
      print(p)
      
      
    })
    
    pp <- reactive({
      (input$Weight/input$Height^2)*10000
    })
    
    output$BMI <- renderPrint({
      pp()
    })
    

    }
  )