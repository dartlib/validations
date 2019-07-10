library annotations.collection;

import 'package:meta/meta.dart';
import 'package:validations/validator_annotation.dart';

part 'collection/unique.dart';
part 'collection/valid.dart';

/// [Unique] annotation using default values
const unique = Unique();

/// [Valid] annotation using default values
const valid = Valid();

final collectionAnnotations = [
  unique,
  valid,
  Unique,
  Valid,
];
