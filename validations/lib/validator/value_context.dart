part of validator;

class ValueContext {
  // The current node.
  // Use node.propertyPath to get the property path
  // from the root to this node.
  final Node node;

  // The currently validated value.
  final Object value;

  // The currently validated object.
  final Object validatedObject;

  // The current validator, either the root validator.
  // Or if @Valid is used the validator of the currently
  // validated [Type]
  final Validator validator;

  // The violations for the current context.
  final List<ConstraintViolation> violations = [];

  /// The base node points to a class with a [Validator] attached.
  ///
  /// If @Valid is used the `baseNode` points to the type it is validating.
  ///
  /// e.g.
  /// ```
  ///  class Car {
  ///    @Valid
  ///    Driver driver;
  ///  }
  /// ```
  ///
  /// For validations taking place in the context of Driver.
  /// The baseNode will be Driver and in this case:
  ///
  /// `baseNode.getPath('.name')` will return the driver name.
  ///
  /// To get the same node in the context of Car the same path can be
  /// retrieved through:
  ///
  /// `baseNode.getPath('.driver.name')`
  ///
  /// This is mostly used in class level validators to correctly
  /// point to the fields being validated and attach violations to
  /// those specific field.
  final Node baseNode;

  ValueContext({
    @required this.node,
    @required this.baseNode,
    @required this.value,
    @required this.validatedObject,
    @required this.validator,
  });

  /// Adds a violation to the current context.
  ///
  /// By default the violation is considered to be for the current [node].
  ///
  /// If [node] is specified the violation will be associated to that
  /// particular other [node].
  ///
  /// This is useful in case a constraint validator has to assign a violation
  /// to a certain field.
  ///
  /// This is mainly used in class level validators.
  void addViolation(Function message, List parameters, [Node node]) {
    violations.add(buildViolation(message, parameters, node));
  }

  ConstraintViolation buildViolation(
    Function message,
    List parameters,
    Node node,
  ) {
    node ??= this.node;

    return ConstraintViolation(
      validatedObject: validatedObject,
      propertyPath: node?.path,
      invalidValue: value,
      parameters: parameters,
      // TODO: Check this, it should be the property or the class name.
      name: node.name,
      message: Function.apply(
        message,
        parameters,
      ) as String,
    );
  }

  Node getNode(String path) {
    return baseNode.findNode(path);
  }
}
