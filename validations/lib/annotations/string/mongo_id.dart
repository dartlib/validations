part of annotations.string;

/// Checks that the annotated character sequence is a valid mongo id.
@immutable
class MongoId {
  final String message;
  const MongoId({
    this.message,
  });
}
