# SAS-R-Practice

My Journey to become a Statistical Programmer.

## Tools
SAS OnDemand for Academics (SAS Studio), SAS 9.4, R Studio.

## Files
Day1_first_program.sas: PROC PRINT, PROC CONTENTS, DATA STEP, SET, MERGE, RETAIN, FIRST./LAST.
Day2_Practice.sas: OBS=, FIRSTOBS=, NOOBS, LABEL, PROC SORT, DATA STEP WITH SET.
Day3_Practice.sas: PROC SORT ( DESCENDING, NODUPKEY, OUT=), PROC FREQ ( ONE-WAY AND TWO-WAY TABLES, ORDER = FREQ, NOCUM, NOROW, NOCOL).
Day4_Practice.sas: PROC MEANS ( CLASS, BY, VAR, OUTPUT OUT=, MAXDEC=), PROC PRINT ( ID, SUM, LABEL, WHERE), PROC FORMAT ( CHARACTER AND NUMERIC FORMATS, RANGES, OTHER).
Day5_Practice.sas: PROC CONTENTS (metadata, SHORT, VARNUM, OUT=, NOPRINT, _ALL_ NODS).
Day6_Practice.sas: PROC TRANSPOSE (long to wide, wide to long, BY, ID, VAR, PREFIX=, NAME=, DROP=_NAME_, RENAME=).
Day7_Practice.sas: ARRAYS (numeric and character arrays, DIM(), DO loops, two arrays, counting with a loop).
Day8_Practice.sas: PROC TABULATE (CLASS, VAR, TABLE, ALL totals, SUM, MEAN, N, F=COMMA8. format).
Day9_Practice.sas: SAS FUNCTIONS (character: SCAN, UPCASE, LENGTH, SUBSTR, CATX, FIND, COMPRESS, TRANWRD, TRANSLATE, ANYDIGIT; numeric: ROUND, MOD, INT, FLOOR, CEIL).

## Progress Log
- Day 1 (23 Oct 2026): PROC PRINT, PROC CONTENTS, FIRST Data Step with WHERE, LIBNAME, SET, OUTPUT, LENGTH, IF/ELSE, PROC FREQ, MERGE WITH IN=, RETAIN, FIRST./LAST.
- Day 2 (24 Oct 2026): OBS=, FIRSTOBS=, NOOBS, LABEL, WHERE, PROC SORT WITH BY AND DESCENDING , DATA STEP WITH SET.
- Day 3 (28 Oct 2026): PROC SORT WITH NODUPKEY AND OUT=, PROC FREQ WITH ONE-WAY AND TWO-WAY TABLES, ORDER = FREQ, NOCUM, NOROW, NOCOL.
- Day 4 (29 Oct 2026): PROC MEANS WITH CLASS, BY AND OUTPUT OUT=, PROC PRINT WITH ID AND SUM, PROC FORMAT WITH RANGES ( USE A DASH, NOT "TO") AND OTHER, FORMATS IN DATA steps and PROCs.
- Day 5 (30 Oct 2026): PROC CONTENTS with SHORT, VARNUM, OUT= and NOPRINT, saving metadata into a dataset and printing it with PROC PRINT, listing all datasets in a library with _ALL_ NODS, checking variable type (1 = numeric, 2 = character), label and format, and why a SAS date is numeric.
- Day 6 (3 Nov 2026): PROC TRANSPOSE with BY, ID, VAR, PREFIX= and NAME=, long to wide and wide to long, transposing multiple variables and keeping _NAME_, default COL1 and renaming it, combining test name and visit with CATS() for hb1/wbc2 style columns, debugging syntax errors and the "variable not found" error from the log, PROC SORT before BY.
- Day 7 (4 Nov 2026): ARRAYS with DO loops, DIM() to count variables, numeric and character arrays, replacing missing values and -1 with missing, using two arrays (old and new) to keep original data safe, counting values below 50 with a loop, PROPCASE() on a character array, LENGTH before INPUT to stop text being cut at 8 characters, IF without THEN acts as a row filter, lone semicolon after DATALINES, and . < x < 50 to skip missing values.
- Day 8 (5 Nov 2026): PROC TABULATE with CLASS, VAR and TABLE, rows and columns with a comma, nesting with *, side by side with a space, grouping with ( ), totals with ALL, statistics SUM, MEAN and N, formatting with F=COMMA8., fixing a missing * bug, and combining Units SUM and Revenue MEAN inside each Region.
- Day 9 (6 Nov 2026): SAS FUNCTIONS, character and numeric. SCAN with delimiters, UPCASE, LENGTH, SUBSTR (position and length, not end position), CATX with a separator, FIND returning a position or 0, COMPRESS, TRANWRD for words, TRANSLATE for single characters, ANYDIGIT, ROUND with a unit (like a ruler), MOD for remainders and even/odd checks, INT, FLOOR and CEIL, quotes for text values but no quotes for variable names, and storing a function result in a new variable.

## Next Goals
- FUNCTIONS: statistical (SUM, MEAN, MIN, MAX, N, NMISS), DATES (TODAY, MDY, INTCK, INTNX), INPUT/PUT, LAG/DIF, COALESCE.
- PROC REPORT, Macros, PROC SQL.
- CDISC Basics (SDTM, ADaM).
- Tables with PROC Report.
