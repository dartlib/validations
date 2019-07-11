part of validators.comparison;

class MinValidator extends GreaterThanOrEqualValidator {
  MinValidator({
    @required num value,
  })  : assert(value != null),
        super(value: value);
}
