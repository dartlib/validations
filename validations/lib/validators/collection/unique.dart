part of validators.collection;

/// Validates that the provided collection only contains unique items.
///
/// i.e. that we can't find 2 equal elements in the collection.
///
/// Uniqueness is defined by the `==` operator method of the objects being compared.
///
/// Supported types: [Iterable] and [Map]
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
  Function message = (Object validatedValue) => 'The items must be unique';
}
