import 'package:meta/meta.dart';

@immutable
abstract class ValidatorAnnotation {
  final String message;
  final List<String> groups;
  const ValidatorAnnotation(this.message, this.groups);
}

mixin Alias {}
