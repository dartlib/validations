import 'package:analyzer/dart/element/element.dart';
import 'package:code_builder/code_builder.dart';

final seqExp = RegExp(r'(\d+)$');

class MessageMethod {
  final String name;
  final String message;
  final ClassElement validator;
  final String methodName;

  static Set<String> methodNames = {};

  String _generatedMethodName;

  MessageMethod({
    this.name,
    this.methodName,
    this.message,
    this.validator,
  }) {
    _generatedMethodName = _generateMethodName(methodName);
  }

  String _generateMethodName(String name) {
    var methodName = name;

    while (methodNames.contains(methodName)) {
      final matches = seqExp.allMatches(methodName);
      final count =
          matches.isEmpty ? 1 : int.parse(matches.toList().first.group(1)) + 1;
      methodName = '$methodName$count';
    }

    methodNames.add(methodName);

    return methodName;
  }

  Future<List<Parameter>> getParameters() async {
    final messageMethodParameters = <Parameter>[];

    final defaultMessageMethod = validator.getField(name);

    if (defaultMessageMethod == null) {
      throw Exception(
        [
          'The method $name is not defined in ${validator.name}',
          'Make sure it is defined with the correct amount of expected arguments',
        ].join('\n'),
      );
    }
    final resolvedLibrary = await defaultMessageMethod.library.session
        .getResolvedLibraryByElement(defaultMessageMethod.library);

    final fieldDeclaration =
        resolvedLibrary.getElementDeclaration(defaultMessageMethod);
    final source = fieldDeclaration.node.toSource();

    final exp = RegExp(r'\((.+)\)');
    final matches = exp.allMatches(source);

    final match = matches.toList()?.first?.group(1)?.split(', ');

    if (match != null) {
      final parameters = match.map((value) {
        final parts = value.split(' ');

        if (parts.length < 2) {
          throw FormatException(
            'Unable to determine type and name for parameter $value of $methodName',
          );
        }

        return Parameter((builder) {
          builder
            ..name = parts[1]
            ..type = refer(parts[0]);
        });
      });

      messageMethodParameters.addAll(parameters);
    }

    return messageMethodParameters;
  }

  String get generatedMethodName {
    return _generatedMethodName;
  }
}
