/* PROC SORT */

PROC SORT DATA = SASHELP.CLASS OUT = WORK.SORTED;
BY SEX DESCENDING AGE;
RUN;

/* SORT IN TWO-LEVELS */

PROC SORT DATA = SASHELP.CLASS OUT = WORK.S1;
BY SEX DESCENDING AGE;
RUN;

/* KEEP ONE ROW PER GROUP */

PROC SORT DATA = SASHELP.CLASS OUT = WORK.S2 NODUPKEY;
BY SEX;
RUN;

/* FILTER THEN SORT */

PROC SORT DATA = SASHELP.CLASS OUT = WORK.S3;
WHERE AGE > 12;
BY NAME;
RUN;

/* PRACTICE QUESTIONS */

/* 1. Sort sashelp.class by age ascending, then weight descending, into work.q1. Print the first 5 rows. */

PROC SORT DATA = SASHELP.CLASS OUT = WORK.Q1;
BY AGE DESCENDING WEIGHT;
RUN;

PROC PRINT DATA = WORK.Q1 (OBS = 5);
RUN;

/* 2. Make a dataset with only the oldest student for each sex. */

PROC SORT DATA = SASHELP.CLASS OUT = WORK.OLDEST;
BY SEX DESCENDING AGE;
RUN;

PROC SORT DATA = WORK.OLDEST OUT = OLDEST_STUDENT NODUPKEY;
BY SEX;
RUN;

/* 3. What happens if you leave out out=? Predict first, then run it and check the log. */

/* FIRSTLY IT SHOWS ERROR IN THE LOG WINDOW, BECAUSE SAS DOESN'T FIND WHERE TO SORT THE DATA. */

PROC SORT DATA = SASHELP.CLASS;
BY SEX DESCENDING AGE;
RUN;

/* 4. Using sashelp.heart, sort by status and descending ageatstart. Print 10 rows with only those two columns. */

PROC SORT DATA = SASHELP.HEART OUT = SORTED_DATA;
BY STATUS DESCENDING AGEATSTART;
RUN;

PROC PRINT DATA = SORTED_DATA (OBS = 10);
VAR STATUS AGEATSTART;
RUN;

/* PROC FREQ */

PROC FREQ DATA = SASHELP.CLASS;
TABLES SEX AGE;
RUN;

/* COUNT ONE COLUMN */

PROC FREQ DATA = SASHELP.CLASS;
TABLES SEX;
RUN;
 
PROC FREQ DATA = SASHELP.CLASS;
TABLES AGE;
RUN;

/* CLEANER OUTPUT */

PROC FREQ DATA = SASHELP.CLASS ORDER = FREQ;
TABLES AGE / NOCUM;
RUN;

/* TWO-WAY TABLE */

PROC FREQ DATA = SASHELP.CLASS;
TABLES SEX*AGE / NOROW NOCOL NOPERCENT;
RUN;

/* PRACTICE QUESTIONS */

/* Use sashelp.class for 1 and 2, and sashelp.heart for 3 to 5. */

/* 1. Count how many students are in each age. Which age is the most common, and how many students have it? */

PROC FREQ DATA = SASHELP.CLASS ORDER = FREQ;
TABLES AGE;
RUN;

/* ANS: 12-5, 14-4, 15-4, 13-3, 11-2, 16-1. THE MOST COMMON AGE WAS 12 AND 5 STUDENTS HAVE IT.   */

/* 2. Make a two-way table of sex by age showing counts only (hide row, column, and percent). */

PROC FREQ DATA = SASHELP.CLASS;
TABLES SEX*AGE / NOROW NOCOL NOPERCENT;
RUN;

/* 3. In sashelp.heart, how many people are Alive and how many are Dead? What percent is dead? */

PROC PRINT DATA = SASHELP.HEART;
RUN;

PROC FREQ DATA = SASHELP.HEART;
TABLES STATUS / NOROW NOCOL NOCUM;
RUN;

/* ANS: ALIVE = 3218, DEAD = 1991. DEAD PERCENT = 38.22 */

/* 4. In sashelp.heart, make a two-way table of status by sex. Which sex has more deaths? */

PROC FREQ DATA = SASHELP.HEART;
TABLES STATUS*SEX;
RUN;

/* ANS: MALE*/

/* 5. Predict first, then run: what happens if you use tables weight; on sashelp.class? 
/* Why is it not a good idea? */

/* IF I USE TABLES WEIGHT ON SASHELP.CLASS, IT SHOWS ERROR OR WARNING!! BECAUSE WEIGHT COLUMN HAS  */
/* DIFFERENT VALUES SO IT CAN'T COUNT! AS LIKE SEX, AGE. */

PROC FREQ DATA = SASHELP.CLASS;
TABLES WEIGHT;
RUN;

/* CORRECT POINTS: */
/* ALMOST EVERY WEIGHT IS DIFFERENT, SO IT CAN'T GROUP LIKE SEX OR AGE.
/* RESULT: 15 ROWS, MOSTLY WITH A COUNT OF 1(5.26%), WHICH TELLS YOU NOTHING USEFUL. */
/* FOR NUMBERS LIKE WEIGHT, USE PROC MEANS. */
















































































