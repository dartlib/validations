# Validations
<!-- Badges -->

[![Pub Package](https://img.shields.io/pub/v/validations.svg)](https://pub.dev/packages/validations)
[![Build Status](https://travis-ci.org/dartlib/validations.svg?branch=master)](https://travis-ci.org/dartlib/validations)


Validations enables you to annotation your models and classes using annotations;

It can be used to validate form information, models or any other class which benefits from
validation.

This module is loosely based on the JSR303 Bean Validation specification.

## Usage

### Generator

Add the generator to your dev dependencies

```yaml
dependencies:
  validations: ^1.0.0

dev_dependencies:
  build_runner: ^1.0.0
  validations_generator: ^1.0.0
```

### Define your models

```dart
import 'package:validations/validations.dart';

class Car {
  @NotNull
  final String manufacturer;

  @Size(
    min: 2,
    max: 14,
    message: 'The license plate '${validatedValue}' must be between {min} and {max} characters long'
  )
  final String licensePlate;

  @Min(
    value: 2,
    message: 'There must be at least {value} seat${value > 1 ? 's' : ''}'
  )
  final int seatCount;

  @DecimalMax(
    value: '350',
    message: 'The top speed ${formatter.format(r'%1$.2f', validatedValue)} is higher than {value}'
  )
  final double topSpeed;

  @DecimalMax(value: '100000', message: 'Price must not be higher than ${value}')
  final BigDecimal price;

  const Car(
    this.manufacturer,
    this.licensePlate,
    this.seatCount,
    this.topSpeed,
    this.price,
  );

  //getters and setters ...
}
```

then run the generator

```dart
pub run build_runner_build

# flutter
flutter packages pub run build_runner build
```

### Use it


```dart

final car = Car();

car.validate();

```

