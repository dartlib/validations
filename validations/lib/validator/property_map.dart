part of validator;

// Example:
//   PropertyMap<Car> props(Object instance) {
//     return PropertyMap<Car>({
//       'manufacturer': instance.manufacturer,
//       'driver': instance.driver,
//       'licensePlate': instance.licensePlate,
//       'seatCount': instance.seatCount,
//       'topSpeed': instance.topSpeed,
//       ...
//     });
//   }
class PropertyMap<ValueType> extends UnmodifiableMapBase<String, dynamic> {
  final Map<String, dynamic> _source;

  PropertyMap(this._source);

  @override
  Iterable<String> get keys => _source.keys;

  @override
  dynamic operator [](Object key) => _source[key];

  PropertyMap<ValueType> add(String name, Object value) {
    final result = <String, dynamic>{};
    _source.forEach((k, v) {
      result[k] = v;
    });

    result[name] = value;

    return PropertyMap<ValueType>(result);
  }
}
