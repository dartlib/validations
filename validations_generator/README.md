# Validations Generator
<!-- Badges -->

[![Pub Package](https://img.shields.io/pub/v/validations.svg)](https://pub.dev/packages/validations)
[![Build Status](https://travis-ci.org/dartlib/validations.svg?branch=master)](https://travis-ci.org/dartlib/validations)

A validations generator for the package [validations](https://pub.dev/packages/validations)

See that package for main setup and it's usage.

## Usage

*run*

`pub run build_runner build`

## Internationalization

The generator is capable of generating message methods which use the [intl](https://pub.dev/packages/intl) package.

The string to be translated will be the `message` you've specified in the annotation or else
the default message for the annotation.

In order to enable the generation of `intl` add the following to your `build.yaml` configuration.

```yaml
targets:
  $default:
    builders:
      validations_generator:
        options:
          use_intl: true 
```

### Intl Example

Given an annotation like this:
```dart
@Max(
  value: 350,
  message: r'The top speed $validatedValue is higher than $value',
)
int topSpeed;
```

Without intl the generated code will be:
```dart
static String topSpeedMaxMessage(num value, Object validatedValue) {
  return 'The top speed $validatedValue is higher than $value';
}
```

With intl:
```dart
static String topSpeedMaxMessage(num value, Object validatedValue) =>
  Intl.message(
   'The top speed $validatedValue is higher than $value',
   name: 'topSpeedMaxMessage',
   args: [value, validatedValue]
);
```

Note:
  Make sure you import the [package:intl](https://pub.dev/packages/intl) package from the source file in order for the
  generated code to find the package.

## Debugging

Run `pub run build_runner generate-build-script`

And use the generated build script for debugging.