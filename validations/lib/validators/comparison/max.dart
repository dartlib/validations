part of validators.comparison;

class MaxValidator extends LessThanOrEqualValidator {
  MaxValidator({
    @required num value,
  })  : assert(value != null),
        super(value: value);
}
