import 'package:validations/validators/date.dart';

import '../../test_validator.dart';

void main() {
  final eternal = DateTime.now().add(Duration(days: double.infinity.toInt()));
  final negativeEternal =
      DateTime.now().add(Duration(days: double.negativeInfinity.toInt()));

  TestValidator(PastOrPresentValidator())
    ..isValid({
      null,
      DateTime.now(),
      DateTime.now().toIso8601String(),
      negativeEternal,
      negativeEternal.toIso8601String(),
    })
    ..isInvalid({
      eternal,
      eternal.toIso8601String(),
    });
}
