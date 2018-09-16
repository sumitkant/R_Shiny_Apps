library(plotly)
 
# 3D SCatterplot
set.seed(2016-07-21)
temp <- rnorm(100, mean=30, sd =5)
pressue <- rnorm(100)
dtime <- 1:100
plot_ly(x=temp, y=pressue, z =dtime, type="scatter3d", mode ="markers",
        color = temp)


# Line chart
data("airmiles")
plot_ly(x = time(airmiles), y = airmiles, width = 720, height=320, mode="lines")


# Histogram
iris
plot_ly(x = iris$Sepal.Length, type = 'histogram', xbins=20)

plot_ly(iris, y = ~Petal.Length, color = ~Species, type = 'box',
        width = 780, height=350)

# heatmap
terrain <- matrix(rnorm(100*100), nrow= 100, ncol=100)
plot_ly(z = terrain, type = 'heatmap', width = 780, height=370)

# Surface
terrain <- matrix(sort(rnorm(100*100)), nrow= 100, ncol=100)
plot_ly(z = terrain, type = "surface", width = 780, height=350)


# Chloropeth
# Create data frame
state_pop <- data.frame(State = state.abb, Pop = as.vector(state.x77[,1]))
# Create hover text
state_pop$hover <- with(state_pop, paste(State, '<br>', "Population:", Pop))
# Make state borders white
borders <- list(color = toRGB("red"))
# Set up some mapping options
map_options <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('white')
)

plot_ly(z = ~state_pop$Pop, text = ~state_pop$hover, locations = ~state_pop$State, 
        type = 'choropleth', locationmode = 'USA-states', 
        color = state_pop$Pop, colors = 'Blues', marker = list(line = borders)) %>%
  layout(title = 'US Population in 1975', geo = map_options)
