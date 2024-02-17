import 'package:get/get.dart';

class Validator {
  static String? validateSchoolCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourSchoolCode'.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourPassword'.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourEmail'.tr;
    }
    return null;
  }
  static String? validateAcaYear(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourAcademicYear'.tr;
    }
    return null;
  }
  static String? validateSchoolId(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourSchoolId'.tr;
    }
    return null;
  }
  static String? validateStdContact(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourStdContact'.tr;
    }
    return null;
  }
  static String? validateOldPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterOldPassword'.tr;
    }
    return null;
  }
  static String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'enterNewPassword'.tr;
    }
    return null;
  }
  static String? validateNewConfirmPassword(String? value, String? pwdNew) {
    if (value == null || value.isEmpty) {
      return 'enterNewConfirmPassword'.tr;
    }else if (pwdNew != value){
      return 'newPwdAndConfirmNewShouldBeSame'.tr;
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourName'.tr;
    }
    return null;
  }

  static String? validateOtp(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourOtp'.tr;
    } else if (value.length < 6) {
      return 'invalidOtp'.tr;
    }
    return null;
  }

  static String? validateContactNo15(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourContactNo'.tr;
    } else if (value.length < 9 && value.length > 15) {
      return 'invalidContactNo'.tr;
    }
    return null;
  }

  static String? validateEventDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'selectEventDate'.tr;
    }
    return null;
  }

  static String? validateEventTime(String? value) {
    if (value == null || value.isEmpty) {
      return 'selectEventTime'.tr;
    }
    return null;
  }

  static String? validateContactPerson(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourContactPerson'.tr;
    }
    return null;
  }

  static String? validateProjectName(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourProjectName'.tr;
    }
    return null;
  }

  static String? validateTaskName(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourTaskName'.tr;
    }
    return null;
  }

  static String? validateDaySubject(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterDaySubject'.tr;
    }
    return null;
  }

  static String? validateDayTravel(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterDayTravel'.tr;
    }
    return null;
  }

  static String? validateRequirement(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourRequirement'.tr;
    }
    return null;
  }

  static String? validateTitle(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterYourTitle'.tr;
    }
    return null;
  }

  static String? validateCallOutcome(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseEnterCallOutcome'.tr;
    }
    return null;
  }

  static String? validateLeaveFrom(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseSelectLeaveFrom'.tr;
    }
    return null;
  }

  static String? validateLeaveToo(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseSelectLeaveToo'.tr;
    }
    return null;
  }

  static String? validatePurpose(String? value) {
    if (value == null || value.isEmpty) {
      return 'pleaseSelectPurpose'.tr;
    }
    return null;
  }
}
