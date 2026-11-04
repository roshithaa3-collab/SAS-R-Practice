/* ARRAYS */

/* Convert marks from 100 to 50 */

data old;
input name $ math sci eng;
datalines;
Ravi 90 80 70
Anu 100 60 50
Kiran 40 . 80
run;

data new;
set old;
array m{3} math sci eng;
do i = 1 to 3;
   m{i} = m{i} / 2;
end;
drop i;
run;

PROC PRINT DATA = NEW;
RUN;

/* Replace missing values (.) with 0 */

data clean;
set old;
array m{3} math sci eng;
do i = 1 to 3;
if m{i} = . then m{i} = 0;
end;
drop i;
run;

PROC PRINT DATA = clean;
RUN;

/* Character array (use $) */

data places;
length city $ 15 state $ 20;
input city $ state $;
datalines;
chennai tamilnadu
mumbai maharashtra
run;

data places2;
set places;
array c{2} $ city state;
do i = 1 to 2;
c{i} = upcase(c{i});
end;
drop i;
run;

proc print data=places2; 
run;


/* practice questions */

/* 1. Add 10 to each of q1 q2 q3 q4 using an array. */

data sales;
input id q1 q2 q3 q4;
datalines;
1 100 200 150 300
2 50 -1 80 120
3 -1 90 -1 60
;
run;

data sales2;
set sales;
array q{4} q1 q2 q3 q4;
do i = 1 to 4;
   q{i} = q{i} + 10;
end;
drop i;
run;

proc print data = sales2;
run;

/* 2. Replace -1 with a missing value in the same array. */

data sales_clean;
    set sales;
    array q{4} q1 q2 q3 q4;
    do i = 1 to 4;
        if q{i} = -1 then q{i} = .;
    end;
    drop i;
run;

proc print data = sales_clean; 
run;

/* 3. What does dim() do? */

/* ans: count the variables automatically. you use it: do i = 1 to dim(q); */

data sales_final;
    set sales;
    array q{4} q1 q2 q3 q4;
    do i = 1 to dim(q);
        if q{i} = -1 then q{i} = .;
        else q{i} = q{i} + 10;
    end;
    drop i;
run;

proc print data=sales_final; 
run;

data marks;
    input id math sci eng soc;
    datalines;
1 80 70 60 90
2 45 . 55 65
3 99 88 -1 77
;
run;

/* 1. Add 5 bonus marks to every subject. Use dim() in your loop. */

data marks_add;
set marks;
array m{4} math sci eng soc;
do i = 1 to dim(m);
   m{i} = m{i} + 5;
end;
drop i;
run;

proc print data = marks_add;
run;

/* 2. Replace every missing value (.) with 0. */

data marks_clean;
set marks;
array m{4} math sci eng soc;
do i = 1 to 4;
if m{i} = . then m{i} = 0;
end;
drop i;
run;

proc print data = marks_clean;
run;

/* 3. Replace every -1 with a missing value. */

data marks_clean2;
set marks;
array m{4} math sci eng soc;
do i = 1 to 4;
if m{i} = -1 then m{i} = .;
end;
drop i;
run;

proc print data = marks_clean2;
run;

/* 4. Keep the original marks safe.  */
/*    Create new variables n1 n2 n3 n4 that hold each mark plus 5. Hint: use two arrays. */

data marks_final;
set marks;
array old{4} math sci eng soc;
array new{4} n1-n4;
do i = 1 to 4;
   new{i} = old{i} + 5;
end;
drop i;
run;   

proc print data = marks_final;
run;

/* 5. Count how many subjects each student scored below 50.  */
/*    Store it in a variable called low.  */

data marks_low;
    set marks;
    array m{4} math sci eng soc;
    low = 0;
    do i = 1 to dim(m);
        if m{i} < 50 then low = low + 1;
    end;
    drop i;
run;

data marks_low2;
    set marks;
    array m{4} math sci eng soc;
    low = 0;
    do i = 1 to dim(m);
    if . < m{i} < 50 then low = low + 1;
    end;
    drop i;
run;

proc print data=marks_low; 
run;

data cities;
    length c1 c2 c3 $ 15;
    input c1 $ c2 $ c3 $;
    datalines;
chennai MUMBAI delhi
KOLKATA pune HYDERABAD
;
run;

/* 6. Make all three cities start with a capital letter and the rest small (Chennai, Mumbai, Delhi).  */
/*    Hint: use propcase() instead of upcase(). */

data cities2;
set cities;
array c{3} $ c1 c2 c3;
do i = 1 to 3;
c{i} = propcase(c{i});
end;
drop i;
run;

proc print data = cities2;
run;
