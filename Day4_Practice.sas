/* PROC MEANS */

DATA PATIENTS;
INPUT ID SEX $ AGE WEIGHT SBP;
CARDS;
1 M 45 80 130 
2 F 38 62 118 
3 M 52 90 145
4 F 29 55 110
5 F 61 70 150
6 M 34 76 122
RUN;

PROC MEANS DATA = PATIENTS N MEAN MIN MAX MAXDEC = 1;
CLASS SEX;
VAR AGE SBP;
RUN;

/* PRACTICE QUESTIONS */

/* Here are your PROC MEANS questions, using the patients dataset: */

/* 1. Get only the mean and max of weight, with 2 decimals. */

PROC MEANS DATA = PATIENTS MEAN MAX MAXDEC = 2;
VAR WEIGHT;
RUN;

/* ANS: MEAN = 72.17, MAX = 90.00 */

/* 2. Get N, mean, min, and max of age and sbp for each sex. */

PROC MEANS DATA = PATIENTS N MEAN MIN MAX ;
CLASS SEX;
VAR AGE SBP;
RUN;

/* ANS: FEMALE MEAN AGE 42.67, MEAN SBP 126. MALE MEAN AGE 43.67, MEAN SBP 132.33 */

/* 3. Get the mean sbp for each sex and save it to a dataset called sbp_stats. Then use PROC PRINT to view it. */

PROC MEANS DATA = PATIENTS MEAN;
CLASS SEX;
VAR SBP;
OUTPUT OUT = SBP_STATS MEAN = MEAN_SBP;
RUN;

PROC PRINT DATA = SBP_STATS;
RUN;

/* 4. Sort patients by sex, then use BY sex instead of CLASS sex in PROC MEANS.  */
/*    What difference do you notice in the output? */

PROC SORT DATA = PATIENTS OUT = SORTED_DATA;
BY SEX;
RUN;

PROC MEANS DATA = SORTED_DATA;
CLASS SEX;
RUN;

PROC MEANS DATA = SORTED_DATA;
BY SEX;
RUN;

/* ANS: CLASS: GAVE ONE COMBINED TABLE AND THE DATA DID NOT NEED SORTING. */
/*      BY: GAVE SEPARATE TABLES ( SEX = F, SEX = M), AND THE DATA HAD TO BE SORTED FIRST. */

/* 5. Get the mean weight only for patients older than 40. */

PROC MEANS DATA = PATIENTS MEAN;
VAR WEIGHT;
WHERE AGE > 40;
RUN;

ANS: MEAN WEIGHT = 80 FOR PATIENTS OLDER THAN 40

/* 6. Challenge: Get the mean and standard deviation of sbp, and  */
/*    save them to a dataset with the names avg_sbp and sd_sbp. */

PROC MEANS DATA = PATIENTS MEAN STDDEV;
VAR SBP;
OUTPUT OUT = AVG_SBP MEAN = AVG_SBP;
OUTPUT OUT = SD_SBP STDDEV = SD_SBP;
RUN;

/* ANS:  */

PROC MEANS DATA = PATIENTS MEAN STDDEV;
VAR SBP;
OUTPUT OUT = SBP_SUMMARY MEAN = AVG_SBP STDDEV = SD_SBP;
RUN;

/* PROC PRINT */

/* USE PATIENTS DATASET. */
/* 1. SHOW EVERYTHING */

PROC PRINT DATA = PATIENTS;
RUN;

/* 2. FIRST 3 ROWS, SELECTED COLUMNS, NO ROW NUMBERS */

PROC PRINT DATA = PATIENTS (OBS = 3) NOOBS;
VAR ID AGE SBP;
RUN;

PROC PRINT DATA = PATIENTS (OBS = 3) NOOBS;
VAR SEX AGE SBP;
RUN;

/* 3. FILTER ROWS */

PROC PRINT DATA = PATIENTS;
WHERE SEX = "M" AND SBP > 125;
RUN;

/* 4. USE ID AND TOTAL */

