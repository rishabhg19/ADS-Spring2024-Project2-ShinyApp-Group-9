
if (!require("shiny")) {
  install.packages("shiny")
  library(shiny)
}
if (!require("shinyWidgets")) {
  install.packages("shinyWidgets")
  library(shinyWidgets)
}
if (!require("shinythemes")) {
  install.packages("shinythemes")
  library(shinythemes)
}
if (!require("leaflet")) {
  install.packages("leaflet")
  library(leaflet)
}
if (!require("leaflet.extras")) {
  install.packages("leaflet.extras")
  library(leaflet.extras)
}
library(shiny)
library(ggplot2)
library(httr)
library(jsonlite)
library(dplyr)
library(DT)
library(leaflet)
library(plotly)
library(lubridate)
library(corrplot)
shinyUI(
  fluidPage(
    h1("Exploring Flood Vulnerability through National Flood Insurance Program (NFIP) Claims"),
    h3("STAT5243 Applied Data Science Spring 2024"),
    h3("Group 9"),
    mainPanel(
      tabsetPanel(
        tabPanel("Damages", 
                 titlePanel("Reported Flood Damage Map"),
                 leafletOutput("floodMap"),
                 htmlOutput("mapText")
        ),
        tabPanel("NFIP Claims", 
                 htmlOutput("space"),
                 plotlyOutput("claimsFreq"),
                 htmlOutput("explanation1"),
                 htmlOutput("externalLink"),
                 plotlyOutput("buildingTypes"),
                 plotlyOutput("stateClaims"),
                 htmlOutput("zipAnalysis"),
        ),
        tabPanel("Flood Zones", 
                 titlePanel("Flood Zones and Hazard Areas"),
                 plotlyOutput("floodZone"),
                 htmlOutput("zoneAnalysis"),
                 plotlyOutput("sfhaPie"),
                 htmlOutput("mfhaText")
        ),
        tabPanel("Causes", 
                 titlePanel("What is causing all the NFIP claims?"),
                 plotlyOutput("causeAL"),
                 plotlyOutput("floodProofing"),
                 htmlOutput("floodProofText"),
                 htmlOutput("conclusions")
        ),
        tabPanel("Appendix", 
                 titlePanel("National Flood Insurance Policy (NFIP) Claims Table"),
                 DTOutput("claimsTable")
        ),
      )
    )
  ) #Shiny UI closing   
)
