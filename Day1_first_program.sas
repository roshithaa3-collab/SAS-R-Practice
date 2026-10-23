proc print data=sashelp.class;
run;
proc contents data=sashelp.class;
run;
data class_teens;
set sashelp.class;
where age >=13;
run;

libname mylib "/home/u64426594/practice";

data mylib.class_teens;
set sashelp.class;
where age>=13;
run;

data work.test1;
set sashelp.class;
run;

data mylib.test2;
set sashelp.class;
run;

data mylib.girls;
set sashelp.class;
where Sex="F";
run;

/* SET */

data boys girls;
set sashelp.class;
if sex="M" then output boys;
else output girls;
run;

data all_students;
length bmi_group $ 6;
set boys girls;
bmi=weight/(height**2)*703;
if bmi<18 then bmi_group="Low";
else if bmi>18 and bmi<= 24.9 then bmi_group="Normal";
else bmi_group="High";
run;

proc freq data=all_students;
tables bmi_group;
run;

data copy1;
set sashelp.class;
run;

data all_students;
set boys girls;
run;

data boys girls;
set sashelp.class;
if sex="M" then output boys;
else output girls;
run;

data test1;
length group $ 7;
set sashelp.class;
if age >=14 then group = "Older";
else group = "Younger";
run;

proc freq data=test1;
tables group;
run;

/* MERGE */
data scores;
input name $ score;
cards;
Alfred 80
Alice 90
Barbara 75
Zara 60
run;

proc sort data=sashelp.class out=class_sorted;
by name;
run;

proc sort data = scores;
by name;
run;

data merged;
merge class_sorted(in=a) scores(in=b);
by name;
if a;
run;

data merged;
merge class_sorted(in=a) scores(in=b);
by name;
if b;
run;

/* Retain */

proc sort data = sashelp.class out = cls;
by sex;
run;

data totals;
set cls;
by sex;
retain total;
if first.sex then total = 0;
total = total + weight;
if last.sex;
run;

data totals2;
set cls;
by sex;
retain total count;
if first.sex then do;
total = 0;
count = 0;
end;
total = total + weight;
count = count + 1;
if last.sex;
run;

proc freq data = sashelp.class;
tables sex;
run;

































