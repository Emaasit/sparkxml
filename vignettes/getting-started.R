## ----setup, include=FALSE, eval = FALSE----------------------------------
#  knitr::opts_chunk$set(echo = TRUE)

## ----eval = FALSE--------------------------------------------------------
#  install.packages("sparklyr")

## ----eval = FALSE--------------------------------------------------------
#  library(devtools)
#  devtools::install_github("emaasit/sparkxml")

## ----eval = FALSE--------------------------------------------------------
#  library(sparklyr)
#  spark_install(version = "2.0.0")

## ----eval = FALSE--------------------------------------------------------
#  library(sparkxml)

## ----eval = FALSE--------------------------------------------------------
#  sc <- spark_connect(master = "local")

## ----eval = FALSE--------------------------------------------------------
#  books_file <- system.file("extdata", "books.xml", package = "sparkxml")
#  
#  books_df <- spark_read_xml(sc, path = books_file, table = "xml_table")
#  books_df

## ----eval = FALSE--------------------------------------------------------
#  library(dplyr)
#  books_df %>% group_by(genre) %>%
#    summarise(count = n(), avg.price = mean(price))

## ----eval = FALSE--------------------------------------------------------
#  spark_log(sc, n = 100)

## ----eval = FALSE--------------------------------------------------------
#  spark_disconnect(sc)

