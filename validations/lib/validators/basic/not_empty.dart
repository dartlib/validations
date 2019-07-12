part of validators.basic;

class NotEmptyValidator extends ConstraintValidator {
  @override
  bool allowNull = false;

  @override
  bool isValid(dynamic value, [ValueContext context]) {
    if (value == null) return false;

    if (value is String || value is Iterable || value is Map) {
      return value.isNotEmpty as bool;
    }

    return false;
  }

  @override
  Function message = (Object validatedValue) => 'Value cannot be blank';
}
