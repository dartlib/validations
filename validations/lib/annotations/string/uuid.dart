part of annotations.string;

/// Checks that the annotated character sequence is a UUID.
///
/// Valid [version]s are 3, 4, 5.
///
/// If version is omitted all versions are valid.
@immutable
class Uuid {
  final int version;
  final String message;
  const Uuid({
    this.version,
    this.message,
  });
}
