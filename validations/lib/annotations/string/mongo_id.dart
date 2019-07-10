part of annotations.string;

//// Checks that the annotated character sequence is a valid mongo id.
@immutable
class MongoId extends ValidatorAnnotation {
  const MongoId({
    message,
    groups,
  }) : super(message, groups);
}
