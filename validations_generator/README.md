# Validator Generator

A Validator generator.

## Install

pub global active validator_generator

## Usage

*run*

`validator_generator build`

## Debugging

First run `pub run build_runner generate-build-script`.
This will generate the build script `.dart_tool/build/entrypoint/build.dart`.

Set some breakpoints and launch `.dart_tool/build/entrypoint/build.dart run build_runner build`
to start debugging.
