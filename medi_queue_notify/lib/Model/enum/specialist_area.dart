enum SpecialistArea {
  generalPractice,
  cardiology,
  dermatology,
  neurology,
  orthopedics,
  pediatrics,
  gynecology,
  psychiatry,
  radiology,
  oncology,
  urology,
  dentistry,
  emergencyMedicine,
  anesthesiology,
  ent,
  ophthalmology,
  physiotherapy,
}

SpecialistArea specialistAreaFromString(String value) {
  return SpecialistArea.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
  );
}

String specialistAreaToString(SpecialistArea value) {
  return value.name.toUpperCase();
}
