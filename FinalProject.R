##############################
# Name: Suzanne Burger
##############################

# I am loading these librbaries
# I am laoding the readxl library to be able to import the data from an excel document
# I am using the ggplot2 library to create the visualization
# I am using the plotly library to make the visualization interactive
library(readxl)
library(ggplot2)
library(plotly)

# I am importing the data from the excel document
my_data <- read_excel("History of recessions.xls")

# I am making a list of all of the dates to be used for the visualization
# They are the same dates as the ones in the dataset
# I am creating this list so that all of the dates are in the same format
dates <- c("1854 December",
           "1857 June",
           "1858 December",
           "1860 October",
           "1861 June",
           "1865 April",
           "1867 December",
           "1869 June",
           "1870 Decemeber",
           "1873 October",
           "1879 March",
           "1882 March",
           "1885 May",
           "1887 March",
           "1888 April",
           "1890 July",
           "1891 May",
           "1893 January",
           "1894 June",
           "1895 December",
           "1897 June",
           "1899 June",
           "1900 December",
           "1902 September",
           "1904 August",
           "1907 May",
           "1908 June",
           "1910 January",
           "1912 January",
           "1913 January",
           "1914 December",
           "1918 August",
           "1919 March",
           "1920 January",
           "1921 July",
           "1923 May",
           "1924 July",
           "1926 October",
           "1927 November",
           "1929 August",
           "1933, March",
           "1937 May",
           "1938 June",
           "1945 February",
           "1945 October",
           "1948 November",
           "1949 October",
           "1953 July",
           "1954 May",
           "1957 August",
           "1958 April",
           "1960 April",
           "1961 February",
           "1969 December",
           "1970 November",
           "1973 November",
           "1975 March",
           "1980 January",
           "1980 July",
           "1981 July",
           "1982 November",
           "1990 July",
           "1991 March",
           "2001 March",
           "2001 November",
           "2007 December")

# This creates a new column in the dataset called date
# I am adding all of the values in the dates list to this column
# The index that the date is in is the same row that this code will place it in
my_data$date <- dates

# This creates the visualization
# I am using ggplot to create the visualization
# I created a bar chart with the the dates on the x axis and the number of cycles on the y axis
# I then used the coords_flip() function to have the bars be horizontal
# I created a gradient to color the bars and they are colored by the variable contraction
# darkred is on the low end (negative number) and limegreen is on the the high end (positive number)
# I used the stat = 'identity' in the geom_bar() function to create the bars because there is nothing to be counted
# I added the interactive element so that if a bar is hovered over the number of cycles and the contraction will appear
p <- ggplot(my_data, aes(x = date, y = `Cycles peak2peak/trough2trough`,
                         text = paste("Number of Cycles: ", `Cycles peak2peak/trough2trough`, 
                                      "\nContraction: ", Contraction))) +
  geom_bar(stat = 'identity', width = 0.9, aes(fill = Contraction)) +
  coord_flip() +
  scale_fill_gradient2(low = "darkred", mid = "darkorange1", high = "limegreen") +
  labs(title = "History of Recessions in the United States", 
       x = "Recession Start Month",
       y = "Number of Cycles") +
  theme_bw()


# This is used to make the visualization interactive
ggplotly(p, tooltip = "text")
