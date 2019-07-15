import 'dart:mirrors';

import 'package:test/test.dart';
import 'package:validations/annotation.dart';

dynamic _getInstance(Type annotationType,
    [Map<Symbol, dynamic> namedArguments]) {
  final classMirror = reflectClass(annotationType);

  return classMirror
      .newInstance(
        const Symbol(''),
        [],
        namedArguments,
      )
      .reflectee;
}

class TestAnnotation {
  TestAnnotation(Type annotationType, Map<Symbol, dynamic> namedArguments) {
    test(annotationType.toString(), () {
      final instance = _getInstance(annotationType, namedArguments);
      expect(instance, isA<ValidatorAnnotation>());
    });
  }
}

void testAnnotations(
  String description,
  annotations,
  Map<Symbol, dynamic> namedArguments,
) {
  group(description, () {
    for (var annotation in annotations) {
      if (!annotation.toString().startsWith('Instance of')) {
        TestAnnotation(annotation as Type, namedArguments);
      }
    }
  });
}

void testListContainsOnlyAnnotationClassesOrInstances(
  String description,
  annotations,
) {
  final validatorAnnotationMirror = reflectClass(ValidatorAnnotation);
  group(description, () {
    for (var annotation in annotations) {
      test(description, () {
        if (annotation.toString().startsWith('Instance of')) {
          expect(
            reflect(annotation).type.isSubclassOf(validatorAnnotationMirror),
            true,
          );
        } else {
          expect(
            reflectClass(annotation as Type)
                .isSubclassOf(validatorAnnotationMirror),
            true,
          );
        }
      });
    }
  });
}
