library validators.date;

import 'package:meta/meta.dart';

import '../validator.dart';
import 'helpers.dart';

part 'date/after.dart';
part 'date/before.dart';
part 'date/date_time_base.dart';
part 'date/future_or_present.dart';
part 'date/in_future.dart';
part 'date/past.dart';
part 'date/past_or_present.dart';
part 'date/time_unit.dart';
part 'date/time_unit_base_validator.dart';

final dateValidators = [
  AfterValidator,
  BeforeValidator,
  DateTimeBaseValidator,
  FutureOrPresentValidator,
  InFutureValidator,
  PastValidator,
  PastOrPresentValidator,
];
