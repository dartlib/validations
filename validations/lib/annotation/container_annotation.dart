part of annotation;

@immutable
abstract class ContainerAnnotation extends ValidatorAnnotation {
  const ContainerAnnotation(
    String message,
    List<String> groups,
  ) : super(message, groups);
}
