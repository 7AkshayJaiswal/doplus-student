class ProfileDataModel {
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
  String? classData;
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
  Organization? organization;
  AcademicSession? academicSession;
  SchoolClass? schoolClass;
  String? avatar;
  bool? isRefId;

  ProfileDataModel({
    this.id,
    this.organizationId,
    this.academicSessionId,
    this.schoolClassId,
    this.name,
    this.code,
    this.hindiName,
    this.email,
    this.mobile,
    this.doa,
    this.classData,
    this.rollNumber,
    this.enrollmentId,
    this.dob,
    this.gender,
    this.bloogGroup,
    this.photo,
    this.weight,
    this.height,
    this.bmi,
    this.pulseRate,
    this.hb,
    this.allergies,
    this.covidVaccination,
    this.childImmunisation,
    this.immunisationRemark,
    this.lastSchoolName,
    this.lastSchoolAddress,
    this.lastSchoolBoard,
    this.lastSchoolMedium,
    this.lastTc,
    this.lastClassPassed,
    this.lastPercentage,
    this.takenBy,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.transportSubRouteId,
    this.transportPayableType,
    this.transportConcession,
    this.transportId,
    this.fineType,
    this.fineAmount,
    this.maxFine,
    this.transportPaymentDate,
    this.bloodGroup,
    this.transportRouteId,
    this.transportDurationMonths,
    this.studentAadhaar,
    this.areaId,
    this.residentInState,
    this.religionId,
    this.languageId,
    this.mediumId,
    this.nationalityId,
    this.castCategoryId,
    this.cast,
    this.minority,
    this.enrollmentType,
    this.handicapped,
    this.rationCard,
    this.rationCardType,
    this.rationCardNo,
    this.rte,
    this.udiseNo,
    this.sibling,
    this.refId,
    this.defaultAddress,
    this.paClass,
    this.paRollNo,
    this.paRegNo,
    this.paYear,
    this.paBoard,
    this.paSchool,
    this.paMarks,
    this.paObtainedMarks,
    this.paPercentage,
    this.paResult,
    this.paDivision,
    this.paTotal,
    this.concessionId,
    this.registrationType,
    this.deletedBy,
    this.isPromoted,
    this.password,
    this.organization,
    this.academicSession,
    this.schoolClass,
    this.avatar,
    this.isRefId,
  });

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
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
    classData = json['class'];
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
    organization = json['organization'] != null
        ? new Organization.fromJson(json['organization'])
        : null;
    academicSession = json['academic_session'] != null
        ? new AcademicSession.fromJson(json['academic_session'])
        : null;
    schoolClass = json['school_class'] != null
        ? new SchoolClass.fromJson(json['school_class'])
        : null;
    avatar = json['avatar'];
    isRefId = json['is_ref_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_id'] = this.organizationId;
    data['academic_session_id'] = this.academicSessionId;
    data['school_class_id'] = this.schoolClassId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['hindi_name'] = this.hindiName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['doa'] = this.doa;
    data['class'] = this.classData;
    data['roll_number'] = this.rollNumber;
    data['enrollment_id'] = this.enrollmentId;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['bloog_group'] = this.bloogGroup;
    data['photo'] = this.photo;
    data['weight'] = this.weight;
    data['height'] = this.height;
    data['bmi'] = this.bmi;
    data['pulse_rate'] = this.pulseRate;
    data['hb'] = this.hb;
    data['allergies'] = this.allergies;
    data['covid_vaccination'] = this.covidVaccination;
    data['child_immunisation'] = this.childImmunisation;
    data['immunisation_remark'] = this.immunisationRemark;
    data['last_school_name'] = this.lastSchoolName;
    data['last_school_address'] = this.lastSchoolAddress;
    data['last_school_board'] = this.lastSchoolBoard;
    data['last_school_medium'] = this.lastSchoolMedium;
    data['last_tc'] = this.lastTc;
    data['last_class_passed'] = this.lastClassPassed;
    data['last_percentage'] = this.lastPercentage;
    data['taken_by'] = this.takenBy;
    data['active'] = this.active;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['transport_sub_route_id'] = this.transportSubRouteId;
    data['transport_payable_type'] = this.transportPayableType;
    data['transport_concession'] = this.transportConcession;
    data['transport_id'] = this.transportId;
    data['fine_type'] = this.fineType;
    data['fine_amount'] = this.fineAmount;
    data['max_fine'] = this.maxFine;
    data['transport_payment_date'] = this.transportPaymentDate;
    data['blood_group'] = this.bloodGroup;
    data['transport_route_id'] = this.transportRouteId;
    data['transport_duration_months'] = this.transportDurationMonths;
    data['student_aadhaar'] = this.studentAadhaar;
    data['area_id'] = this.areaId;
    data['resident_in_state'] = this.residentInState;
    data['religion_id'] = this.religionId;
    data['language_id'] = this.languageId;
    data['medium_id'] = this.mediumId;
    data['nationality_id'] = this.nationalityId;
    data['cast_category_id'] = this.castCategoryId;
    data['cast'] = this.cast;
    data['minority'] = this.minority;
    data['enrollment_type'] = this.enrollmentType;
    data['handicapped'] = this.handicapped;
    data['ration_card'] = this.rationCard;
    data['ration_card_type'] = this.rationCardType;
    data['ration_card_no'] = this.rationCardNo;
    data['rte'] = this.rte;
    data['udise_no'] = this.udiseNo;
    data['sibling'] = this.sibling;
    data['ref_id'] = this.refId;
    data['default_address'] = this.defaultAddress;
    data['pa_class'] = this.paClass;
    data['pa_roll_no'] = this.paRollNo;
    data['pa_reg_no'] = this.paRegNo;
    data['pa_year'] = this.paYear;
    data['pa_board'] = this.paBoard;
    data['pa_school'] = this.paSchool;
    data['pa_marks'] = this.paMarks;
    data['pa_obtained_marks'] = this.paObtainedMarks;
    data['pa_percentage'] = this.paPercentage;
    data['pa_result'] = this.paResult;
    data['pa_division'] = this.paDivision;
    data['pa_total'] = this.paTotal;
    data['concession_id'] = this.concessionId;
    data['registration_type'] = this.registrationType;
    data['deleted_by'] = this.deletedBy;
    data['is_promoted'] = this.isPromoted;
    data['password'] = this.password;
    if (this.organization != null) {
      data['organization'] = this.organization!.toJson();
    }
    if (this.academicSession != null) {
      data['academic_session'] = this.academicSession!.toJson();
    }
    if (this.schoolClass != null) {
      data['school_class'] = this.schoolClass!.toJson();
    }
    data['avatar'] = this.avatar;
    data['is_ref_id'] = this.isRefId;
    return data;
  }
}

