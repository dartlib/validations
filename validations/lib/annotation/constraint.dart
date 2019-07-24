part of annotation;

@immutable
class Constraint {
  final Type validatedBy;
  const Constraint({
    @required this.validatedBy,
  }) : assert(validatedBy != null);
}
