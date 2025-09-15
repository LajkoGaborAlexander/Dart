import 'dart:math';
import 'dart:io';

void main(){
  print("Lajkó Gábor");
  print('Kiíratás aposztróffal.');
  print('''
Egyszer volt
hol nem volt

Még nyílnak a völgyben
a kerti virágok...
''');
//print('Ez a sor megjegyzésbe kerül');

var nev = 'Adam family';
print(nev);
print('A megadott név: $nev');
print('A megadott nev hossza ${nev.length}');
String fname = 'Joe';
String lname = 'Doe';
print('Your full name is: $fname $lname');
int egesz = 13;
double pi = 3.1415926;
bool logikai = true;
print('Az egész szám: $egesz');
print('A pi: $pi');
print('A logikai érték: $logikai');
dynamic valami = "egy";
print(valami);
valami = 1;
print(valami);
String teljesNev = "Lajkó Gábor";



  print("Enter name:");
  String? myName  = stdin.readLineSync();
  print("User name ${myName}");
}