# Backend
library(ggplot2)

shinyServer(function(input, output) {
      
      calcSizes <- reactive({
            sizes <- numeric(input$t)
            sizes[1] <- input$n0
            for (i in 2:input$t) {
                  if (sizes[i-1] + input$r * (1 - sizes[i-1]/input$K) * sizes[i-1] <= 0) sizes[i] <- 0
                  else sizes[i] <- sizes[i-1] + input$r * (1 - sizes[i-1]/input$K) * sizes[i-1]
            }
            sizes
      })
      
      output$plot <- renderPlot({
            qplot(1:input$t, calcSizes()) + labs(x = "Time (t)", y = "Population size (n)") +
                  geom_line() + geom_hline(yintercept=input$K, color = "red")
      })
      
      output$table <- renderDataTable({ 
            results <- data.frame(1:input$t, round(calcSizes(),2))
            names(results) <- c("Time"," Population size")
            results
            })
}
)