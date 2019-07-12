import 'package:test/test.dart';
import 'package:validations/validators/collection.dart';

import '../../test_validator.dart';

void main() {
  group('UniqueValidator', () {
    final validLists = {
      [],
      ['A', 'B']
    };

    final invalidLists = {
      ['A', 'A'],
      [null, null]
    };

    final validMaps = {
      {},
      {'A': 'A', 'B': 'B'}
    };

    final invalidMaps = {
      {'A': null, 'B': null},
      {'A': 'A', 'B': 'A'},
    };

    // Are always unique, still allowed nevertheless.
    final validSets = {
      {},
      {'A', 'B'}
    };

    TestValidator(UniqueValidator())
      ..isValid(validLists, 'Valid Lists')
      ..isValid(validMaps, 'Valid Maps')
      ..isValid(validSets, 'Valid Sets')
      ..isInvalid(invalidLists, 'Invalid Lists')
      ..isInvalid(invalidMaps, 'Invalid Maps');
  });
}
