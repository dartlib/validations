part of validator;

/// Enables a validator to be used as a mixin:
///
///  Usage:
///     part 'person.gval.dart';
///
///    class Person with ValidatorMixin<PersonValidator> {
///       @NotNull()
///       String name;
///    }
///
///    @GenValidator
///    class PersonValidator extends Validator<Person> with $_PersonValidator {}
///
///    final person = Person(name: 'John Doe');
///
///    person.validate();
///    person.validateProperty('name');
///    person.validateValue('name', 'Whom Ever);
///
class ValidatorMixin<T extends Validator> {
  Set<ConstraintViolation> validate() => _getValidator<T>().validate(this);

  Set<ConstraintViolation> validateProperty(String name) =>
      _getValidator<T>().validateProperty(this, name);

  Set<ConstraintViolation> validateValue(String name, Object value) =>
      _getValidator<T>().validateValue(name, value);

  Validator _getValidator<C>() => C as Validator;
}
