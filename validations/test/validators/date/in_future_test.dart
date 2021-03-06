import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  final future = DateTime.now().add(Duration(days: 100));
  final past = DateTime.now().add(Duration(days: -100));

  TestValidator(InFutureValidator(timeUnit: TimeUnit.day))
    ..isValid({
      null,
      future,
      future.toIso8601String(),
    })
    ..isInvalid({
      DateTime.now().toIso8601String(),
      DateTime.now(),
      past,
      past.toIso8601String(),
    });
}
