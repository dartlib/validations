# Validations for Dart.

## Use cases


```dart
class Car {
  @NotNull(message: 'Name cannot be null')
  final String name;

  @AssertTrue
  final boolean working;

  @Size(min: 10, max: 200, message: 'About Me must be between 10 and 200 characters')
  final String aboutMe;

  @BrandIsSupported
  final String brand;

  @Email(message: 'Email should be valid')
  final String email;

  @after()
  final DateTime birthday;

  @Min(value: 8, message: 'Age should not be less than 18')
  @Max(value = 150, message = 'Age should not be greater than 150')
  final int age;

  @Size(
    min: 2,
    max: 14,
    message: 'The license plate ${validatedValue} must be between {min} and {max} characters long'
  )
  final String licensePlate;

}

```
The above is convenient to support, however I would prefer the generator method? (why?)
Could also just use a mixin, in any case you want to validate on the model (directly).
Same counts for the serializer I guess, but whatever.

The only benefit is it is a bit leaner to keep those separate.
Anyways let's just first support the generator method.

For the generator not using field annotations it would look like:
```cart
@GenValidator(
  fields: {
    name: [
      NotNull(message: 'Name cannot be null'),
    ],
    working: [
      AssertTrue
    ],
    age: [
      Min(value: 8, message: 'Age should not be less than 18'),
      Max(value: 150, message: 'Age should not be greater than 150'),
    ]
  }
)
class CarValidator extends Validator<Car> {}
```

Something like that?



## Usage

A simple usage example:

```dart
import 'package:validations/validations.dart';

main() {
  var awesome = new Awesome();
}
```

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
