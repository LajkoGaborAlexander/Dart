void main(){
String value = 'a szél a gyűrött zacskó a szélben csönd a trappokat is csak sejteni zárva vagy ha nyitva is: hová';

print(value);

print(value.toLowerCase()); 

print(value.toUpperCase()); 

print(value.trim()); 

print(value.replaceAll(' ', '-')); 

print('...' + value.substring(4)); 

print(value.codeUnits.take(3).join(',')); 

print(value.substring(9) + '...'); 
}