PROC PRINT DATA = PATIENTS;
ID ID;
VAR SEX WEIGHT;
SUM WEIGHT;
RUN;

PROC PRINT DATA = PATIENTS;
ID ID;
VAR SEX WEIGHT SBP;
SUM  WEIGHT SBP;
RUN;

/* USE A LABEL */

PROC PRINT DATA = PATIENTS LABEL;
LABEL SBP = "Systolic BP";
VAR ID SBP;
RUN;

/* PRACTICE QUESTIONS */

/* Use the patients dataset. */

/* 1. Print the whole dataset. */

PROC PRINT DATA = PATIENTS;
RUN;

/* 2. Print only the first 4 rows. */

PROC PRINT DATA = PATIENTS (OBS = 4);
RUN;

/* 3. Print only id and weight, with no row-number column. */

PROC PRINT DATA = PATIENTS NOOBS;
VAR ID WEIGHT;
RUN;

/* 4. Print only female patients. */

PROC PRINT DATA = PATIENTS;
VAR ID SEX AGE WEIGHT SBP;
WHERE SEX = "F";
RUN;

/* 5. Print patients with age over 40 and sbp over 130. */

PROC PRINT DATA = PATIENTS;
VAR ID AGE SBP;
WHERE AGE > 40 AND SBP > 130;
RUN;

/* 6. Print id, sex, and weight, use id as the identifier, and show the total of weight. */

PROC PRINT DATA = PATIENTS;
ID ID;
VAR SEX WEIGHT;
SUM WEIGHT;
RUN;

/* 7. Give sbp the label "Systolic BP" and print id and sbp so the label appears. */

PROC PRINT DATA = PATIENTS LABEL;
LABEL SBP = "Systolic BP";
VAR ID SBP;
RUN;

/* 8. Challenge: Print only the first 3 male patients, with id and age, no row numbers. */

PROC PRINT DATA = PATIENTS (OBS = 3) NOOBS;
VAR ID AGE;
WHERE SEX = "M";
RUN;

/* PROC FORMAT */

proc format;
  value $sexf 'M' = 'Male'
              'F' = 'Female';
run;

DATA PATIENTS2;
SET PATIENTS;
FORMAT SEX $SEXF.;
RUN;

PROC PRINT DATA = PATIENTS2;
RUN;

/* 1. CHARACTER FORMAT */

PROC FORMAT;
VALUE $SEXF "M" = 'Male'
            "F" = 'Female';
RUN;

PROC PRINT DATA = PATIENTS;
FORMAT SEX $SEXF.;
RUN;

/* NUMERIC RANGE FORMAT */

PROC FORMAT;
VALUE AGEGRP LOW-<40 = 'Under 40'
             40-<60  = '40 to 59'
             60-high = '60 and above';
RUN;

PROC PRINT DATA = PATIENTS;
VAR ID AGE;
FORMAT AGE AGEGRP.;
RUN;
       
/* USING OTHER        */

PROC FORMAT;
VALUE $SEXF 'M' = 'Male'
            'F' = 'Female'
            OTHER = 'Unknown';
RUN;

/* FORMAT INSIDE PROC FREQ ( VERY USEFUL IN GROUPING) */

PROC FREQ DATA = PATIENTS;
TABLES AGE;
FORMAT AGE AGEGRP.;
RUN;

/* FORMAT INSIDE PROC MEANS */

PROC MEANS DATA = PATIENTS MEAN;
CLASS SEX;
VAR SBP;
FORMAT SEX $SEXF.;
RUN;

/* PRACTICE QUESTIONS */
/* Use the patients dataset. */

/* 1. Create a format $sexf so that M shows as "Male" and F shows as "Female". Apply it in a PROC PRINT. */

PROC FORMAT;
VALUE $SEXF 'M' = 'Male'
            'F' = 'Female';
RUN;

PROC PRINT DATA = PATIENTS;
VAR ID SEX AGE SBP;
FORMAT SEX $SEXF.;
RUN;

