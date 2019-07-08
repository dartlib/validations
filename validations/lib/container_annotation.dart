import 'package:meta/meta.dart';
import 'package:validations/validator_annotation.dart';

@immutable
abstract class ContainerAnnotation extends ValidatorAnnotation {
  const ContainerAnnotation(
    message,
    groups,
  ) : super(message, groups);
}
