# validations

A new Flutter project.

## Internationalization

To support internationalization `useIntl` is enable in the `build.yaml`.

After this you must run the build again to generate Intl messages withtin the generated files:

```dart
pub run build_runner build
```

In order to extract the messages from these generated files you must run
a command similar to the one below:

```dart
flutter pub run intl_translation:extract_to_arb --output-dir=lib/l10n lib/**/*.g.dart
```

The default generated file is `intl_messages.arb`

Use `--output-file` to specify a different output file.




