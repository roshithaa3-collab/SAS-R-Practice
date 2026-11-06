/* FUNCTIONS */

/* CHARACTER FUNCTIONS: */

data names;
  input fullname $20.;
  first = scan(fullname, 1, ' ');
  upper = upcase(first);
  len   = length(fullname);
  init  = substr(fullname, 1, 1);
  datalines;
john smith
mary jones
;
run;

/* 1. What does scan('a-b-c', 2, '-') return? */

/* ANS: IT RETURNS 'b'. */

/* 2. What is the difference between a function and a CALL routine? */

/* ANS: FUNCTION: TAKES AN ARGUMENT, DOES A CALCULATION & RETURN ONE VALUE. WHERE AS, */
/*      CALL routine: doesn't return a value, it changes variables or does an action.    */

/* 3. What does substr('Hello World', 7, 5) return? */

/* ans: World */

/* 4. Q3. What does length('Hi there') return? */

/* ans: 8 */

data demo;
  first = 'Mary';
  last  = 'Jones';
  full  = catx(' ', first, last);
  pos   = find(full, 'Jones');
  phone = compress('555-123-4567', '-');
run;

/* Q1. What does tranwrd('I like cats', 'cats', 'dogs') return? */

/* ANS: I like dogs */

/* Q2. What does translate('a-b-c', '_', '-') return? */

/* ans: a_b_c */

/* Q3. What does anydigit('ab5c') return, and why? */

/* ans: 3, bcz anydigit function return the position of the first digit. */
/* The "5" is the 3rd character (a=1, b=2, 5=3). */

/* Q4. Write one line of SAS code that joins city and state with a comma and a space between them, */

/* ans: catx(', ', City, State) */

data test;
  city = 'Dallas';
  state = 'TX';
  location = catx(', ', city, state);
  msg = tranwrd('I like cats', 'cats', location);
  pos = find(msg, 'TX');
  clean = compress(msg, ',');
run;

/* Q1. What does round(45.678, 0.01) return? */

ANS: 45.68

/* Q2. What does mod(20, 6) return?  */

ans: 2. 6*3=18, leftover 2.

/* Q3. Is 15 even or odd? Show what mod(15, 2) gives. */

/* ans: odd.  2*7=14, leftover 1, so it is odd. */

/* Q4. Write one line creating rounded_salary by rounding salary to a whole number. */

/* ans: ronded_salary = round(salary) */



























































































































