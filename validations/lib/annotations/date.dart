library annotations.date;

import 'package:meta/meta.dart';

import '../annotation.dart';

part './date/after.dart';
part './date/before.dart';
part './date/future_or_present.dart';
part './date/in_future.dart';
part './date/past.dart';
part './date/past_or_present.dart';

/// [FutureOrPresent] annotation using default values
const futureOrPresent = FutureOrPresent();

/// [InFuture] annotation using default values
const future = InFuture();

/// [Past] annotation using default values
const past = Past();

/// [PastOrPresent] annotation using default values
const pastOrPresent = PastOrPresent();

final dateAnnotations = [
  futureOrPresent,
  future,
  past,
  pastOrPresent,
  After,
  Before,
  FutureOrPresent,
  InFuture,
  Past,
  PastOrPresent,
];
