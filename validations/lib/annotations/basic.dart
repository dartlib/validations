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

/// [Blank] annotation using default values
const blank = Blank();

/// [IsEmpty] annotation using default values
const isEmpty = IsEmpty();

/// [IsFalse] annotation using default values
const isFalse = IsFalse();

/// [IsTrue] annotation using default values
const isTrue = IsTrue();

/// [NotBlank] annotation using default values
const notBlank = NotBlank();

/// [NotEmpty] annotation using default values
const notEmpty = NotEmpty();

/// [NotNull] annotation using default values
const notNull = NotNull();

/// [Null] annotation using default values
const isNull = Null();

final basicAnnotations = [
  blank,
  isEmpty,
  isFalse,
  isTrue,
  notBlank,
  notEmpty,
  notNull,
  isNull,
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
