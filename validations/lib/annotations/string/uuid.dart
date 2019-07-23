part of annotations.string;

/// Checks that the annotated string is a UUID.
///
/// Valid [version]s are 3, 4, 5.
///
/// If version is omitted all versions are valid.
@immutable
@Constraint(validatedBy: UuidValidator)
@Target({ElementType.FIELD})
class Uuid extends ValidatorAnnotation {
  final int version;
  const Uuid({
    this.version,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
