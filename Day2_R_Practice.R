# Tidyverse Package #

library(tidyverse)

shop <- data.frame(
  fruit = c("Apple","Banana","Mango","Grape","Orange","Kiwi"),
  type = c("Common","Common","Tropical","Common","Citrus","Tropical"),
  price = c(120, 40, 150, 90, 80, 200),
  stock = c(30, 100, 20, 0, 45, 10)
)
shop

# Filter: keep rows

shop %>% filter(price < 100)

# Filter with two conditions: & means "and", | means "or"

shop %>% filter ( type == "Tropical" & stock > 15)

# Select: Keep or drop columns

shop %>% select(fruit, price)

# minus means remove this column

shop %>% select(-price)

# Mutate: add a new column

shop %>% mutate(stock_value = price * stock)

# if_else: choose b/w two values

shop %>% mutate(status = if_else(stock == 0, "Out", "Available"))

# Arrange: sort rows

shop %>% arrange(price)

shop %>% arrange(desc(price))

# Count: how many rows per group

shop %>% count(type)

# group_by + summarise:

shop %>%
  group_by(type) %>%
  summarise(avg_price = mean(price), total_stock = sum(stock))

# A full Chain: read it top to bottom as steps

shop %>% 
  filter(stock > 0) %>%
  mutate(stock_value = price * stock) %>%
  select(fruit, stock_value) %>%
  arrange(desc(stock_value))

# Rename:

shop %>% rename(cost = price)


## Practice ##

books <- data.frame(
  title = c("Sky","River","Stone","Moon","Leaf","Fire","Wind"),
  genre = c("Fiction","Science","Fiction","Poetry","Science","Poetry","Fiction"),
  pages = c(300, 450, 220, 90, 380, 120, 260),
  rating = c(4.5, 4.0, 3.5, 4.8, 4.2, 3.9, 4.1)
)
books

# 1. Show only books with rating above 4.

books %>% filter(rating > 4)

# 2. Show only title and pages.

books %>% select(title, pages)

# 3. Add a column hours equal to pages / 50.

books %>% mutate( hours = pages / 50)

# 4. Sort the books by pages, highest first.

books %>% arrange(desc(pages))

# 5. Use count() to find how many books are in each genre.

books %>% count(genre)

# 6. Add a column size that says "Long" if pages >= 250, otherwise "Short".

books %>% mutate(column_size = if_else(pages >= 250, "Long", "Short"))

books %>% mutate(size = if_else(pages >= 250, "Long", "Short"))

# 7. Challenge: keep books with pages > 100, 
#    then find the average rating per genre.

books %>% 
  filter(pages > 100) %>%
  group_by(genre) %>%
  summarise(avg_rating = mean(genre))

books %>% 
  filter(pages > 100) %>%
  group_by(genre) %>%
  summarise(avg_rating = mean(rating))


movies <- data.frame(
  title = c("Orbit","Harbor","Dune2","Candy","Ghost","Pixel","Storm","Echo"),
  category = c("SciFi","Drama","SciFi","Kids","Horror","Kids","Drama","Horror"),
  minutes = c(130, 95, 155, 80, 105, 90, 140, 100),
  budget = c(50, 20, 90, 15, 10, 25, 40, 12),
  score = c(8.1, 7.0, 8.6, 6.5, 6.8, 7.2, 7.9, 6.1)
)
movies

# 1. Show only movies with score of 7 or more.

movies %>% filter(score >= 7)

# 2. Show only title and budget.

movies %>% select(title, budget)

# 3. Add a column hours equal to minutes / 60.

movies %>% mutate(hours = minutes / 60)

# 4. Sort by score, lowest first.

movies %>% arrange(score)

# 5. Use count() to see how many movies are in each category.

movies %>% count(category)

# 6. Add a column length that says "Long" if minutes > 120, otherwise "Normal".

movies %>% mutate(length = if_else(minutes > 120, "Long", "Normal"))

# 7. Show only SciFi movies

movies %>% filter(category == "SciFi")

# 8. Find the highest budget for each category.

movies %>%
  group_by(category) %>%
  summarise(highest_budget = max(budget))

# 9. Challenge: keep movies with minutes < 150, 
# add a column cost_per_min equal to budget / minutes, 
# keep only title and cost_per_min, then sort highest first.

movies %>%
  filter(minutes < 150) %>%
  mutate(cost_per_min = budget / minutes) %>%
  select(title, cost_per_min) %>%
  arrange(desc(cost_per_min))

# 10. Challenge: find the average score and the number of movies for each 
#     category, using one summarise().

movies %>%
  group_by(category) %>%
  summarise(avg_score = mean(score), n_movies = n())


cafe <- data.frame(
  item = c("Latte","Mocha","Tea","Cake","Muffin","Juice","Cookie","Soda"),
  kind = c("Drink","Drink","Drink","Food","Food","Drink","Food","Drink"),
  price = c(5, 6, 3, 7, 4, 4, 2, 3),
  sold = c(40, 25, 60, 15, 30, 20, 50, 45),
  calories = c(190, 290, 0, 400, 350, 120, 160, 140)
)
cafe

# 1. Show only items where kind is "Food".

cafe %>% filter(kind == "Food")

# 2. Show only items with price above 4.

cafe %>% filter(price > 4)

# 3. Find the highest price for each kind.

cafe %>%
  group_by(kind) %>%
  summarise(highest_price = max(price))

# 4. Find the average calories for each kind, and name the column avg_cal.

cafe %>%
  group_by(kind) %>%
  summarise(avg_cal = mean(calories))

# 5. Count how many items are in each kind using summarise() and n().

cafe %>%
  group_by(kind) %>%
  summarise(count = n())

# 6. Add revenue equal to price * sold, then sort highest first.

cafe %>%
  mutate(revenue = price * sold) %>%
  arrange(desc(revenue))

# 7. Challenge: keep only "Drink" items, add revenue = price * sold, 
#    keep only item and revenue, then sort highest first.

cafe %>%
  filter(kind == "Drink") %>%
  mutate(revenue = price * sold) %>%
  select(item, revenue) %>%
  arrange(desc(revenue))

# 8. Challenge: for each kind, find the total sold and 
#    the highest price in one summarise().

cafe %>%
  group_by(kind) %>%
  summarise(total_sold = sum(sold), max(price))





















































































































































































































