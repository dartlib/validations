part of annotations.collection;

/// Checks that the annotated collection only contains unique elements.
/// The default message does not include the list of duplicate elements but
/// you can include it by overriding the message and using the {duplicates}
/// message parameter. The list of duplicate elements is also included in the
/// dynamic payload of the constraint violation.
@immutable
@Constraint(validatedBy: UniqueValidator)
class Unique extends ValidatorAnnotation {
  const Unique({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
