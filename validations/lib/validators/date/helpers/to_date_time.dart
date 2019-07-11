DateTime toDateTime(dynamic value) {
  if (value is DateTime) return value;

  if (value is String) return DateTime.parse(value);

  throw Exception('Failed to parse value');
}
