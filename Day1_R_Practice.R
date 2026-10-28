# Variables and Vectors#

Age<- 25
Age

Name<- 'Ramana'
Name

Scores<- c(45, 67,43)
Scores

Scores + 10
mean(Scores)
Scores[2]
Scores[Scores > 50]

# Practice Questions #

# 1. Create a variable price with the value 50. Then calculate price * 3.

price<- 50
price

price*3

# 2. Create a vector temps with the values 22, 30, 25, 18. 
#Find the maximum temperature.

temps<- c(22, 30, 25, 18)
temps
max(temps)

# 3. From temps, show only the values greater than 20.

temps[temps>20]

# Data Frames #

students<-data.frame(
  name = c("Ana", "Raj", "Sam", "Lia"),
  age = c(20, 22, 21, 23),
  score = c(85, 70, 90, 60)
)
students

# Commands:
nrow(students)
names(students)
students$score
mean(students$score)
students[students$score > 75]
students[students$score > 75,]

# Practice Questions #

# 1.Create the students table above, then:
# 2.Show only the age column.
# 3.Find the average age.
# 4.Show only the rows where age is greater than 21.

students<-data.frame(
  name = c("Ana", "Raj", "Sam", "Lia"),
  age = c(20, 22, 21, 23),
  score = c(85, 70, 90, 60)
)
students

students[2]

mean(students$age)

students[students$age > 21,]

# Tidyverse and dplyr #

library(tidyverse)

students %>% filter(age > 20) %>%
  select(name, score) %>%
  arrange(desc(score))

# Practice Questions #

#Using students and dplyr:
# 1. Show only students with score greater than 65.
# 2. Show only the name and age columns.
# 3. Add a new column called double_score that equals score * 2.
# 4. Sort the table by score, highest first.

students %>% filter(score > 65) 
students %>% select(name, age)
students %>% mutate(double_score = score*2) 
students %>% arrange(desc(score))

# Now try one chain. Using students:
# 1. Keep students with score >= 70.
# 2. Add a column bonus_score equal to score + 5.
# 3. Keep only name and bonus_score.
# 4. Sort by bonus_score, highest first.

students %>%
  filter(score >= 70) %>%
  mutate(bonus_score = score + 5) %>%
  select(name, bonus_score) %>%
  arrange(desc(bonus_score))

# Summarising and Grouping #

class_data<- data.frame(
  name = c("Ana", "Raj", "Sam", "Lia", "Tom", "Eva"),
  gender = c("F", "M", "M", "F", "M", "F"),
  score = c(85, 70,90, 60, 75, 95)
)
class_data

# Summarise Whole Table #

class_data %>% summarise(avg_score = mean(score))

# Group, then summarise(per group)

class_data %>% 
  group_by(gender) %>%
  summarise(avg_score = mean(score), n_students = n())

class_data %>% 
  summarise(avg_score = mean(score), n_students = n())

# Practice Questions #

# Using class_data:
# 1. Find the highest score in the whole table 
# 2. Find the average score for each gender.
# 3. Count how many students are in each gender group.
# 4. Challenge: keep only students with score > 65, 
# then find the average score per gender.

class_data %>%
    summarise(highest_score = max(score))

class_data %>%
     group_by(gender) %>%
     summarise(avg_score = mean(score))

class_data %>%
  group_by(gender) %>%
  summarise(avg_score = mean(score), n_students = n())

class_data %>%
  filter(score > 65) %>%
  select(name)

class_data %>%
  filter(score > 65) %>%
  group_by(gender) %>%
  summarise(avg_score = mean(score))

# Using class_data (columns: name, gender, score), try these:
# 1. Show only the rows where gender is "M".
# 2. Add a new column grade that equals score - 10.
# 3. Sort the table by score, lowest first.
# 4. Challenge: find the highest score for each gender.

class_data %>%
  filter(gender == "M")

class_data %>%
  mutate(grade = score - 10)

class_data %>%
  arrange(-desc(score))

class_data %>%
  group_by(gender) %>%
  summarise(highest_score = max(score))














































