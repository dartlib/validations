/// To use, import `package:validations/annotations/string.dart`
library annotations.string;

import 'package:meta/meta.dart';

import '../annotation.dart';
import '../validators.dart';

part 'string/alpha.dart';
part 'string/credit_card_number.dart';
part 'string/email.dart';
part 'string/hex_color.dart';
part 'string/hexadecimal.dart';
part 'string/isbn.dart';
part 'string/json.dart';
part 'string/lowercase.dart';
part 'string/mongo_id.dart';
part 'string/numeric.dart';
part 'string/pattern.dart';
part 'string/uppercase.dart';
part 'string/url.dart';
part 'string/uuid.dart';

/// [Alpha] annotation using default values
const alpha = Alpha();

/// [CreditCardNumber] annotation using default values
const creditCardNumber = CreditCardNumber();

/// [Email] annotation using default values
const email = Email();

/// [HexColor] annotation using default values
const hexcolor = HexColor();

/// [Hexadecimal] annotation using default values
const hexadecimal = Hexadecimal();

/// [ISBN] annotation using default values
const isbn = ISBN();

/// [Json] annotation using default values
const json = Json();

/// [Lowercase] annotation using default values
const lowercase = Lowercase();

/// [MongoId] annotation using default values
const mongoId = MongoId();

/// [Numeric] annotation using default values
const numeric = Numeric();

/// [URL] annotation using default values
const url = URL();

/// [Uppercase] annotation using default values
const uppercase = Uppercase();

/// [Uuid] annotation using default values
const uuid = Uuid();

final stringAnnotations = [
  Alpha,
  CreditCardNumber,
  Email,
  HexColor,
  Hexadecimal,
  ISBN,
  Json,
  Lowercase,
  MongoId,
  Numeric,
  Pattern,
  URL,
  Uppercase,
  Uuid,
  alpha,
  creditCardNumber,
  email,
  hexadecimal,
  hexcolor,
  isbn,
  json,
  lowercase,
  mongoId,
  numeric,
  uppercase,
  url,
  uuid,
];
