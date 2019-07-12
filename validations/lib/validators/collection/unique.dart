part of validators.collection;

class UniqueValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    if (value == null) return true;

    if (value is Set) return true;

    if (value is Iterable) {
      return _isUnique(value);
    }

    if (value is Map) {
      return _isUnique(value.values);
    }

    throw Exception('Only know how to handle Iterables and Map');
  }

  bool _isUnique(Iterable value) {
    final uniqueSet = <dynamic>{};

    if (value.length < 2) return true;

    for (var v in value) {
      final ret = uniqueSet.add(v);

      if (!ret) {
        return false;
      }
    }

    return true;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be blank';
}
