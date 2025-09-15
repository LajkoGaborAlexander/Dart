void main(){
  int intValue = 6;
  double doubleValue = 0.6;
  String strValue = 'valami';
  bool boolValue = false;

  double osszeg = (intValue + doubleValue);
  print('Összeg: $osszeg');
  double osztas = (intValue / doubleValue);
  print('Osztás: $osztas');
  double szorzas = (intValue * doubleValue);
  print('Szorzás: $szorzas');
  double kivonas = (intValue - doubleValue);
  print('Kivonás: $kivonas');

  print('String: $strValue');
  print('bool: $boolValue');

  bool boolResult = true;
  print('boolResult: $boolResult');

}