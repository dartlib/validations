part of annotation;

@immutable
abstract class ValidatorAnnotation {
  final String message;
  final List<String> groups;
  const ValidatorAnnotation(this.message, this.groups);
}
