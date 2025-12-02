enum CertificateStatus { active, expired }

CertificateStatus certificateStatusFromString(String value) {
  return CertificateStatus.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
  );
}

String certificateStatusToString(CertificateStatus status) {
  return status.name.toUpperCase();
}
