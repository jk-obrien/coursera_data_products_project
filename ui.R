library(shiny)
library(shinyBS)

shinyUI(pageWithSidebar(
    headerPanel("Investment Planner"),
    sidebarPanel(
        h3('Input'),
        sliderInput('P', 'Amount Invested', 1000, min=100, max=10000, step=100),
        bsTooltip(
            id='P', title='How much money to invest', trigger='hover'
        ),
        numericInput('r', 'Interest Rate (%)', 1, min=0.25, max=10, step=0.25),
        bsTooltip(
            id='r', title='Percentage interest paid', trigger='hover'
        ),
        radioButtons(
            'n', 'How often is interest added?',
            choices = list(
                'Daily' = 365,  'Weekly' = 52,
                'Monthly' = 12, 'Quarterly' = 4, 'Annually'=1
            ),
            selected = 1
        ),
        bsTooltip(
            id='n', title='How often interest is paid', trigger='hover'
        ),
        sliderInput('t', 'Years',value=5, min=5, max=25, step=1),
        bsTooltip(
            id='t', title='How long to invest for', trigger='hover'
        ),
        submitButton('Calculate')
  ),
  mainPanel(
      h3('Documentation'),
      p("This application, written with the R library 'shiny', produces a graph showing the return on an investment, based on user supplied parameters."),
      p("You can adjust these parameters on the left of the screen. They should be self-explanatory. Please press 'Submit' when you're ready and the application will re-draw the graph."),
      h3('Forecast'),
      plotOutput('newPlot'),
      p('You can download the code for this application from this ',a('github repository.', href='https://github.com/jk-obrien/coursera_data_products_project.git'))
  )
))
