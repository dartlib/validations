part of annotations;

@immutable
class GenValidator {
  final Map<String, List<ValidatorAnnotation>> fields;
  const GenValidator({
    this.fields,
  });
}
