import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  final eternal = DateTime.now().add(Duration(days: double.infinity.toInt()));
  final negativeEternal =
      DateTime.now().add(Duration(days: double.negativeInfinity.toInt()));

  TestValidator(InFutureValidator())
    ..isValid({
      null,
      eternal,
      eternal.toIso8601String(),
    })
    ..isInvalid({
      DateTime.now().toIso8601String(),
      DateTime.now(),
      negativeEternal,
      negativeEternal.toIso8601String(),
    });
}
