#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Using different predictors and percentage splits for training linear regression on the Boston dataset"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       h3("Select one of the values"),
       radioButtons("split_level", "Data % used for training:",
                    c("10%" = ".1",
                      "20%" = ".2",
                      "40%" = ".4",
                      "80%" = ".8")),
       radioButtons("attr", "Select Predictor",
                    c("crim" = "crim",
                      "zn" = "zn",
                      "chas" = "chas",
                      "age" = "age"))
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       h5("scatter plot of the criterion medv and the selected prectior with the corresonding regression line fitted using the selected percentage of training data"),
       plotOutput("distPlot")
    )
  )
))
