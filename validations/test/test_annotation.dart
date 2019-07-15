import 'dart:mirrors';

import 'package:test/test.dart';
import 'package:validations/annotation.dart';

void testAnnotation(
  Type annotationType,
  Map<Symbol, dynamic> namedArguments,
) {
  test(annotationType.toString(), () {
    final clazzMirror = reflectClass(annotationType);

    final instance =
        clazzMirror.newInstance(const Symbol(''), [], namedArguments).reflectee;

    expect(instance, isA<ValidatorAnnotation>());
  });
}

void testAnnotations(
  String description,
  annotations,
  Map<Symbol, dynamic> namedArguments,
) {
  group(description, () {
    for (var annotation in annotations) {
      if (annotation.runtimeType.toString() != '_Type') {
        testAnnotation(annotation.runtimeType as Type, namedArguments);
      }
    }
  });
}
