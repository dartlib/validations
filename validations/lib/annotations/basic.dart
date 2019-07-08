library annotations.basic;

import 'package:meta/meta.dart';
import 'package:validations/validator_annotation.dart';

part './basic/blank.dart';
part './basic/is_empty.dart';
part './basic/is_false.dart';
part './basic/is_true.dart';
part './basic/not_blank.dart';
part './basic/not_empty.dart';
part './basic/not_null.dart';
part './basic/null.dart';
part './basic/type.dart';

final basicAnnotations = [
  Blank,
  IsEmpty,
  IsFalse,
  IsTrue,
  NotBlank,
  NotEmpty,
  NotNull,
  Null,
  Type,
];
