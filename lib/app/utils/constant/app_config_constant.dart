class AppConstant {
  static String get currentRole => "4";
  static bool get isStudent => true;
  static bool get isTeacher => false;
  static bool get isAdmin => false;
  static RoleType get currentRoleType => RoleType.Student;
}
enum RoleType {
  Student,
  Faculty,
  Admin,
}
