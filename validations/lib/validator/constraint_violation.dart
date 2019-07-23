part of validator;

// https://github.com/sebthom/oval/blob/master/src/main/java/net/sf/oval/ConstraintViolation.java
class ConstraintViolation<T> {
  String message;
  Object validatedObject;
  Object invalidValue;
  String name;
  T rootModel;
  Type rootModelType;
  String propertyPath;
  List parameters;

  ConstraintViolation({
    this.name,
    this.message,
    this.validatedObject,
    this.invalidValue,
    this.parameters,
    this.rootModel,
    this.propertyPath,
  }) {
    rootModelType = rootModel.runtimeType;
  }

  ConstraintViolation clone() {
    return ConstraintViolation(
      name: name,
      message: message,
      validatedObject: validatedObject,
      invalidValue: invalidValue,
      parameters: parameters,
      rootModel: rootModel,
      propertyPath: propertyPath,
    );
  }
}
