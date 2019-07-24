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

    defaultArgumentValues = [this.timeUnit];
    argumentValues = List.of(defaultArgumentValues);
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

    // iterate from year, months, days etc.
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
    final maxDaysInMonth = 31;
    final year = date.year;
    final monthsAD = date.month + (date.year * 12);
    final daysAD = date.day + (date.month * maxDaysInMonth);
    final hourOfDay = date.hour;
    final minuteOfDay = date.minute + (hourOfDay * 60);
    final secondOfDay = date.second + (minuteOfDay * 60);
    final millisecondOfDay = date.millisecond + (secondOfDay * 1000);
    final microsecondOfDay = date.microsecond + (millisecondOfDay * 1000);

    return {
      'year': year,
      'month': monthsAD,
      'day': daysAD,
      'hour': hourOfDay,
      'minute': minuteOfDay,
      'second': secondOfDay,
      'millisecond': millisecondOfDay,
      'microsecond': microsecondOfDay,
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
