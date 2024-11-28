import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

import '../../domain/entity/customer_card_entity.dart';

class CustomerModel extends CustomerCardEntity {
  CustomerModel({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.email,
    this.image,
    required this.approved,
    this.government,
    this.legalName,
    this.isPhoneVerified,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.cmFirebaseToken,
    this.status,
    this.orderCount,
    this.loginMedium,
    this.socialId,
    this.zoneId,
    this.walletBalance,
    this.loyaltyPoint,
    this.refCode,
    this.currentLanguageKey,
    this.refBy,
    this.tempToken,
    this.moduleIds,
    this.imageFullUrl,
    this.storage,
  }) : super(
          customerId: "$id",
          name:
              "${fName == null ? '' : fName.trim()} ${lName == null ? '' : lName.trim()}",
          pharmacyName: legalName,
          city: government,
          color: Color.fromARGB(255, Random().nextInt(255),
              Random().nextInt(255), Random().nextInt(255)),
          // lastOrderDate: createdAt,
          image: image,
          isVerified: approved,
        );

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CustomerModel].
  factory CustomerModel.fromJson(String data) {
    return CustomerModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  factory CustomerModel.fromMap(Map<String, dynamic> data) {
    return CustomerModel(
      id: data['id'] as int?,
      fName: data['f_name'] as String?,
      lName: data['l_name'] as String?,
      phone: data['phone'] as String?,
      email: data['email'] as String?,
      image: data['image'] as String?,
      legalName: data['legal_name'] as String?,
      government: data['government'] as String?,
      approved: (data['approved'] as String?) == "1",
      isPhoneVerified: data['is_phone_verified'] as int?,
      emailVerifiedAt: data['email_verified_at'] == null
          ? null
          : DateTime.parse(data['email_verified_at'] as String),
      createdAt: data['created_at'] == null
          ? null
          : DateTime.parse(data['created_at'] as String),
      updatedAt: data['updated_at'] == null
          ? null
          : DateTime.parse(data['updated_at'] as String),
      cmFirebaseToken: data['cm_firebase_token'] as String?,
      status: data['status'] as int?,
      orderCount: data['order_count'] as int?,
      loginMedium: data['login_medium'] as dynamic,
      socialId: data['social_id'] as dynamic,
      zoneId: data['zone_id'] as int?,
      walletBalance: data['wallet_balance'] as int?,
      loyaltyPoint: data['loyalty_point'] as int?,
      refCode: data['ref_code'] as String?,
      currentLanguageKey: data['current_language_key'] as String?,
      refBy: data['ref_by'] as dynamic,
      tempToken: data['temp_token'] as dynamic,
      moduleIds: data['module_ids'] as String?,
      imageFullUrl: data['image_full_url'] as dynamic,
      storage: data['storage'] as List<dynamic>?,
    );
  }
  final int? id;
  final String? fName;
  final String? lName;
  final String? phone;
  final String? email;
  final String? image;
  final String? government;
  final String? legalName;
  final bool approved;
  final int? isPhoneVerified;
  final DateTime? emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? cmFirebaseToken;
  final int? status;
  final int? orderCount;
  final dynamic loginMedium;
  final dynamic socialId;
  final int? zoneId;
  final int? walletBalance;
  final int? loyaltyPoint;
  final String? refCode;
  final String? currentLanguageKey;
  final dynamic refBy;
  final dynamic tempToken;
  final String? moduleIds;
  final dynamic imageFullUrl;
  final List<dynamic>? storage;
  // String get fulName =>
  //     "${fName == null ? '' : fName!.trim()} ${lName == null ? '' : lName!.trim()}";

  Map<String, dynamic> toMap() => {
        'id': id,
        'f_name': fName,
        'l_name': lName,
        'phone': phone,
        'email': email,
        'image': image,
        'approved': approved ? "1" : "0",
        'government': government,
        'legal_name': legalName,
        'is_phone_verified': isPhoneVerified,
        'email_verified_at': emailVerifiedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'cm_firebase_token': cmFirebaseToken,
        'status': status,
        'order_count': orderCount,
        'login_medium': loginMedium,
        'social_id': socialId,
        'zone_id': zoneId,
        'wallet_balance': walletBalance,
        'loyalty_point': loyaltyPoint,
        'ref_code': refCode,
        'current_language_key': currentLanguageKey,
        'ref_by': refBy,
        'temp_token': tempToken,
        'module_ids': moduleIds,
        'image_full_url': imageFullUrl,
        'storage': storage,
      };

  /// `dart:convert`
  ///
  /// Converts [CustomerModel] to a JSON string.
  String toJson() => json.encode(toMap());

  CustomerModel copyWith({
    int? id,
    String? fName,
    String? lName,
    String? phone,
    String? email,
    String? image,
    int? isPhoneVerified,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? cmFirebaseToken,
    int? status,
    int? orderCount,
    dynamic loginMedium,
    dynamic socialId,
    int? zoneId,
    int? walletBalance,
    int? loyaltyPoint,
    String? refCode,
    String? currentLanguageKey,
    dynamic refBy,
    dynamic tempToken,
    String? moduleIds,
    dynamic imageFullUrl,
    List<dynamic>? storage,
    bool? approved,
    String? government,
    String? legalName,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      image: image ?? this.image,
      isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      cmFirebaseToken: cmFirebaseToken ?? this.cmFirebaseToken,
      status: status ?? this.status,
      orderCount: orderCount ?? this.orderCount,
      loginMedium: loginMedium ?? this.loginMedium,
      socialId: socialId ?? this.socialId,
      zoneId: zoneId ?? this.zoneId,
      walletBalance: walletBalance ?? this.walletBalance,
      loyaltyPoint: loyaltyPoint ?? this.loyaltyPoint,
      refCode: refCode ?? this.refCode,
      currentLanguageKey: currentLanguageKey ?? this.currentLanguageKey,
      refBy: refBy ?? this.refBy,
      tempToken: tempToken ?? this.tempToken,
      moduleIds: moduleIds ?? this.moduleIds,
      imageFullUrl: imageFullUrl ?? this.imageFullUrl,
      storage: storage ?? this.storage,
      approved: approved ?? this.approved,
      government: government ?? this.government,
      legalName: legalName ?? this.legalName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      fName,
      lName,
      phone,
      email,
      image,
      isPhoneVerified,
      emailVerifiedAt,
      createdAt,
      updatedAt,
      cmFirebaseToken,
      status,
      orderCount,
      loginMedium,
      socialId,
      zoneId,
      walletBalance,
      loyaltyPoint,
      refCode,
      currentLanguageKey,
      refBy,
      tempToken,
      moduleIds,
      imageFullUrl,
      storage,
    ];
  }
}
