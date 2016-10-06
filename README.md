Read xml data files into Spark DataFrames
=========================================

What is sparkxml?
-----------------

sparkxml is an extension for sparklyr to read xml data files into Spark
DataFrames. It uses the Spark package spark-xml to load xml data into
Spark DataFrames.

Installation
------------

sparkxml requires the sparklyr package to run

### Install sparklyr

I recommend the latest stable version of sparklyr available on CRAN

    install.packages("sparklyr")

### Install sparkxml

Install the development version of sparkxml from this Github repo using
devtools

    library(devtools)
    devtools::install_github("emaasit/sparkxml")

Connecting to Spark
-------------------

If Spark is not already installed, use the following sparklyr command to
install your preferred version of Spark:

    library(sparklyr)
    spark_install(version = "2.0.0")

The call to `library(sparkxml)` will make the sparkxml functions
available on the R search path and will also ensure that the
dependencies required by the package are included when we connect to
Spark.

    library(sparkxml) 

We can create a Spark connection as follows:

    sc <- spark_connect(master = "local")

Reading xml files
-----------------

sparkxml provides the function `spark_read_xml` to read xml data files
in .xml format into Spark DataFrames. It uses a Spark package called
spark-xml. Here's an example.

In the example below, we read a xml data file called books.xml into a
table called xml\_table in Spark. This file is available
[here](https://github.com/databricks/spark-xml/raw/master/src/test/resources/books.xml).

    $ wget https://github.com/databricks/spark-xml/raw/master/src/test/resources/books.xml

    books_file <- system.file("extdata", "books.xml", package = "sparkxml")

    books_df <- spark_read_xml(sc, path = books_file, table = "xml_table")
    books_df

The resulting pointer to a Spark table can be further used in dplyr
statements.

    library(dplyr)
    books_df %>% group_by(genre) %>%
      summarise(count = n(), avg.price = mean(price))

Logs & Disconnect
-----------------

Look at the Spark log from R:

    spark_log(sc, n = 100)

Now we disconnect from Spark:

    spark_disconnect(sc)

Acknowledgements
----------------

Thanks to RStudio for the sparklyr packages that provides functionality
to create Extensions.
