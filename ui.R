# Frontend

shinyUI(fluidPage(
      titlePanel("Illustrating the logistic growth model"),
      
      sidebarLayout(
            sidebarPanel(
                  p("Set your model parameters below."),
                  numericInput("K", label = "Carrying capacity (K)", value = 1000),
                  numericInput("r", label = "Intrinsic growth rate (r)", value = 1),
                  numericInput("n0", label = "Starting population size", value = 10),
                  numericInput("t", label = "Number of time steps to project", value = 50),
                  submitButton("Plot!")
            ),
            
            mainPanel(
                  p("This app uses the discrete-time logistic population growth model 
                    to project the size of a population into the future. Under this model,
                    a population is assumed to have a carrying capacity (K), the population
                    size than can be supported. Below this number, the population grows, while
                    above it it shrinks. The growth rate (r) determines how fast the population
                    grows when far below the carrying capacity (i.e. in the absence of
                    density-dependence)."),
                  withMathJax(p("The difference equation of the model has the following form: 
                                $$\\Delta n=n(t+1)-n(t)=r \\cdot (1-\\frac{n(t)}{K})\\cdot n(t)$$")),
                  p("To start, enter your parameters in the left panel. When you are ready, click the
                    Plot! button to visualize the population trajectory. Make sure your parameters are 
                    positive and that numbers are not too large. Try varying the intrinsic growth rate
                    from 0.5 to 3.1 in steps of 0.4 to visualize the oscillatory behavior of the model.
                    You can see the model results in table form below the plot."),
                  plotOutput("plot"),
                  dataTableOutput("table")
            )
      )
))
