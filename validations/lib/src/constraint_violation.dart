// https://github.com/sebthom/oval/blob/master/src/main/java/net/sf/oval/ConstraintViolation.java
class ConstraintViolation {
  String message;
  Object validatedObject;
  Object invalidValue;
  ConstraintViolation({
    this.message,
    this.validatedObject,
    this.invalidValue,
  });
}
