part of validator;

class ValueContext {
  Node node;
  Object value;
  Validator validator;
  ValueContext({
    @required this.node,
    @required this.value,
    @required this.validator,
  });
}