class Organization {
  int? id;
  String? name;
  String? displayName;
  String? orgCode;
  String? domain;
  String? logo;
  String? address;
  String? cityId;
  String? stateId;
  String? postalCode;
  String? email;
  String? phone;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? renewalDate;
  String? prefix;
  String? companyLogo;

  Organization(
      {this.id,
      this.name,
      this.displayName,
      this.orgCode,
      this.domain,
      this.logo,
      this.address,
      this.cityId,
      this.stateId,
      this.postalCode,
      this.email,
      this.phone,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.renewalDate,
      this.prefix,
      this.companyLogo});

  Organization.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['display_name'];
    orgCode = json['org_code'];
    domain = json['domain'];
    logo = json['logo'];
    address = json['address'];
    cityId = json['city_id'];
    stateId = json['state_id'];
    postalCode = json['postal_code'];
    email = json['email'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    renewalDate = json['renewal_date'];
    prefix = json['prefix'];
    companyLogo = json['company_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['org_code'] = this.orgCode;
    data['domain'] = this.domain;
    data['logo'] = this.logo;
    data['address'] = this.address;
    data['city_id'] = this.cityId;
    data['state_id'] = this.stateId;
    data['postal_code'] = this.postalCode;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['renewal_date'] = this.renewalDate;
    data['prefix'] = this.prefix;
    data['company_logo'] = this.companyLogo;
    return data;
  }
}

class AcademicSession {
  int? id;
  int? organizationId;
  String? name;
  String? from;
  String? to;
  int? active;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  AcademicSession(
      {this.id,
      this.organizationId,
      this.name,
      this.from,
      this.to,
      this.active,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  AcademicSession.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organization_id'];
    name = json['name'];
    from = json['from'];
    to = json['to'];
    active = json['active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_id'] = this.organizationId;
    data['name'] = this.name;
    data['from'] = this.from;
    data['to'] = this.to;
    data['active'] = this.active;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SchoolClass {
  int? id;
  int? organizationId;
  String? name;
  String? startDate;
  String? endDate;
  int? maxStudents;
  int? createdBy;
  int? active;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? academicSessionId;

  SchoolClass(
      {this.id,
      this.organizationId,
      this.name,
      this.startDate,
      this.endDate,
      this.maxStudents,
      this.createdBy,
      this.active,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.academicSessionId});

  SchoolClass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    organizationId = json['organization_id'];
    name = json['name'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    maxStudents = json['max_students'];
    createdBy = json['created_by'];
    active = json['active'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    academicSessionId = json['academic_session_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['organization_id'] = this.organizationId;
    data['name'] = this.name;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['max_students'] = this.maxStudents;
    data['created_by'] = this.createdBy;
    data['active'] = this.active;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['academic_session_id'] = this.academicSessionId;
    return data;
  }
}
