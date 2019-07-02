// https://github.com/sebthom/oval/blob/master/src/main/java/net/sf/oval/ConstraintViolation.java
class ConstraintViolation<T> {
  String message;
  Object validatedObject;
  Object invalidValue;
  ConstraintViolation({
    this.message,
    this.validatedObject,
    this.invalidValue,
  });
}
