///@nodoc
import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:source_gen/source_gen.dart';
import 'package:validations/validations.dart' as validator;

import 'parser/model.dart';

class ValidatorGenerator
    extends GeneratorForAnnotation<validator.GenValidator> {
  const ValidatorGenerator();

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw new InvalidGenerationSourceError(
        'GenValidator can only be defined on a class.',
        todo:
            'Remove the [GenValidator] annotation from `${element.displayName}`.',
        element: element,
      );
    }

    final className = element.name;

    print('Generating validator for $className');

    try {
      return ModelParser(
        generatorClass: element,
      ).parse();
    } catch (exception, stackTrace) {
      throw '/*\nError while generating for bean ${className}\n$exception\n$stackTrace\n*/';
    }
  }
}
