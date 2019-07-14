import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://github.com/dart-league/validators/blob/master/test/validator_test.dart
  TestValidator(UrlValidator())
    ..isValid({
      null,
      'foobar.com',
      'www.foobar.com',
      'foobar.com/',
      'valid.au',
      'http://www.foobar.com/',
      'http://www.foobar.com:23/',
      'http://www.foobar.com:65535/',
      'http://www.foobar.com:5/',
      'https://www.foobar.com/',
      'ftp://www.foobar.com/',
      'http://www.foobar.com/~foobar',
      'http://user:pass@www.foobar.com/',
      'http://127.0.0.1/',
      'http://10.0.0.0/',
      'http://10.0.0.0:3000/',
      'http://189.123.14.13/',
      'http://duckduckgo.com/?q=%2F',
      'http://foobar.com/t\$-_.+!*\'(),',
      'http://localhost:3000/',
      'http://foobar.com/?foo=bar#baz=qux',
      'http://foobar.com?foo=bar',
      'http://foobar.com#baz=qux',
      'http://www.xn--froschgrn-x9a.net/',
      'http://xn--froschgrn-x9a.com/',
      'http://foo--bar.com',
    })
    ..isInvalid({
      'xyz://foobar.com',
      'invalid/',
      'invalid.x',
      'invalid.',
      '.com',
      'http://com/',
      'http://300.0.0.1/',
      'mailto:foo@bar.com',
      'rtmp://foobar.com',
      'http://www.xn--.com/',
      'http://xn--.com/',
      'http:// :pass@www.foobar.com/',
      'http://www.foobar.com:0/',
      'http://www.foobar.com:70000/',
      'http://www.foobar.com:99999/',
      'http://www.-foobar.com/',
      'http://www.foobar-.com/',
      'http://www.foo---bar.com/',
      'http://www.foo_bar.com/',
      '',
      'http://foobar.com/${List(2083).join('f')}',
      'http://*.foo.com',
      '*.foo.com',
      '!.foo.com',
      'http://localhost:61500this is an invalid url!!!!',
    });

  TestValidator(UrlValidator(requireProtocol: false)).isValid({
    null,
    'www.example.com',
  });

  TestValidator(UrlValidator(requireTld: false)).isValid({
    null,
    'example',
  });
}
