# Simple script analysing the Australian weather data

library("tidyverse")

# Read in the data

df = read_csv("data/weatherAUS.csv")

# Create a scatter plot of Humidity9am and Temp9am
# a location

city = "Brisbane"

scatter_plot = 
df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Temp9am, y = Humidity9am)) + 
  geom_point(color = 'red') + 
  ggtitle('Scatter plot of Tempature v Humidity in Brisbane
          Based on Wind Direction') + 
  theme_minimal() + 
  facet_wrap(~WindDir9am)

# Save the plot in graphics/
ggsave(filename = "graphics/scatter-temp-humidity.png", plot = scatter_plot,
       width = 1920, height = 1200, units = 'px')

## making time series plot
time_series =
  df %>%
  filter(Location == city) %>%
  ggplot(aes(x = Date, y = Temp9am)) +
  geom_line()

ggsave(filename = "graphics/timeseries-rainfall.png",
       plot = time_series,
       width = 1920, height = 1200, units = 'px')
