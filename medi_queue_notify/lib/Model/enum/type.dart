enum Type { doctor, staff, admin }

Type typeFromString(String value) {
  return Type.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
  );
}

String typeToString(Type type) {
  return type.name.toUpperCase();
}
