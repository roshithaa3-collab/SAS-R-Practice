proc print data=sashelp.class;
run;
proc contents data=sashelp.class;
run;
data class_teens;
set sashelp.class;
where age >=13;
run;