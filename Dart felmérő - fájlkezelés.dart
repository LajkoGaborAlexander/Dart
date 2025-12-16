import 'dart:io';

// 1. Feladat
void createFile(String filename) {
  try {
    final file = File(filename);
    if (file.existsSync()) {
      print('A fájl már létezik: $filename');
    } else {
      file.createSync(recursive: true);
      print('Fájl létrehozva sikeresen: $filename');
    }
  } catch (e) {
    print('Hiba a fájl létrehozásakor ($filename): $e');
  }
}

// 2. Feladat
void deleteFile(String filename) {
  try {
    final file = File(filename);
    if (file.existsSync()) {
      file.deleteSync();
      print('Fájl törölve sikeresen: $filename');
    } else {
      print('A fájl nem létezik: $filename');
    }
  } catch (e) {
    print('Hiba a fájl törlésekor ($filename): $e');
  }
}

// 3. Feladat
List<String> readFile(String filename) {
  try {
    final file = File(filename);
    if (!file.existsSync()) {
      print('A fájl nem található: $filename');
      return <String>[];
    }
    return file.readAsLinesSync();
  } catch (e) {
    print('Hiba a fájl olvasásakor ($filename): $e');
    return <String>[];
  }
}

void printContent(List<String> content) {
  final females = <String>[];
  final males = <String>[];
  final unknown = <String>[];

  for (final raw in content) {
    final line = raw.trim();
    if (line.isEmpty) continue;

    final parts = line.split(',').map((s) => s.trim()).toList();

    String gender = 'unknown';
    if (parts.length >= 3) {
      final g = parts[2].toLowerCase();
      if (g.contains('female') ||
          g.contains('n') ||
          g.contains('nő') ||
          g == 'f')
        gender = 'female';
      else if (g.contains('male') || g.contains('férfi') || g == 'm')
        gender = 'male';
    } else {
      for (final p in parts) {
        final pp = p.toLowerCase();
        if (pp.contains('female') || pp.contains('nő') || pp == 'f') {
          gender = 'female';
          break;
        }
        if (pp.contains('male') || pp.contains('férfi') || pp == 'm') {
          gender = 'male';
          break;
        }
      }
    }

    if (gender == 'female')
      females.add(line);
    else if (gender == 'male')
      males.add(line);
    else
      unknown.add(line);
  }

  print('\n--- Nők ---');
  if (females.isEmpty) print('(nincs női adat)');
  females.forEach(print);

  print('\n--- Férfiak ---');
  if (males.isEmpty) print('(nincs férfi adat)');
  males.forEach(print);

  if (unknown.isNotEmpty) {
    print('\n--- Ismeretlen / nem beazonosított ---');
    unknown.forEach(print);
  }
}

// 4. Feladat
void addNumbers(String filename, List<int> numbers) {
  try {
    final file = File(filename);
    if (!file.existsSync()) file.createSync(recursive: true);
    final lineToAppend = numbers.join(', ');
    final sink = file.openWrite(mode: FileMode.append);
    sink.writeln(lineToAppend);
    sink.close();
    print('Számok hozzáadva a $filename fájlhoz: $lineToAppend');
  } catch (e) {
    print('Hiba a számok hozzáadásakor ($filename): $e');
  }
}

void printNumbers(List<String> fileContent) {
  final nums = <int>[];
  for (final line in fileContent) {
    final trimmed = line.trim();
    if (trimmed.isEmpty) continue;
    final parts = trimmed
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty);
    for (final p in parts) {
      final parsed = int.tryParse(p);
      if (parsed != null)
        nums.add(parsed);
      else {
        for (final m in RegExp(r'-?\d+').allMatches(p)) {
          nums.add(int.parse(m.group(0)!));
        }
      }
    }
  }
  nums.sort();
  print('\n Számok növekvő sorrendben:');
  for (final n in nums) print(n);
}

void main() {
  // 1. Feladat
  createFile('players.txt');
  createFile('cars.txt');

  // 2. Feladat
  deleteFile('players.txt');

  // 3. Feladat
  final employees = readFile('employees.txt');
  if (employees.isEmpty) {
    print('\n employees.txt üres vagy nem található.');
  } else {
    printContent(employees);
  }

  // 4. Feladat
  final toAdd = [8, 0, 5, 1, 3, 2, 11, 19, 1];
  addNumbers('numbers.txt', toAdd);

  final numbersFileContent = readFile('numbers.txt');
  if (numbersFileContent.isEmpty) {
    print('\n numbers.txt üres vagy nem található.');
  } else {
    printNumbers(numbersFileContent);
  }

  print('\nKész.');
}
