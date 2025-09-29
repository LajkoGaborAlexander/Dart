import 'dart:io';

void main() {
  // 1. feladat
  print('Kérem, adjon meg egy egész számot: ');
  int szam = int.parse(stdin.readLineSync()!);

  // 2. feladat
  if (szam % 2 == 0) {
    print('A $szam szám páros.');
  } else {
    print('A $szam szám páratlan.');
  }

  // 3. feladat
  if (szam >= 90) {
    print('Jeles');
  } else if (szam >= 80) {
    print('Jó');
  } else if (szam >= 70) {
    print('Közepes');
  } else if (szam >= 60) {
    print('Elégséges');
  } else {
    print('Elégtelen');
  }

  // 4. feladat
  switch (szam ~/ 10) {
    case 9:
    case 10:
      print('Jeles');
      break;
    case 8:
      print('Jó');
      break;
    case 7:
      print('Közepes');
      break;
    case 6:
      print('Elégséges');
      break;
    default:
      print('Elégtelen');
  }

  // 5. feladat
  print('Kérem, adja meg az első számot: ');
  int szam1 = int.parse(stdin.readLineSync()!);
  print('Kérem, adja meg a második számot: ');
  int szam2 = int.parse(stdin.readLineSync()!);

  if (szam1 > szam2) {
    print('A nagyobb szám: $szam1');
  } else {
    print('A nagyobb szám: $szam2');
  }

  // 6. feladat
  print('Kérem, adjon meg egy egész számot: ');
  int szam3 = int.parse(stdin.readLineSync()!);

  if (szam3 % 2 == 0) {
    print('A $szam3 szám páros.');
  } else {
    print('A $szam3 szám páratlan.');
  }

  if (szam3 > 0) {
    print('A $szam3 szám pozitív.');
  } else if (szam3 < 0) {
    print('A $szam3 szám negatív.');
  } else {
    print('A $szam3 szám nulla.');
  }

  if (szam3 >= 0 && (szam3 * szam3) == szam3) {
    print('A $szam3 szám négyzetszám.');
  } else {
    print('A $szam3 szám nem négyzetszám.');
  }
}