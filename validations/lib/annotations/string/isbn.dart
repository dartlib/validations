part of annotations.string;

/// Checks that the annotated string is a valid ISBN.
/// type determines the type of ISBN. The default is ISBN-13.
@immutable
@Constraint(validatedBy: ISBNValidator)
@Target({ElementType.FIELD})
class ISBN extends ValidatorAnnotation {
  final String type;
  const ISBN({
    this.type = 'ISBN-13',
    String message,
    List<String> groups,
  }) : super(message, groups);
}
