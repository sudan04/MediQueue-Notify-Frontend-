enum Shift { morning, evening, night }

Shift shiftFromString(String value) {
  return Shift.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
  );
}

String shiftToString(Shift shift) {
  return shift.name.toUpperCase();
}
