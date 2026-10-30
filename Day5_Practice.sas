/* PROC CONTENTS */

data work.demo;
  input id name $ age sex $ weight;
  label weight = "Weight in kg";
  datalines;
1 Ravi 25 M 70
2 Anita 30 F 58
3 Kiran 28 M 75
;
run;

proc contents data=work.demo;
run;

/* a) Variables in the order they were created */

proc contents data=work.demo varnum;
run;

/* b) Only variable names */

proc contents data=work.demo short;
run;

proc contents data=work.demo varnum short;
run;

/* c) Save metadata to a dataset and view it */

proc contents data=work.demo out=meta noprint;
run;

proc print data=meta;
  var name type length varnum label;
run;

proc print data=meta;
run;

proc contents data=meta;
run;

/* d) List all datasets in WORK */

proc contents data=work._all_ nods;
run;

proc contents data=work._all_;
run;

/* PRACTICE QUESTIONS */

/* 1. What is the difference between the normal output and the varnum output? */

/* MYANS: NORMAL OUTPUT - LISTS THE VARIABLES IN A ALPHABETICAL ORDER. */
/*        VARNUM OUTPUT - LISTS THE VARIABLES IN A CREATION ORDER.  */

/* 2. Write code to show only the column names of work.demo. */

proc contents data=work.demo varnum short;
run;

/* 3. Write code to save the information of work.demo into a dataset called meta without showing the output.  */
/* Then print only name and type. */

proc contents data=work.demo out=meta noprint;
run;

proc print data=meta;
  var name type;
run;

/* 4. How many rows and columns does work.demo have? Which column has a label? */

/* MYANS: ROWS = 3, COLUMNS = 5. WEIGHT COLUMN HAS LABEL. */

/* 5. Write code to list all datasets in the work library. */

proc contents data=work._all_ nods;
run;

data work.patients;
input pid $ age gender $ height weight visit_date : date9.;
label height = "Height in cm"
      weight = "Weight in kg"
      visit_date = "Date of Visit";
format visit_date date9.;
datalines;
P01 45 M 170 72 05JAN2026
P02 38 F 160 58 12JAN2026
P03 52 M 175 80 20JAN2026
P04 29 F 165 55 25JAN2026
run;

/* 1. Write code to see the full details of work.patients. */

proc contents data = work.patients;
run;

/* 2. How many observations and variables does it have? */

/* MYANS: observations = 4, variables = 6. */

/* 3. Which variables are character and which are numeric? */

proc contents data = work.patients out = info noprint;
run;

proc print data = info;
var name type label;
run;

/* MYANS: character variables = pid, gender. */
/*        numeric variables = age, height, weight, visit_date. */

/* 4. Which variables have a label? Write the label of each. */

/* MYANS: height = Height in cm, weight = Weight in kg, visit_date = Date of Visit  */

/* 5. Write code to show the variables of work.patients in the order they were created. */

proc contents data = work.patients varnum;
run;

/* 6. Write code to show only the variable names of work.patients. */

proc contents data = work.patients short;
run;

/* 7. Write code to show the variables in creation order and only the names, together, in one step.  */
/* What do you see? */

proc contents data = work.patients varnum;
run;

ANS: 

proc contents data = work.patients varnum short;
run;

/* 8. Save the information of work.patients into a dataset called pat_meta without showing the normal output. */

proc contents data = work.patients out = pat_meta noprint;
run;

/* 9. Print only name, type, length and varnum from pat_meta. */

proc print data = pat_meta;
var name type length varnum;
run;

/* 10. Print name and format from pat_meta. Which variable has a format, and what is it? */

proc print data = pat_meta;
var name format;
run;

/* visit_date has a format DATE9. */

/* 11. In pat_meta, how many rows will there be, and why? */

proc print data = pat_meta;
run;

/* MYANS: "pat_meta has one row for each variable of work.patients, and there are 6 variables. 
/* PROC CONTENTS does not copy the data, it writes information about the columns. */

/* 12. visit_date is stored as a number, but it shows as 05JAN2026.  */
/* Using PROC CONTENTS, how can you confirm that it is numeric? */

proc contents data = work.patients out = pat_meta noprint;
run;

proc print data = pat_meta;
var name type length varnum;
run;

/* MYANS: BY USING THE PROC CONTENTS, SAS AUTOMATICALLY CREATES THESE COLUMNS  */
/* (NAME, TYPE, LABEL, VARNUM, LENGTH)INSIDE THE PAT_META DATASET. PAT_META HAS ONE ROW FOR EACH COLUMN  */
/* OF WORK.PATIENTS. SO, WHILE WE PRINT THE PAT_META IN THE TYPE COLUMN, IT SHOWS THE 1, WHICH MEANS NUMERIC. */
/* IN THE PAT_META FORMAT COLUMN SHOWS DATE9 FOR VISIT_DATE. THAT IS WHY A NUMBER LOOKS LIKE 05JAN2026.  */
/* THE VALUE IS A NUMBER UNDERNEATH, AND THE FORMAT ONLY CHANGES HOW IT DISPLAYED.  */

/* 13. Write code to list all datasets in the work library without details. Which datasets are yours? */

PROC CONTENTS DATA = WORK._ALL_ NODS;
RUN;

/* MYANS: DEMO, INFO, META, PATIENTS, PAT_META ARE MY DATASETS. */

/* 14. Your friend says, "PROC CONTENTS shows me the data rows."  */
/*     Is he right? Explain in one or two lines. */

/* MYANS: No. PROC CONTENTS shows metadata (structure) only. PROC PRINT shows the data rows." */

/* 15. In 3 or 4 lines, explain in your own words:  */
/*     "What is PROC CONTENTS and why do we use it in clinical programming?" */

/* MYANS: PROC CONTENTS shows the metadata of a dataset: the number of observations, variable names,  */
/* types, lengths, labels and formats. In clinical programming we use it to check that datasets match the  */
/* specification and to find type or length mismatches before merging or submitting. */







































































































       


































