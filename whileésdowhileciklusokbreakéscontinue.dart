import 'dart:io';

void main() {
  // 1. birthdaySong.dart
  print('Kérem, adjon meg egy számot 1 és 100 között:');
  int szam = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < szam; i++) {
    print('Boldog születésnapot!');
    print('Boldog születésnapot neked!');
  }

  // 2. whileInnerLoop.dart
  print('Kérem, adjon meg egy számot 3 és 9 között:');
  int felhasznaloSzama = int.parse(stdin.readLineSync()!);

  outerLoop:
  for (int i = 0; i <= 10; i++) {
    innerLoop:
    for (int j = 0; j <= 10; j++) {
      if (j == felhasznaloSzama) {
        break innerLoop;
      }
      print('i = $i, j = $j');
    }
    if (i == felhasznaloSzama) {
      break outerLoop;
    }
  }

  // 3. whileFibonacci.dart
  int a = 0, b = 1, c;
  print(a);
  print(b);

  while (b <= 100) {
    c = a + b;
    print(c);
    a = b;
    b = c;
  }

  // 4. noFizzBuzzNumbers.dart
  int i = 1;

  while (i <= 100) {
    if (i % 3 != 0 && i % 5 != 0) {
      print(i);
    }
    i++;
  }
}