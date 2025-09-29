import 'dart:io';
import 'dart:math';

void main() {
  // 1. Feladat
  print('Kérem, adjon meg két legfeljebb kétjegyű egész számot:');
  int szam1 = int.parse(stdin.readLineSync()!);
  int szam2 = int.parse(stdin.readLineSync()!);

  int minSzam, maxSzam;
  if (szam1 < szam2) {
    minSzam = szam1;
    maxSzam = szam2;
  } else {
    minSzam = szam2;
    maxSzam = szam1;
  }

  for (int i = minSzam; i <= maxSzam; i++) {
    if (i % 2 == 0) {
      print('$i - páros');
    } else {
      print('$i - páratlan');
    }
  }

  // 2. Feladat
  List<String> uefa2024euro = [
    "Spain",
    "Germany",
    "Portugal",
    "France",
    "Netherlands",
    "Turkey",
    "England",
    "Switzerland"
  ];

  for (int i = 0; i < uefa2024euro.length; i++) {
    print('Index: $i, Érték: ${uefa2024euro[i]}');
  }

  // 3. Feladat
  for (int i = 0; i < uefa2024euro.length; i++) {
    for (int j = i + 1; j < uefa2024euro.length; j++) {
      print('${uefa2024euro[i]} - ${uefa2024euro[j]}');
    }
  }

  // 4. Feladat
  print('Kérem, adjon meg egy számot:');
  int szam = int.parse(stdin.readLineSync()!);
  int szamjegyekOsszege = 0;
  int szamjegyekSzama = 0;

  while (szam > 0) {
    int szamjegy = szam % 10;
    szamjegyekOsszege += szamjegy;
    szamjegyekSzama++;
    szam ~/= 10;
  }

  double szamjegyekAtlaga = szamjegyekOsszege / szamjegyekSzama;
  print('A számjegyek átlaga: ${szamjegyekAtlaga.toStringAsFixed(2)}');

  // 5. Feladat
  print('Kérem, adjon meg egy számot:');
  int szam5 = int.parse(stdin.readLineSync()!);
  int szamjegyekNegyzete = 0;

  while (szam5 > 0) {
    int szamjegy = szam5 % 10;
    szamjegyekNegyzete += szamjegy * szamjegy;
    szam5 ~/= 10;
  }

  print('A számjegyek négyzete: $szamjegyekNegyzete');

  // 6. Feladat
  print('Kérem, adjon meg egy szöveget:');
  String szoveg = stdin.readLineSync()!;
  String maganhangzokNelkul = '';

  for (int i = 0; i < szoveg.length; i++) {
    if (!'aeiouAEIOU'.contains(szoveg[i])) {
      maganhangzokNelkul += szoveg[i];
    }
  }

  print('A szöveg magánhangzók nélkül: $maganhangzokNelkul');

  // 7. Feladat
  print('Kérem, adjon meg egy szöveget:');
  String szoveg7 = stdin.readLineSync()!;

  for (int i = 0; i < szoveg7.length; i++) {
    print('(${szoveg7[i]}, ${szoveg7.codeUnitAt(i)})');
  }

  // 8. Feladat
  print('Kérem, adjon meg egy számot:');
  int szam8 = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= szam8; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }
}