# ブラウザの再読み込みをしたらコード全体が変化するのか、の実験
# 結論：しない。データを更新したいときは、明示的なコードを書く必要あり

library(shiny)
library(tidyverse)
library(httr)


downLoadData <- function(){
  # 現在時刻を返してくれるAPI
  url <- "https://ntp-a1.nict.go.jp/cgi-bin/json"
  ret <- GET(url) %>% content
  ret$st
}

dat <- downLoadData()

ui <- fluidPage(
  h1("現在時刻"),
  textOutput("time")
)

server <- function(input, output, session){
  output$time <- renderText(as.character(dat))
}

shinyApp(ui, server)
