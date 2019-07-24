library validators.string;

import 'package:meta/meta.dart';
import 'package:validators/validators.dart'
    show
        isAlpha,
        isAlphanumeric,
        isAscii,
        isBase64,
        isCreditCard,
        isEmail,
        isFQDN,
        isHexadecimal,
        isHexColor,
        isIP,
        isISBN,
        isJSON,
        isLowercase,
        isMongoId,
        isNumeric,
        isUppercase,
        isURL,
        isByteLength,
        isUUID;

import '../validator.dart';

part 'string/alpha.dart';
part 'string/alpha_numeric.dart';
part 'string/ascii.dart';
part 'string/base64.dart';
part 'string/byte_length.dart';
part 'string/credit_card_number.dart';
part 'string/email.dart';
part 'string/fqdn.dart';
part 'string/hex_color.dart';
part 'string/hexadecimal.dart';
part 'string/ip.dart';
part 'string/isbn.dart';
part 'string/json.dart';
part 'string/lowercase.dart';
part 'string/mongo_id.dart';
part 'string/numeric.dart';
part 'string/pattern.dart';
part 'string/uppercase.dart';
part 'string/url.dart';
part 'string/uuid.dart';

final stringValidators = [
  AlphaValidator,
  AlphaNumericValidator,
  AsciiValidator,
  Base64Validator,
  ByteLengthValidator,
  CreditCardNumberValidator,
  EmailValidator,
  FqdnValidator,
  HexColorValidator,
  HexadecimalValidator,
  IpValidator,
  ISBNValidator,
  JsonValidator,
  LowercaseValidator,
  MongoIdValidator,
  NumericValidator,
  PatternValidator,
  UppercaseValidator,
  UrlValidator,
  UuidValidator,
];
