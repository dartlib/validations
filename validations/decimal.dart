import 'package:decimal/decimal.dart';

final decimal = Decimal.parse('2.00001');

void main() {
  print(decimal.floorToDouble());
  print('$decimal');
}