/* 2. Create a format agegrp: below 40 = "Young", 40 to 54 = "Middle", 55 and above = "Senior".  */
/* Print id and age with it applied. */

PROC FORMAT;
VALUE AGEGRP Low-<40 = "Young"
             40 to 54 = "Middle"
             55-High = "Senior";
RUN;

PROC PRINT DATA = PATIENTS;
VAR ID AGE;
FORMAT AGE AGEGRP.;
RUN;

/* ANS: */

PROC FORMAT;
VALUE AGEGRP Low-<40 = "Young"
             40-54 = "Middle"
             55-High = "Senior";
RUN;

PROC PRINT DATA = PATIENTS;
VAR ID AGE;
FORMAT AGE AGEGRP.;
RUN;

/* 3. Create a format sbpgrp: below 120 = "Normal", 120 to 139 = "Elevated", 140 and above = "High".  */
/*    Print id and sbp with it applied. */

proc format;
value sbpgrp Low-<120 = "Normal"                 
             120 to 139 = "Elevated"
             140-High = "High";
run;

proc print data = patients;
var id sbp;
format sbp sbpgrp.;
run;

/* ANS: */

proc format;
value sbpgrp Low-<120 = "Normal"                 
             120-139 = "Elevated"
             140-High = "High";
run;

proc print data = patients;
var id sbp;
format sbp sbpgrp.;
run;

/* 4. Use PROC FREQ with tables age; and the agegrp. format. How many patients fall in each group? */

proc freq data = patients;
tables age;
format age agegrp.;
run;
           
/* my-ans: Young 40 = 3, 45 = 1, 52 = 1, Senior = 1 */
/* correct result: young = 3, middle = 2, senior = 1 */

/* 5. Use PROC MEANS with class sex;, var sbp;, and the $sexf. format. What do you see in the output? */

proc means data = patients;
class sex;
var sbp;
format sex $sexf.;
run;
 
/*ans: female, male are grouped separately and no.of patients, mean, stddev, min, max was seen in the output. */

/* 6. Create a dataset patients_fmt where sex and sbp are permanently formatted in a DATA step.  */
/* Then run PROC PRINT on it without a FORMAT statement. Do the labels still show? */

proc format;
value $sexf 'M' = 'Male'
            'F' = 'Female';
value sbpgrp Low-<120 = "Normal"                 
             120-139 = "Elevated"
             140-High = "High";
run;             

data patients_fmt;
set patients;
format sex $sexf. sbp sbpgrp.;
run;

proc print data = patients_fmt;
run;

/* ANS: The answer to the question is yes, the labels still show without a FORMAT statement in PROC PRINT.  */
/*      This is because the format was saved in the dataset by the DATA step. */

/* 7. Challenge: Add other = 'Unknown' to your $sexf format.  */
/*    Then create one extra row with sex = 'X' in a copy of the data and print it.  */
/*    What does the X row show? */

proc format;
value $sexf 'M' = 'Male'
            'F' = 'Female'
            Other = 'Unknown';
run;

proc print data = patients;
var id sex age sbp;
where sex = 'X';
format sex $sexf.;
run;
            
/* my-ans: There were 0 observations read from the data set WORK.PATIENTS. */
/*        WHERE sex='X'; */

/* ANS: */

/* MAKE ANEW DATASET WITH  ONE EXTRA PATIENT, SEX = 'X' */

/* 1. RUN THE FORMAT WITH OTHER FIRST */

proc format;
value $sexf 'M' = 'Male'
            'F' = 'Female'
            Other = 'Unknown';
run;

/* 2. MAKE A TINY DATASET WITH THE X PATIENT */

DATA EXTRA;
INPUT IS SEX $ AGE WEIGHT SBP;
DATALINES;
7 X 50 70 125
RUN;

/* 3. STACK IT UNDER THE ORIGINAL PATIENTS */

data patients_x;
  set patients EXTRA;
run;

/* 4. PRINT WITH FORMAT */

proc print data=patients_x;
  format sex $sexf.;
run;































































             

             



































            



























            
            








































































































