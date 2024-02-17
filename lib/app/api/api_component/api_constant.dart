class ApiConstant {
  static String get baseUrl => "https://education.dopluserp.com";

  static String get apiUrl => "$baseUrl/api";

  static String sessionBySchoolCode({required String schoolCode}) =>
      "$apiUrl/organizations?org_code=$schoolCode";

  static String get login => "$apiUrl/login";

  static String changePassword({
    required String studentID,
    required String oldPass,
    required String newPass,
    required String schoolID,
  }) =>
      "$apiUrl/Login/StudentChangepassword/StudentID/OldPass/NewPass/SchoolID";

  static String profile({
    required String id,
    required String type,
  }) =>
      "$apiUrl/profile?id=$id&type=$type";
}
