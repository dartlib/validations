part of validators.helpers;

DateTime toDateTime(dynamic value) {
  if (value is DateTime) return value;

  if (value is String) return DateTime.parse(value);

  throw Exception('Cannot convert value to DateTime.');
}
