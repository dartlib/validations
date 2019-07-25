## 0.8.3
 - update validations dependency to 0.8.3

## 0.8.2
 - fix affectFields to only contain fields referenced by the validator
 - statically determine whether an annotation is a validation annotation,
   instead of testing against known runtime types.

## 0.8.1
 - fix getAnnotation failing to detect @Constraint annotation

## 0.8.0
 - add @Target to field annotations
 - add @Constraint to field annotations
 - fix time unit validator
 - improve class level validations and error messages

## 0.7.0
- add support for class level validators
- add a FieldMatch class level validator
- introduce @property to support constructing class level validators.

## 0.6.0
- make internationalization of messages optional.
- generate to shared part files
- extension changed from `.gval.dart` to `.g.dart`

## 0.5.1

- update validators dependency.

## 0.5.0

- change generated class prefix from $_ to _$ (private).

## 0.4.0

- Add optional `fields` parameter to Genvalidator to generate validators.

## 0.3.0

- Update validations dependency

## 0.2.0

- Wrap property validators with a FieldValidator to enable type checking.

## 0.1.0

- Alpha version

## 0.0.1

- Initial version
