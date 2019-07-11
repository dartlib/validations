part of validators.collection;

class UniqueValidator extends ConstraintValidator {
  @override
  bool isValid(Object value, [ValueContext context]) {
    if (value == null) return true;

    if (!(value is Map) || !(value is List)) {
      throw Exception('Only know how to handle List and Map');
    }

    final uniqueSet = <dynamic>{};

    if (value is List) {
      if (value.length < 2) return true;

      for (var v in value) {
        final ret = uniqueSet.add(v);

        if (!ret) {
          return false;
        }
      }
    }

    if (value is Map) {
      if (value.length < 2) return true;

      for (var v in value.values) {
        final ret = uniqueSet.add(v);

        if (!ret) {
          return false;
        }
      }
    }

    return true;
  }

  @override
  Function message = (Object validatedValue) => 'Value must be blank';
}
