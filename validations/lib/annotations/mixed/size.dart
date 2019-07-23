part of annotations.mixed;

/// Checks if the annotated element’s size is between [min] and [max] (inclusive)
@immutable
@Constraint(validatedBy: SizeValidator)
@Target({ElementType.FIELD})
class Size extends ValidatorAnnotation {
  final int min;
  final int max;
  const Size({
    this.min,
    this.max,
    String message,
    List<String> groups,
  }) : super(message, groups);
}
