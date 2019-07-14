part of validators.date;

const timeUnits = [
  'year',
  'month',
  'day',
  'hour',
  'minute',
  'second',
  'millisecond',
  'microsecond',
];

abstract class TimeUnitBaseValidator extends ConstraintValidator {
  DateTime date;
  TimeUnit timeUnit;

  TimeUnitBaseValidator({
    Object timeUnit,
  }) : super([]) {
    setTimeUnit(timeUnit);

    argumentValues.add(this.timeUnit);
  }

  @override
  void initialize() {
    date = DateTime.now();

    argumentValues.add(date);
  }

  /// Will return true if [other] date is earlier and in case
  /// [inclusive] is set equal to the [date] based on the given time unit.
  bool _isBefore(
    TimeUnit timeUnit,
    DateTime date,
    DateTime other,
    bool inclusive,
  ) {
    return _isAfter(timeUnit, other, date, inclusive);
  }

  /// Will return true if [other] date is later and in case
  /// [inclusive] is set equal to the [date] based on the given time unit.
  bool _isAfter(
    TimeUnit timeUnit,
    DateTime date,
    DateTime other,
    bool inclusive,
  ) {
    final dateMap = _dateToMap(date);
    final otherMap = _dateToMap(other);

    final timeUnitString = enumItemToString(timeUnit);

    var result = false;
    for (var unit in timeUnits) {
      if (unit == timeUnitString) {
        if (inclusive) {
          result = otherMap[unit] >= dateMap[unit];
        } else {
          result = otherMap[unit] > dateMap[unit];
        }
        break;
      }

      if (otherMap[unit] < dateMap[unit]) {
        break;
      }
    }

    return result;
  }

  Map<String, int> _dateToMap(DateTime date) {
    return {
      'year': date.year,
      'month': date.month,
      'day': date.day,
      'hour': date.hour,
      'minute': date.minute,
      'second': date.second,
      'millisecond': date.millisecond,
      'microsecond': date.microsecond,
    };
  }

  String enumItemToString(enumItem) {
    return enumItem.toString().split('.')[1];
  }

  List<String> enumToString(value) {
    return (value as dynamic).values.map(enumItemToString) as List<String>;
  }

  void setTimeUnit(value) {
    if (value is String) {
      timeUnit = TimeUnit.values.firstWhere((enumItem) {
        return enumItemToString(enumItem) == value;
      }, orElse: () => null);
    } else if (value is TimeUnit) {
      timeUnit = value;
    }

    if (timeUnit == null) {
      throw ArgumentError('$timeUnit is not a valid time unit.');
    }
  }
}
