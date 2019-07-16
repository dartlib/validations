/// This library contains all available validation annotations.
///
/// To use, import `package:validations/annotations.dart`
///
/// It contains all of the below sub libraries:
///
///   * annotations.basic
///   * annotations.choice
///   * annotations.collection
///   * annotations.comparison
///   * annotations.date
///   * annotations.file
///   * annotations.mixed
///   * annotations.money
///   * annotations.number
///   * annotations.string
library annotations;

import 'package:meta/meta.dart';

import 'annotation.dart';
import 'annotations/basic.dart';
import 'annotations/choice.dart';
import 'annotations/collection.dart';
import 'annotations/comparison.dart';
import 'annotations/date.dart';
import 'annotations/file.dart';
import 'annotations/mixed.dart';
import 'annotations/money.dart';
import 'annotations/number.dart';
import 'annotations/string.dart';

export 'annotations/basic.dart';
export 'annotations/choice.dart';
export 'annotations/collection.dart';
export 'annotations/comparison.dart';
export 'annotations/date.dart';
export 'annotations/file.dart';
export 'annotations/mixed.dart';
export 'annotations/money.dart';
export 'annotations/number.dart';
export 'annotations/string.dart';

part 'annotations/field_annotations.dart';
part 'annotations/gen_validator.dart';
