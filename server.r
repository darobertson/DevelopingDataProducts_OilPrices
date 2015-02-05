library(shiny)
library(Quandl)
library(dplyr)
library(ggplot2)

shinyServer(
    function(input, output) {
        
        data <- Quandl("OPEC/ORB")
        
        output$latestDate <- renderText ({data[1,"Date"]})
        output$latestPrice <- renderText ({data[1,"Value"]})

        output$oilPlot <- renderPlot({
            plotData <- filter(data, Date > input$dateRange[1], Date < input$dateRange[2] )
            ggplot(plotData, aes(Date, Value)) + geom_line(aes(colour='Actual Price')) + xlab("") + ylab("Price, USD") +
                geom_smooth(aes(colour='Smoothed Price')) + scale_colour_discrete("")
        })
        
        
        output$dateRangeText  <- renderText({
            paste(as.character(input$dateRange), collapse = " to ")
        })
    }
)