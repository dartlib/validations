class A {}

final types = [A];

Type check(Type t) {
  return t;
}

main() {
  final heh = types.map((type) {
    return check(type);
  });
}
