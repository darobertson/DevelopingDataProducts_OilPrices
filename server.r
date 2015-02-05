library(shiny)
library(Quandl)
library(dplyr)
library(ggplot2)
library(rCharts)

shinyServer(
    function(input, output) {
        
        data <- Quandl("OPEC/ORB")
        
        output$oilPlot <- renderPlot({
            plotData <- filter(data, Date > input$dateRange[1], Date < input$dateRange[2] )
            ggplot(plotData, aes(Date, Value)) + geom_line(aes(colour='Actual Price')) + xlab("") + ylab("Price, USD") +
                geom_smooth(aes(colour='Smoothed Price')) + scale_colour_discrete("")
        })
        
#   rcharts attempt - too slow and bad date formatting        
#        output$oilPlot <- renderChart({
#            plotData <- filter(data, Date > input$dateRange[1], Date < input$dateRange[2] )
#            dPlot(Value ~ Date, data = plotData, type='line')
        })
        
        
        output$dateRangeText  <- renderText({
            paste(as.character(input$dateRange), collapse = " to ")
        })
    }
)