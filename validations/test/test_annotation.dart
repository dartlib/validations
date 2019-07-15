import 'dart:mirrors';

import 'package:test/test.dart';
import 'package:validations/annotation.dart';

class TestAnnotation {
  Type annotationType;
  TestAnnotation(
    this.annotationType,
    Map<Symbol, dynamic> namedArguments,
  ) {
    test(annotationType.toString(), () {
      final instance = _getInstance(namedArguments);
      expect(instance, isA<ValidatorAnnotation>());
    });
  }

  dynamic _getInstance(Map<Symbol, dynamic> namedArguments) {
    final clazzMirror = reflectClass(annotationType);

    return clazzMirror
        .newInstance(
          const Symbol(''),
          [],
          namedArguments,
        )
        .reflectee;
  }
}

void testAnnotations(
  String description,
  annotations,
  Map<Symbol, dynamic> namedArguments,
) {
  group(description, () {
    for (var annotation in annotations) {
      if (annotation.runtimeType.toString() != '_Type') {
        TestAnnotation(annotation.runtimeType as Type, namedArguments);
      }
    }
  });
}
