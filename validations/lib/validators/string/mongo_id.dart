part of validators.string;

class MongoIdValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return value is String && isMongoId(value);
  }

  @override
  Function message = (Object validatedValue) => 'MongoId is invalid.';
}
