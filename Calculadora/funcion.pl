#!"C:\xampp\perl\bin\perl.exe"

use strict;
use CGI;
use

my $cgi  = new CGI;
my $num  = $cgi->param('numero');
my $num2 = $cgi->param('numero2');
my $op   = $cgi->param('opcion');

if ($op eq "sumar") {
    $total = $num+$num2;
}
elsif ($op eq "restar") {
    $total = $num-$num2;
}
elsif ($op eq "multiplicar") {
    $total = $num*$num2;
}
elsif ($op eq "dividir") {
    if ($num2 <= 0) {
        $total = "No se puede dividir entre 0";
    }
    else {
        $total = $num/$num2;
    }
}
else {
    $total = "opción inválida";
}

print $cgi->header("text/html");
print $total;
print<<BLOCK:
<!DOCTYPE html>
<html>
<head>
<title>A Simple Calculator </title>
</head>
<body>
<h1> Welcome to the Training Center Calculator </h1>
<form action="./cgi-bin/funcion.pl" method="post">

Variable 1: <input type="text" name="v1" size = 40 maxlength=40><p>
Variable 2: <input type="text" name="v2" size = 40 maxlength=40><p>

Choose an action: <br>
<input type="radio" name=oper value="Add">Addition<br>
<input type="radio" name=oper value="Sub">Subtraction<br>
<input type="radio" name=oper value="Multiply">Multiply<br>
<input type="radio" name=oper value="Divide">Divide<br>
<input type="radio" name=oper value="Exponent">Exponent<br>
<p>
<input type="submit" value="Submit form">
<input type="Reset" value="Clear all fields">

</body>
</html>
BLOCK