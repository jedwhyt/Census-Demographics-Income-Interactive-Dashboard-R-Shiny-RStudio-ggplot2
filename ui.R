# Load libraries
library(shiny)
library(tidyverse)

# Application Layout
shinyUI(
  fluidPage(
    br(),
    # TASK 1: Application title
    titlePanel("Trends in Demographics and Income"), 
    
    p("Explore the difference between people who earn less than 50K and more than 50K. You can filter the data by country, then explore various demogrphic information."),
    
    # TASK 2: Add first fluidRow to select input for country
    fluidRow(
      column(12, 
             wellPanel(
               selectInput(
                 inputId = "country",
                 label = "Select Country:",
                 choices = c(
                   "United-States",
                   "Canada",
                   "Mexico",
                   "Germany",
                   "Phillipines"
                 ),
                 selected = "United-States"
               )
             )
           )
    ),
    
    # TASK 3: Add second fluidRow to control how to plot the continuous variables
    fluidRow(
      column(3, 
             wellPanel(
               p("Select a continuous variable and graph type (histogram or boxplot) to view on the right."),
               radioButtons(
                 inputId = "continuous_variables",
                 label = "Select Continuous Variables:",
                 choices = c(
                   "Age" = "age",
                   "Hours per Week" = "hours_per_week"
                 ),
                  selected = "age" # add radio buttons for continuous variables
                   # add radio buttons for chart type
               ),
               radioButtons(
                 inputId = "graph_type",
                 label = "Select Chart Type:",
                 choices = c(
                   "Histogram" = "histogram",
                   "Boxplot" = "boxplot"
                 ),
                 selected = "histogram"
               )
             )
          ),
      column(9, plotOutput("p1"))  # add plot output
    ),
    
    # TASK 4: Add third fluidRow to control how to plot the categorical variables
    fluidRow(
      column(3, 
             wellPanel(
               p("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph. "),
               radioButtons(
                 inputId = "categorical_variables",
                 label = "Select Categorical Variable:",
                 choices = c(
                   "Workclass" = "workclass",
                   "Education" = "education",
                   "Sex" = "sex"
                 ),
                 selected = "workclass"
               ),    # add radio buttons for categorical variables
               checkboxInput(
                 inputId = "is_stacked",
                 label = "Stacked Bar Chart", 
                 value = FALSE
               )   # add check box input for stacked bar chart option
              )
             ),
      column(9, plotOutput("p2"))  # add plot output
    )
  )
)
