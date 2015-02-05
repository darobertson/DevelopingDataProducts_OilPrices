library(shiny)


 shinyUI(pageWithSidebar(
         headerPanel("Crude Oil Price (OPEC), USD"),
         sidebarPanel(
             strong("Usage:"),
             p("Select the desired time period"),
             p("the date format is yyyy-mm-dd"),
             dateRangeInput("dateRange", "Date range:",
                            start = Sys.Date()-365,
                            end = Sys.Date(), min = '2003-01-02', max=Sys.Date())
             ),
         mainPanel(
                strong('Selected date range:'),
                verbatimTextOutput("dateRangeText"),
                strong("Crude Oil Price (OPEC), USD"),
                plotOutput("oilPlot"),
                strong("Documentation:"),
                p("The application displays OPEC Crude Oil prices in USD for the selected time period. "),
                p("The data is obtained by using Quandl R package."),
                p("The oil prices data is available from 2003-01-02")
             )
    ))
