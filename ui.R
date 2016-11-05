library(shiny)

# The app calculates BMI for male teenagers and child(2 to 18 years) and show it in the percentile chart

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Weight Control App"),
  
  # Sidebar with a slider input for 
  sidebarPanel(
    p("This app computes the BMI of one person*, shows the BMI value in the percentile chart and classifies the person by the weight."),
    p("To use this app user should choose the age by sliding the slide, and enter the height and weight of the patient in the textboxes"),
    p("*notice that for this project we will only compute for men and age between 2 and 18 (child and teenager)"),
    h3('Please choose age'),
    sliderInput("age", 
                "between 2.5 and 18", 
                min = 2.5,
                max = 18, 
                value = 2.5,
                step = 0.5),
   
    h3('Please enter the height'),
    numericInput('Height', 'between 1 and 220 cm', 1, min = 0, max = 220, step= 1),
     h3('Please enter the weight'),
    numericInput('Weight', 'between 1 and 299 kg', 0, min = 0, max = 299, step= 1) 

    ),
        
  # shows the chart and BMI
  mainPanel(
    plotOutput("distPlot"),
    h3("The  BMI is"),
    verbatimTextOutput("BMI")

    )
  ))
