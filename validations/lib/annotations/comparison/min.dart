part of annotations.comparison;

/// Checks whether the annotated value is higher than or equal to the specified
/// minimum.
@immutable
@Constraint(validatedBy: MinValidator)
class Min extends GreaterThanOrEqual {
  const Min({
    @required num value,
    String message,
    List<String> groups,
  }) : super(
          value: value,
          message: message,
          groups: groups,
        );
}
