enum Role { doctor, helping_staff, nurse, manager, admin }

Role roleFromString(String value) {
  return Role.values.firstWhere(
    (e) => e.name.toUpperCase() == value.toUpperCase(),
  );
}

String roleToString(Role role) {
  return role.name.toUpperCase();
}
