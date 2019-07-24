library validators.mixed;

import 'package:decimal/decimal.dart';
import 'package:meta/meta.dart';

import '../validator.dart';

part 'mixed/digits.dart';
part 'mixed/size.dart';

final mixedValidators = [
  DigitsValidator,
  SizeValidator,
];
