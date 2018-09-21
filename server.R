require("glmnet") || install.packages("glmnet") 
require("MASS") || install.packages("MASS") 
require("ggplot2") || install.packages("ggplot2") 

library(shiny)
library(ggplot2)
library(MASS) 
library(glmnet)

# Define server logic required to draw a histogram
#https://cr-week4.shinyapps.io/FinalProject/
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    #split  <- faithful[, 2] 
    #bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    split = as.numeric(input$split_level)
    xattr = input$attr
    #assign("xattr", "zn")
    
    data = Boston
    subset = sample(nrow(data), nrow(data)*split)
    train = data[subset,]
    test = data[-subset,]
    
    
    #lm.fit = lm(medv~crim, train)
    #plot(data$crim, data$medv) 
    #abline(lm.fit)
    
    ggplot(data = data, aes_string(x = xattr, y = "medv")) + 
      geom_point(color='blue') +
      geom_smooth(method = "lm", data = train)
    
  })
  
})
