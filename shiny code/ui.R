library(shiny)

shinyUI(pageWithSidebar(
    headerPanel('Developing Data Products Course Project'),
    sidebarPanel(
        sliderInput('slider', 'Parent Height:', value = 68.2, min = 63, max = 73, step = 0.1),
        submitButton("Submit"),
        h4("Results"),
        h5("Parents height in inches:"),
        verbatimTextOutput('text1'),
        h5("Expected children's height in inches:"),
        verbatimTextOutput('text2'),
        h5("With a 95% confidence interval of:"),
        verbatimTextOutput('text3')
        
        
        ),
    
    mainPanel(
        
        h3("Children's Height Predict application"),
        h5("Data Source:"),
        p("This application uses",code('galton'),"in" , code('UsingR'), " library  which is a tabulated data set used by Galton in 1885 to study the relationship between a parent’s height and their childrens."),
        h5("methods"),
        p("Based on the average of height of father and mother(which call midparent), we predict the height of child by using linear model in inches."),
        plotOutput('plot'),
        p("The blue line means the parent's height that you selected, the yellow line represents the linear regression model")
        
        )
    
    
    
    
))