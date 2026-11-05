# Handling the missing values:

# NA breaks calculations:

x <- c(10, 20, NA, 40)
mean(x)

# one missing value makes the whole result unknown.

# Detect NAs:

is.na(x)

# is.na() marks the position.

sum(is.na(x))

# sum() counts the TRUEs.

# Ignore NAs:

mean(x, na.rm = TRUE)

# R skips the NA and averages 10, 20, 40.

# Replace NAs with the mean:

x[is.na(x)] <- mean(x, na.rm = TRUE)
x

# x[is.na(x)], selects only the missing spots, and we fill them with the mean.

# Data frame:

df <- data.frame(
  name = c("A","B","C"), 
  age = c(25, NA, 30))
colSums(is.na(df))
df[complete.cases(df), ]

# colSums(is.na(df)), counts NAs per column(Name = 0, age = 1).
# df[complete.cases(df), ], keeps only rows with no NAs( rows A and C).

# Practice Questions:

df2 <- data.frame(
  city = c("X","Y","Z","W"), 
  temp = c(30, NA, 28, NA)
  )
df2

# 1. Write code to count the NAs in each column.

colSums(is.na(df2))

# 2. Write code to keep only the complete rows.

df2[complete.cases(df2), ]

# 3. What will the output of question 2 look like? 
#   (Write the rows you expect.)

ans: rows X and Z

# Use v <- c(5, NA, 15, NA, 25) for Q1–Q4:

v <- c(5, NA, 15, NA, 25)
v

# 1. What does sum(v) return? Why?

sum(v)

# ans: It returns the NA.Bcz one missing value makes the whole result unknown.

# 2. Write code to count how many NAs are in v.

is.na(v)
sum(is.na(v))

# 3. Write code to find the average of v, ignoring NAs.

mean(v, na.rm = TRUE)

# 4. Write code to replace all NAs in v with 0.

v[is.na(v)] <- 0
v

# 5. For df <- data.frame(id = 1:4, score = c(80, NA, 90, NA)), 
#    write code to keep only rows without missing values.

df <- data.frame(
  id = 1:4, 
  score = c(80, NA, 90, NA)
  )
df

df[complete.cases(df), ]

# Use w <- c(12, NA, 8, NA, 20, 4):

w <- c(12, NA, 8, NA, 20, 4)
w

# 1. Replace the NAs in w with the mean of the other values.

w[is.na(w)] <- mean(w, na.rm = TRUE)
w

# w[is.na(w)] <- mean(w, na.rm = TRUE) gave 12 11 8 11 20 4.
# The mean of 12, 8, 20, 4 is 44 / 4 = 11, so both NAs became 11.

# 2. What does anyNA(w) return?

anyNA(w)

# ans: it returns FALSE.
#      it is FALSE because you replaced the NAs in Q1 first. 
#     Before Q1, it would have been TRUE. 

# ans: it returns FALSE

# 3. What does na.omit(w) return?

na.omit(w)

# na.omit(w) returned 12 11 8 11 20 4.
# Nothing was removed, since w no longer has NAs. 
# If you had run it before Q1, it would give 12 8 20 4.

# 4. Use df3 <- data.frame(name = c("A","B","C","D"), 
#                          marks = c(70, NA, 85, 60), 
#                          age = c(20, 21, NA, 22)):

df3 <- data.frame(
  name = c("A","B","C","D"), 
  marks = c(70, NA, 85, 60), 
  age = c(20, 21, NA, 22)
  )
df3

# Count the NAs in each column.

colSums(is.na(df3))

# Keep only the complete rows. Which names remain?

df3[complete.cases(df3), ]

# ans: kept rows A and D. B has a missing mark. C has a missing age
#      so both were removed.

# Use df4 <- data.frame(name = c("P","Q","R","S","T"), 
#                       score = c(90, NA, 75, NA, 60), 
#                       hours = c(5, 3, NA, 4, 2)):

df4 <- data.frame(
  name = c("P","Q","R","S","T"), 
  score = c(90, NA, 75, NA, 60), 
  hours = c(5, 3, NA, 4, 2)
  )
df4

# 1. Count the total NAs in the whole data frame (one number).

sum(is.na(df4))

# 2. Replace the NAs in score with the mean of score.

mean(df4$score, na.rm = TRUE)

df4$score[is.na(df4$score)] <- mean(df4$score, na.rm = TRUE)
df4

# 3. After Q2, count the NAs in each column again. What do you expect?

colSums(is.na(df4))

# 4. Remove the rows that still have NAs. Which names remain?

df4[complete.cases(df4), ]

# ans: rows p,q,s,t remains and row r is removed bcz it still has a NA.



























































































