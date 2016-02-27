library(shiny)
library(ggplot2)
library(scales)

shinyServer(
    function(input, output) {
        output$newPlot <- renderPlot({
            invPeriod <- seq(0,{input$t})
            invRate   <- {input$r} / 100
            compFreq  <- as.numeric({input$n})
            expVec    <- compFreq * invPeriod
            invReturn <- {input$P} * (1 + invRate/compFreq) ^ expVec

            plotTitle <- paste0(
                "Return on Investment of ",
                format({input$P}, big.mark=",", trim=TRUE),
                " at ", {input$r}, "% Interest, Compounded ",
                {input$n}, " Times per Year."
            )
            ggplot(data=NULL, aes(x=invPeriod, y=invReturn)) +
                xlab("Years Invested") +
                ylab("Value") +
                ggtitle(plotTitle) +
                geom_line() +
                scale_y_continuous(labels = comma)

        })
    }
)
