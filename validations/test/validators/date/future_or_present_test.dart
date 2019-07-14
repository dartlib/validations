import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  final future = DateTime.now().add(Duration(days: 100));
  final past = DateTime.now().add(Duration(days: -100));

  TestValidator(FutureOrPresentValidator(timeUnit: TimeUnit.day))
    ..isValid({
      null,
      DateTime.now(),
      DateTime.now().toIso8601String(),
      future,
      future.toIso8601String(),
    })
    ..isInvalid({
      past,
      past.toIso8601String(),
    });
}
