import 'dart:math';

void main(){
  print('alma megfordítottja: ${reverseString('alma')}');
  print('134679 megfordítottja: ${reverseInteger(134679)}');
  print('3.1415 megfordítottja: ${reverseNumber(3.1415)}');
  print('134679 növekvően a számok: ${sortNumbersAsc(134679)}');
  print('3.1415 növekvően a számok: ${sortNumbersDes(3.1415)}');
  print('8 FizzBuzz megfelelője: ${fizzBuzz(8)}');
  print('10 FizzBuzz megfelelője: ${fizzBuzz(10)}');
  print('12 FizzBuzz megfelelője: ${fizzBuzz(12)}');
  print('15 FizzBuzz megfelelője: ${fizzBuzz(15)}');
  print('2, 3, 8 háromszög-e: ${isTriangleBySides(2, 3, 8)}');
  print('2, 3, 4 háromszög-e: ${isTriangleBySides(2, 3, 4)}');
  print('2, 3, 0 háromszög-e: ${isTriangleBySides(2, 3, 0)}');
  print('30, 60, 90 háromszög-e: ${isTriangleByAngles(30, 60, 90)}');
  print('30, 60, 60 háromszög-e: ${isTriangleByAngles(30, 60, 60)}');
  print('0, 90, 90 háromszög-e: ${isTriangleByAngles(0, 90, 90)}');

  print('40, 70, 70 háromszög-e: ${triangleTypeByAngles(40, 70, 70)}');
  print('60, 60, 60 háromszög-e: ${triangleTypeByAngles(60, 60, 60)}');

  print('30, 60, 90 háromszög-e: ${triangleTypeByAngles(30, 60, 90)}');
  print('40, 60, 80 háromszög-e: ${triangleTypeByAngles(40, 60, 80)}');
  print('30, 40, 110 háromszög-e: ${triangleTypeByAngles(30, 40, 110)}');

  print('40, 60, 90 háromszög-e: ${triangleTypeByAngles(40, 60, 90)}');

  print ('2. padovan ${padovanNumber(2)}  <1');
  print ('4. padovan ${padovanNumber(4)}  <1');
  print ('8. padovan ${padovanNumber(6)}  <2');
  print ('8. padovan ${padovanNumber(8)}  <4');
  print ('10. padovan ${padovanNumber(10)}  <7');
}

int padovanNumber(int integer) {
  List<int> padovans = [0, 1, 1];
  if (integer < 4) {
    return padovans[integer - 1];
  }
  for (int i = 3; i < integer; i++) {
      int len = padovans.length;
      padovans.add(padovans[padovans.length - 3] + padovans[len- 2]);
  }
  return padovans.last;
}

String triangleTypeByAngles(double a, double b, double c){
    if(!isTriangleByAngles(a, b, c)) {
      return "érvénytelen háromszög";
    }
    String type = "";
    if (a != b && a != c && b != c) {
      type = "Általános és ";
    }
    if (a == 90 || b == 90 || c == 90) {
      type += "derékszögű háromszög";
    }
    if (a > 90 || b > 90 || c > 90) {
      type += "tompaszögű háromszög";
    }
    if (a < 90 || b < 90 || c < 90) {
      type += "hegyesszögű háromszög";
    }
     if (a == b || a == c || b == c) {
      type = "egyenlő szárú háromszög";
    }
    if (a == b && b == c) {
      type = "egyenlő oldalú háromszög";
    }
    return type;
}

bool isTriangleByAngles(double a, double b, double c) {
  if (a + b + c == 180 && a > 0 && b > 0 && c > 0) {
    return true;
  }
  return false;
}

bool isTriangleBySides(double a, double b, double c) {
  if (a + b > c  && b + c > a && a + c > b ) {
    return true;
  }
  return false;
}

dynamic fizzBuzz(int integer) {
  if (integer % 3 == 0 && integer % 5 !=0){
    return 'Fizz';
  }else if(integer % 3 != 0 && integer % 5 ==0){
    return 'Buzz';
  }else if(integer % 3 == 0 && integer % 5 ==0){
    return 'FizzBuzz';
  } else{
    return integer;
  }
    
}

int sortNumbersDes(num number) {
  int egesz = int.parse('$number'.replaceAll('.', ''));
  int novekvo = sortNumbersAsc(egesz);
  int csokkeno = reverseInteger(novekvo);
  return csokkeno;
}

int sortNumbersAsc(int integer) {
  List<String> strList = '$integer'.split('');
  List<int> intList = strList.map((e) => int.parse(e)).toList();
  intList.sort();
  return int.parse(intList.join());
}

int reverseNumber(num number) {
 return int.parse(reverseString('$number'.replaceAll('.', '')));
}

int reverseInteger(int integer) {
  return int.parse(reverseString('$integer'));
}

String reverseString(String text){
  String result = '';
  for (int i = text.length - 1; i >= 0; i--) {
    result += text[i];
  }
  return result;
}