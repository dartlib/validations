library validator_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'src/generator.dart';

Builder validatorGeneratorFactoryBuilder({bool useIntl}) {
  return SharedPartBuilder(
    [
      ValidatorGenerator(
        useIntl: useIntl,
      )
    ],
    'validators',
  );
}

Builder validatorGeneratorFactory(BuilderOptions options) {
  return validatorGeneratorFactoryBuilder(
    useIntl: options.config['use_intl'] as bool,
  );
}
