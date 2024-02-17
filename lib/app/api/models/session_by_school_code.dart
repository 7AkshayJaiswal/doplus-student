class SchoolDataModel {
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
  String? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? renewalDate;
  String? prefix;
  String? companyLogo;

  SchoolDataModel({
    this.id,
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
    this.companyLogo,
  });

  SchoolDataModel.fromJson(Map<String, dynamic> json) {
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
