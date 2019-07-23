part of annotations.string;

/// Checks that the annotated string is a valid mongo id.
@immutable
@Constraint(validatedBy: MongoIdValidator)
class MongoId extends ValidatorAnnotation {
  const MongoId({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
