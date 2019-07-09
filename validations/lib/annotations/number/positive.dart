part of annotations.number;

//// Checks if the element is strictly positive. Zero values are considered
//// invalid.
@immutable
class Positive extends ValidatorAnnotation {
  const Positive({
    message,
    groups,
  }) : super(message, groups);
}
