class LoginDataModel {
  int? id;
  int? organizationId;
  int? academicSessionId;
  int? schoolClassId;
  String? name;
  String? code;
  String? hindiName;
  String? email;
  String? mobile;
  String? doa;
  String? className;
  String? rollNumber;
  String? enrollmentId;
  String? dob;
  String? gender;
  String? bloogGroup;
  String? photo;
  String? weight;
  String? height;
  String? bmi;
  String? pulseRate;
  String? hb;
  String? allergies;
  String? covidVaccination;
  String? childImmunisation;
  String? immunisationRemark;
  String? lastSchoolName;
  String? lastSchoolAddress;
  String? lastSchoolBoard;
  String? lastSchoolMedium;
  String? lastTc;
  String? lastClassPassed;
  String? lastPercentage;
  int? takenBy;
  int? active;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? transportSubRouteId;
  int? transportPayableType;
  String? transportConcession;
  int? transportId;
  String? fineType;
  String? fineAmount;
  String? maxFine;
  String? transportPaymentDate;
  String? bloodGroup;
  int? transportRouteId;
  int? transportDurationMonths;
  String? studentAadhaar;
  String? areaId;
  String? residentInState;
  String? religionId;
  String? languageId;
  String? mediumId;
  String? nationalityId;
  String? castCategoryId;
  String? cast;
  String? minority;
  String? enrollmentType;
  String? handicapped;
  String? rationCard;
  String? rationCardType;
  String? rationCardNo;
  String? rte;
  String? udiseNo;
  String? sibling;
  String? refId;
  String? defaultAddress;
  String? paClass;
  String? paRollNo;
  String? paRegNo;
  String? paYear;
  String? paBoard;
  String? paSchool;
  String? paMarks;
  String? paObtainedMarks;
  String? paPercentage;
  String? paResult;
  String? paDivision;
  String? paTotal;
  String? concessionId;
  int? registrationType;
  String? deletedBy;
  int? isPromoted;
  String? password;
  int? type;
  ApiToken? apiToken;
  String? avatar;
  bool? isRefId;

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organization_id'];
    academicSessionId = json['academic_session_id'];
    schoolClassId = json['school_class_id'];
    name = json['name'];
    code = json['code'];
    hindiName = json['hindi_name'];
    email = json['email'];
    mobile = json['mobile'];
    doa = json['doa'];
    className = json['class'];
    rollNumber = json['roll_number'];
    enrollmentId = json['enrollment_id'];
    dob = json['dob'];
    gender = json['gender'];
    bloogGroup = json['bloog_group'];
    photo = json['photo'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
    pulseRate = json['pulse_rate'];
    hb = json['hb'];
    allergies = json['allergies'];
    covidVaccination = json['covid_vaccination'];
    childImmunisation = json['child_immunisation'];
    immunisationRemark = json['immunisation_remark'];
    lastSchoolName = json['last_school_name'];
    lastSchoolAddress = json['last_school_address'];
    lastSchoolBoard = json['last_school_board'];
    lastSchoolMedium = json['last_school_medium'];
    lastTc = json['last_tc'];
    lastClassPassed = json['last_class_passed'];
    lastPercentage = json['last_percentage'];
    takenBy = json['taken_by'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    transportSubRouteId = json['transport_sub_route_id'];
    transportPayableType = json['transport_payable_type'];
    transportConcession = json['transport_concession'];
    transportId = json['transport_id'];
    fineType = json['fine_type'];
    fineAmount = json['fine_amount'];
    maxFine = json['max_fine'];
    transportPaymentDate = json['transport_payment_date'];
    bloodGroup = json['blood_group'];
    transportRouteId = json['transport_route_id'];
    transportDurationMonths = json['transport_duration_months'];
    studentAadhaar = json['student_aadhaar'];
    areaId = json['area_id'];
    residentInState = json['resident_in_state'];
    religionId = json['religion_id'];
    languageId = json['language_id'];
    mediumId = json['medium_id'];
    nationalityId = json['nationality_id'];
    castCategoryId = json['cast_category_id'];
    cast = json['cast'];
    minority = json['minority'];
    enrollmentType = json['enrollment_type'];
    handicapped = json['handicapped'];
    rationCard = json['ration_card'];
    rationCardType = json['ration_card_type'];
    rationCardNo = json['ration_card_no'];
    rte = json['rte'];
    udiseNo = json['udise_no'];
    sibling = json['sibling'];
    refId = json['ref_id'];
    defaultAddress = json['default_address'];
    paClass = json['pa_class'];
    paRollNo = json['pa_roll_no'];
    paRegNo = json['pa_reg_no'];
    paYear = json['pa_year'];
    paBoard = json['pa_board'];
    paSchool = json['pa_school'];
    paMarks = json['pa_marks'];
    paObtainedMarks = json['pa_obtained_marks'];
    paPercentage = json['pa_percentage'];
    paResult = json['pa_result'];
    paDivision = json['pa_division'];
    paTotal = json['pa_total'];
    concessionId = json['concession_id'];
    registrationType = json['registration_type'];
    deletedBy = json['deleted_by'];
    isPromoted = json['is_promoted'];
    password = json['password'];
    type = json['type'];
    apiToken = (json['api_token'] != null
        ? ApiToken.fromJson(json['api_token'])
        : null);
    avatar = json['avatar'];
    isRefId = json['is_ref_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['organization_id'] = organizationId;
    data['academic_session_id'] = academicSessionId;
    data['school_class_id'] = schoolClassId;
    data['name'] = name;
    data['code'] = code;
    data['hindi_name'] = hindiName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['doa'] = doa;
    data['class'] = className;
    data['roll_number'] = rollNumber;
    data['enrollment_id'] = enrollmentId;
    data['dob'] = dob;
    data['gender'] = gender;
    data['bloog_group'] = bloogGroup;
    data['photo'] = photo;
    data['weight'] = weight;
    data['height'] = height;
    data['bmi'] = bmi;
    data['pulse_rate'] = pulseRate;
    data['hb'] = hb;
    data['allergies'] = allergies;
    data['covid_vaccination'] = covidVaccination;
    data['child_immunisation'] = childImmunisation;
    data['immunisation_remark'] = immunisationRemark;
    data['last_school_name'] = lastSchoolName;
    data['last_school_address'] = lastSchoolAddress;
    data['last_school_board'] = lastSchoolBoard;
    data['last_school_medium'] = lastSchoolMedium;
    data['last_tc'] = lastTc;
    data['last_class_passed'] = lastClassPassed;
    data['last_percentage'] = lastPercentage;
    data['taken_by'] = takenBy;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['transport_sub_route_id'] = transportSubRouteId;
    data['transport_payable_type'] = transportPayableType;
    data['transport_concession'] = transportConcession;
    data['transport_id'] = transportId;
    data['fine_type'] = fineType;
    data['fine_amount'] = fineAmount;
    data['max_fine'] = maxFine;
    data['transport_payment_date'] = transportPaymentDate;
    data['blood_group'] = bloodGroup;
    data['transport_route_id'] = transportRouteId;
    data['transport_duration_months'] = transportDurationMonths;
    data['student_aadhaar'] = studentAadhaar;
    data['area_id'] = areaId;
    data['resident_in_state'] = residentInState;
    data['religion_id'] = religionId;
    data['language_id'] = languageId;
    data['medium_id'] = mediumId;
    data['nationality_id'] = nationalityId;
    data['cast_category_id'] = castCategoryId;
    data['cast'] = cast;
    data['minority'] = minority;
    data['enrollment_type'] = enrollmentType;
    data['handicapped'] = handicapped;
    data['ration_card'] = rationCard;
    data['ration_card_type'] = rationCardType;
    data['ration_card_no'] = rationCardNo;
    data['rte'] = rte;
    data['udise_no'] = udiseNo;
    data['sibling'] = sibling;
    data['ref_id'] = refId;
    data['default_address'] = defaultAddress;
    data['pa_class'] = paClass;
    data['pa_roll_no'] = paRollNo;
    data['pa_reg_no'] = paRegNo;
    data['pa_year'] = paYear;
    data['pa_board'] = paBoard;
    data['pa_school'] = paSchool;
    data['pa_marks'] = paMarks;
    data['pa_obtained_marks'] = paObtainedMarks;
    data['pa_percentage'] = paPercentage;
    data['pa_result'] = paResult;
    data['pa_division'] = paDivision;
    data['pa_total'] = paTotal;
    data['concession_id'] = concessionId;
    data['registration_type'] = registrationType;
    data['deleted_by'] = deletedBy;
    data['is_promoted'] = isPromoted;
    data['password'] = password;
    data['type'] = type;
    if (apiToken != null) {
      data['api_token'] = apiToken?.toJson();
    }
    data['avatar'] = avatar;
    data['is_ref_id'] = isRefId;
    return data;
  }
}

class ApiToken {
  Original? original;
  String? exception;

  ApiToken({original, exception});

  ApiToken.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? Original.fromJson(json['original'])
        : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (original != null) {
      data['original'] = original!.toJson();
    }
    data['exception'] = exception;
    return data;
  }
}

class Original {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Original({accessToken, tokenType, expiresIn});

  Original.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['expires_in'] = expiresIn;
    return data;
  }
}
