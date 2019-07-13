import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  final eternal = DateTime.now().add(Duration(days: double.maxFinite.toInt()));
  final negativeMax =
      DateTime.now().add(Duration(days: -double.maxFinite.toInt()));

  TestValidator(InFutureValidator())
    ..isValid({
      null,
      DateTime.now(),
      DateTime.now().toIso8601String(),
      eternal,
      eternal.toIso8601String(),
    })
    ..isInvalid({
      negativeMax,
      negativeMax.toIso8601String(),
    });
}
