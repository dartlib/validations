num parseNum(dynamic value) {
  if (value is num) return value;

  if (value is String) return num.parse(value);

  throw Exception('Could not parse value.');
}
