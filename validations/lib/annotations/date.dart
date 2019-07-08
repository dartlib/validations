library annotations.date;

import 'package:meta/meta.dart';
import 'package:validations/validator_annotation.dart';

part './date/date_time.dart';
part './date/future_or_present.dart';
part './date/in_future.dart';
part './date/past.dart';
part './date/past_or_present.dart';

final dateAnnotations = [
  DateTime,
  FutureOrPresent,
  InFuture,
  Past,
  PastOrPresent,
];
