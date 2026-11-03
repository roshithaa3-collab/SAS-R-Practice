# The Grammer Of Graphics #

library(tidyverse)

# 1. Scatter plot

View(mpg)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

# 2. Map a variable to color

ggplot(mpg, aes(x = displ, y = hwy, color = class)) +
  geom_point()

# 3. Set a fixed color (outside aes)

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(color = "blue", size = 3)

ggplot(mpg, aes(displ, hwy)) + geom_point(size = 1)

ggplot(mpg, aes(displ, hwy)) + geom_point(size = 3)

ggplot(mpg, aes(displ, hwy)) + geom_point(size = 5)

#If you put size inside aes(), the point size depends on a variable:

ggplot(mpg, aes(displ, hwy, size = cty)) +
  geom_point()

# practice questions #

# 1. Make a scatter plot of cty (x) vs hwy (y).

ggplot(mpg, aes(x = cty, y = hwy)) + geom_point()

# 2. Color the points by drv.

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
  geom_point()

# 3. Make all points red and size 2.
 
ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
  geom_point(color = "red", size = 2)

# 4. What happens if you write aes(color = "blue") inside geom_point()? Why?

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
  geom_point(aes(color = drv), size = 2)

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) +
geom_point(aes(color = drv), size = 2)

# ans: aes(color = "blue") does not make the points blue.
#      Inside aes(), "blue" is treated as data, so ggplot2 makes a one-value
#      variable and gives it the default color (salmon-red), with a legend.
#      To set a fixed color, write it outside aes(): geom_point(color = "blue")

# Why: Everything inside aes() is a mapping from data to a visual property. 
#Plain text in aes() is treated as a data value, not as a color instruction.


# color from data, size fixed

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
geom_point(aes(color = class), size = 3)

# size from data, color fixed

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) + 
geom_point(aes(size = cty), color = "blue")

# both fixed

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) +
geom_point(color = "red", size = 2)

# both from data

ggplot(mpg, aes(x = cty, y = hwy, color = drv)) +
geom_point(aes(color = drv, size = cty))


# 1. Bar chart: how many cars per class? (R counts for you)

ggplot(mpg, aes(x = class)) +
  geom_bar()

ggplot(mpg, aes(x = class)) +
  geom_bar(fill = "steelblue")          

ggplot(mpg, aes(x = class, fill = drv)) +
  geom_bar()  

# 2. Histogram: distribution of highway mileage

ggplot(mpg, aes(x = hwy)) +
  geom_histogram(binwidth = 2)

# 3. Boxplot: hwy mileage for each drive type

ggplot(mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()

# 4. Line chart: unemployment over time

ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

# practice questions #

# 1. Make a bar chart of drv (how many cars per drive type).

ggplot(mpg, aes(x = drv)) + 
  geom_bar()

# 2. Make a histogram of cty with binwidth = 1.

ggplot(mpg, aes(x = cty)) + 
  geom_histogram(binwidth = 1)

# 3. Make a boxplot of class (x) vs hwy (y).

ggplot(mpg, aes(x = class, y = hwy)) +
  geom_boxplot()

# 4. Make a bar chart of class where the bars are colored by drv.

ggplot(mpg, aes(x = class, color = drv)) + 
  geom_bar()

ggplot(mpg, aes(x = class, fill = drv)) + 
  geom_bar()

# 5. Which geom would you use to show the relationship 
#    between displ and hwy? Why?

# ans: geom_point().Shows each row has a separate dot.


# Relationship: points

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point()

# Trend over time: line

View(economics)

ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line()

# You can also use both together when you have time data and 
# want to see each measurement:

ggplot(economics, aes(x = date, y = unemploy)) +
  geom_line() +
  geom_point()






















































