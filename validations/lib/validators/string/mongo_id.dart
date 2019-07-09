part of validators.string;

class MongoIdValidator extends ConstraintValidator {
  @override
  bool isValid(dynamic value, [ValueContext context]) {
    return isMongoId(value);
  }

  @override
  Function message = (Object validatedValue) => 'MongoId is invalid.';
}
