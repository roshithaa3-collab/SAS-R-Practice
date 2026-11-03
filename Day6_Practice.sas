/* PROC TRANSPOSE */

DATA LONG;
INPUT ID VISIT SCORE;
CARDS;
1 1 10
1 2 12
2 1 8
2 2 9
RUN;

proc sort data=long; 
by id; 
run;

proc transpose data=long out=wide(drop=_name_) prefix=visit;
by id;
id visit;
var score;
run;

proc transpose data=long out=wide prefix=visit;
by id;
id visit;
var score;
run;

proc transpose data=long out=wide prefix=visit;
by id;
id visit;
var score;
run;

proc transpose data=long out=wide;
by id;
id visit;
var score;
run;



data wide;
input id  t1 t2 t3;
cards;
1 10 12 15 
2 8  19 11 
run;

proc sort data=wide; 
by id; 
run;

proc transpose data=wide out=long(rename=(col1=score)) name=time;
by id;
var t1-t3;
run;

proc transpose data=wide out=long(rename=(col1=score)) name=time;
by id;
var t1 t2;
run;

/* Practice Questions */

/* Q1. Dataset bp: patient, week (1, 2, 3), sbp.  */
/*     Write code to make one row per patient with columns wk1, wk2, wk3. */

data bp;
input patient $ wk sbp;
cards;
p1 1 135
p1 2 140
p1 3 130
p2 1 125
p2 2 130
p2 3 150
run;

proc sort data = bp;
by patient;
run;

proc transpose data = bp out = wide(drop = _name_) prefix = wk;
by patient;
id wk;
var sbp;
run;

/* Q2. Dataset marks: student, math, science, english.  */
/*     Write code to make one row per student per subject, with the subject name in a column called subject  */
/*     and the marks in a column called marks. */

data marks;
input student $ math science english;
cards;
s1 80 75 90 
s2 70 85 60
run;

proc sort data = marks;
by student;
run;

proc transpose data = marks out = long(rename = (col1 = marks)) name = subject;
by student;
var math science english;
run;

/* Q3. Why do we run PROC SORT before PROC TRANSPOSE when using BY? */

/* ans: BY needs all rows of the same id to sit together. */
/* if the data isn't sorted, SAS stops with an error saying the data is not sorted in ascending order. */


data sales;
input region $ quarter sales;
cards;
north 1 100
north 2 120
north 3 90
south 1 80
south 2 95
south 3 110
run;

/* Q4. Make one row per region with columns q1, q2, q3. */

proc sort data = sales;
by region;
run;

proc transpose data = sales out = wide(drop = _name_) prefix = q;
by region;
id quarter;
var sales;
run;

data temp;
input city $ jan feb mar;
cards;
delhi 15 18 24
pune 22 25 28
run;

/* Q5. Make one row per city per month.  */
/*     Put the month name in a column called month and the temperature in a column called temp_val. */

proc sort data = temp;
by city;
run;

proc transpose data = temp out = long(rename = (col1 = temp_val)) name = month;
by city;
var jan feb mar;
run;

data labs;
input subj $ visit hb wbc;
cards;
s1 1 12 5000
s1 2 13 5200
s2 1 11 4800
s2 2 12 5100
run;

/* Q6. Transpose both hb and wbc so each subject has one row per lab test.  */
/*     Look at what _NAME_ shows and keep it this time. */

proc sort data = labs;
by subj;
run;

proc transpose data = labs out = lab_reports prefix = visit;
by subj;
id visit;
var hb wbc;
run;

proc transpose data = labs out = lab_reports(drop = _name_) prefix = visit;
by subj;
id visit;
var hb wbc;
run;

/* Q7. Without running it, what will the new column names be? Then run it and check.  */

proc transpose data=sales out=t1;
by region;
id quarter;
var sales;
run;

/* Q8. This code has 2 mistakes. Find and fix them. */

proc transpose data=sales out=wide;
by region;
id quarter;
var sales
run;

/* ans: In the statement options, after the var sales, "SemiColon" was missing which was called  */
/*      as "syntax error". And before running the PROC TRANSPOSE, we should run the PROC SORT */

/* Fixed Version: */

proc sort data = sales;
by region;
run;

proc transpose data = sales out = wide prefix = q; 
by region;
id quarter;
var sales;
run;

/* C1. Using labs, get one row per subject with columns hb1, hb2, wbc1, wbc2.  */

data labs;
input subj $ visit hb wbc;
cards;
s1 1 12 5000
s1 2 13 5200
s2 1 11 4800
s2 2 12 5100
run;

proc sort data = labs;
by subj;
run;

proc transpose data = labs out = info(rename = (col1 = hb1, col2 = hb2)) name = (wbc1, wbc2);
by subj;
var hb wbc;
run;

/* Fixed Code: */

proc transpose data = labs out = long1(rename = (col1 = value)) name = test;
by subj;
var hb wbc;
run;

data long2;
set long1;
colname = cats(test, visit);
run;

proc transpose data = long2 out = final(drop = _name_);
by subj;
id colname;
var value;
run;

/* C2. Using the wide dataset from the bp question (patient, wk1, wk2, wk3), transpose it back to long with  */
/* columns patient, week, sbp. Then use a data step to turn wk1 into the number 1. */

data bp;
input patient $ wk sbp;
cards;
p1 1 135
p1 2 140
p1 3 130
p2 1 125
p2 2 130
p2 3 150
run;

proc sort data = bp;
by patient;
run;

proc transpose data = bp out = wide(drop = _name_) prefix = wk;
by patient;
id wk;
var sbp;
run;

proc transpose data = wide out = long(rename = (col1 = wk)) name = sbp;
by patient;
var sbp;
run;

/* Fixed Code: */

proc transpose data = wide out = long(rename = (col1 = sbp)) name = wk;
by patient;
var wk1-wk3;
run;

data long2;
set long;
wk_num = input(substr(wk, 3), 8.);
run;





















 
























































































































































































































































