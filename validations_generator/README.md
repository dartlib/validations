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

The generator is capable of generating message methods which use the `intl` package.
The generated code will contain the `intl` method calls.

The string to be translated will be the `message` you've specified in the annotation or else
the default message for the annotation.

If you want to enable the generation of `intl` method calls set `useIntl` to true in your
annotation or enable it globally (see Build Configuration).

```dart
@GenValidator(
  use_intl: true,
)
```

## Build configuration

Besides setting arguments on the `GenValidator` annotation itself, you can also configure code generation by setting values in build.yaml.

```yaml
targets:
  $default:
    builders:
      validations_generator:
        options:
          use_intl: false 
```

## Debugging

Run `pub run build_runner generate-build-script`

And use the generated build script for debugging.