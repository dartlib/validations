part of annotations.number;

/// Checks if the element is strictly negative. Zero values are considered
/// invalid.
@immutable
class Negative extends ValidatorAnnotation {
  const Negative({
    String message,
    List<String> groups,
  }) : super(message, groups);
}
