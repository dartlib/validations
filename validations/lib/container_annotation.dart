import 'package:meta/meta.dart';
import 'package:validations/validator_annotation.dart';

@immutable
abstract class ContainerAnnotation extends ValidatorAnnotation {
  const ContainerAnnotation(
    String message,
    List<String> groups,
  ) : super(message, groups);
}
