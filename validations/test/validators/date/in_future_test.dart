import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  final eternal = DateTime.now().add(Duration(days: double.maxFinite.toInt()));
  final negativeMax =
      DateTime.now().add(Duration(days: -double.maxFinite.toInt()));

  TestValidator(InFutureValidator())
    ..isValid({
      null,
      eternal,
      eternal.toIso8601String(),
    })
    ..isInvalid({
      DateTime.now().toIso8601String(),
      DateTime.now(),
      negativeMax,
      negativeMax.toIso8601String(),
    });
}
