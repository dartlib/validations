import 'package:validations/validators/string.dart';

import '../../test_validator.dart';

void main() {
  // https://blogs.msdn.microsoft.com/testing123/2009/02/06/email-address-test-cases/
  TestValidator(EmailValidator())
    ..isValid({
      null,
      'test@test.com',
      'email@domain.com', //	Valid email
      'firstname.lastname@domain.com', //	Email contains dot in the address field
      'email@subdomain.domain.com', //	Email contains dot with sub-domain
      'firstname+lastname@domain.com', //	Plus sign is considered valid character
      // TODO: validates as invalid
      // 'email@123.123.123.123', //	Domain is valid IP address
      // 'email@[123.123.123.123]', //	Square bracket around IP address is considered valid
      '"email"@domain.com', // Quotes around email is considered valid
      '1234567890@domain.com', //	Digits in address are valid
      'email@domain-one.com', // Dash in domain name is valid
      '_______@domain.com', // Underscore in the address field is valid
      'email@domain.name', // .name is valid Top Level Domain name
      'email@domain.co.jp', // Dot in Top Level Domain name also considered valid (use co.jp as example here)
      'firstname-lastname@domain.com', //	Dash in address field is valid
    })
    ..isInvalid({
      'plainaddress', // Missing @ sign and domain
      r'#@%^%#$@#$@#.com', //	Garbage
      '@domain.com	Missing', // username
      'Joe Smith <email@domain.com>', // Encoded html within email is invalid
      'email.domain.com', // Missing @
      'email@domain@domain.com', //	Two @ sign
      '.email@domain.com', //	Leading dot in address is not allowed
      'email.@domain.com', //	Trailing dot in address is not allowed
      'email..email@domain.com', //	Multiple dots
      // TODO: validates as valid
      // 'あいうえお@domain.com', // 	Unicode char as address
      'email@domain.com (Joe Smith)', //	Text followed email is not allowed
      'email@domain', //	Missing top level domain (.com/.net/.org/etc)
      'email@-domain.com', //	Leading dash in front of domain is invalid
      // 'email@domain.web', //	.web is not a valid top level domain
      'email@111.222.333.44444', //	Invalid IP format
      'email@domain..com', //	Multiple dot in the domain portion is invalid
    });
}
