library validators.collection;

import '../validator.dart';

part 'collection/unique.dart';
part 'collection/valid.dart';

final collectionValidators = [
  UniqueValidator,
  ValidValidator,
];
