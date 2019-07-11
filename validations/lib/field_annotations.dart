import './annotations/basic.dart';
import './annotations/collection.dart';
import './annotations/comparison.dart';
import './annotations/date.dart';
import './annotations/mixed.dart';
import './annotations/money.dart';
import './annotations/number.dart';
import './annotations/string.dart';

final fieldAnnotations = [
  ...basicAnnotations,
  ...collectionAnnotations,
  ...comparisonAnnotations,
  ...dateAnnotations,
  ...mixedAnnotations,
  ...moneyAnnotations,
  ...numberAnnotations,
  ...stringAnnotations,
];
