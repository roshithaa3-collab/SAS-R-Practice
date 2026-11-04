# GGPLOT2 # 

library(ggplot2)

View(mpg)

p <- ggplot(mpg, aes(x = displ, y = hwy)) + geom_point()

# Facets #

# facet_wrap:

p + facet_wrap(~class)

# facet_grid:

p + facet_grid(drv ~ cyl)

# Labels:

p + labs(
  title = "Engine Size vs Highway Mileage",
  subtitle = "Bigger engines use more fuel",
  x = "Engine size (L)",
  y = "Highway miles per gallon",
  caption = "Source: mpg dataset"
)

# Basic label:

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  labs(
    title = "Engine Size vs Highway Mileage",
    x = "Engine size (litres)",
    y = "Highway miles per gallon"
  )

# Legend label:

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  labs(
    title = "Mileage by Drive Type",
    color = "Drive type"
  )

# All labels together

ggplot(mpg, aes(x = displ, y = hwy, color = drv)) +
  geom_point() +
  labs(
    title = "Engine Size vs Highway Mileage",
    subtitle = "Bigger engines use more fuel",
    x = "Engine size (litres)",
    y = "Highway miles per gallon",
    color = "Drive type",
    caption = "Source: mpg dataset"
  )

# Practice questions:

# 1. Make a scatter plot of cty (x) vs hwy (y). 
#    Add the title "City vs Highway Mileage".
 
ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_point() + 
  labs(
    title = "City vs Highway Mileage"
  )

# 2. Rename the x-axis to "City mileage" and the y-axis to "Highway mileage".

ggplot(mpg, aes(x = cty, y = hwy)) + 
  geom_point() + 
  labs(
    title = "City vs Highway Mileage",
    x = "City mileage",
    y = "Highway mileage"
  )

# 3. Colour the points by class, and rename the legend to "Car type".

ggplot(mpg, aes(x = cty, y = hwy, color = class)) + 
  geom_point() + 
  labs(
    title = "City vs Highway Mileage",
    x = "City mileage",
    y = "Highway mileage",
    color = "Car type"
  )

# 4. Add a caption: "Data: mpg".

ggplot(mpg, aes(x = cty, y = hwy, color = class)) + 
  geom_point() + 
  labs(
    title = "City vs Highway Mileage",
    x = "City mileage",
    y = "Highway mileage",
    color = "Car type",
    caption = "Data: mpg"
  )
# Themes:

p <- ggplot(mpg, aes(x = cty, y = hwy, color = class)) + 
  geom_point() 

p + theme_bw()

p + theme_minimal()

p + theme_classic()

p + theme_dark()

p + theme_grey()

# Fine tuning with theme():

p + theme(legend.position = "Bottom")

p + theme(legend.position = "bottom")

p + theme(legend.position = "top")

p + theme(legend.position = "left")

p + theme(legend.position = "right")

# Changing text style:

p + labs(title = "City vs Highway Mileage") +
  theme(
    plot.title = element_text(size = 18, face = "bold", color = "blue"),
    axis.title = element_text(size = 12)
  )

# Use the plot p from above.

# 1. Apply theme_minimal(). What difference do you see compared to the 
#    grey default?

p + theme_minimal()
p + theme_grey()

# ans: background difference was noticed. In the minimal it shows no background, 
#      in the grey, it is grey background.

# 2. Apply theme_classic() and move the legend to the bottom.

p + theme(legend.position = "bottom") +
  theme_classic()

p + theme_classic() +
  theme(legend.position = "bottom")

# 3. Add the title "City vs Highway Mileage", make it bold and size 16.

p + labs(title = "City vs Highway Mileage") +
  theme(
    plot.title = element_text(size = 16, face = "bold", color = "red"),
    axis.title = element_text(size = 12)
  )

# 4. Hide the legend completely.

p + theme_grey() +
  theme(legend.position = "none")

# 5. Combine: theme_bw() + legend at top + bold title.

p + labs(title = "City vs Highway Mileage") +
  theme_bw() +
  theme(
    plot.title = element_text(size = 14, face = "bold", color = "green")) +
  theme(legend.position = "top")    
  
p + labs(title = "City vs Highway Mileage") +
  theme_bw() +
  theme(
    plot.title = element_text(size = 14, face = "bold", color = "green"),
    theme(legend.position = "top")
  )  




































































































































































































































































































































