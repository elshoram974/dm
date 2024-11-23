import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final int? userId;
  final String name;
  final String email;
  final String? image;
  final String? employeeId;
  final String? startDate;
  final String? endDate;

  const UserModel({
    this.id,
    this.userId,
    required this.name,
    required this.email,
    this.image,
    this.employeeId,
    this.startDate,
    this.endDate,
  });

  factory UserModel.fromMap(Map json) => UserModel(
        id: json['id'] as int?,
        userId: json['user_id'] as int?,
        name: json['name'] as String,
        email: json['email'] as String,
        image: json['image'] as String?,
        employeeId: json['employee_id'] as String?,
        startDate: json['start_date'] as String?,
        endDate: json['end_date'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'name': name,
        'email': email,
        'image': image,
        'employee_id': employeeId,
        'start_date': startDate,
        'end_date': endDate,
      };

  UserModel copyWith({
    int? id,
    int? userId,
    String? name,
    String? email,
    String? image,
    String? employeeId,
    String? startDate,
    String? endDate,
  }) {
    return UserModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      employeeId: employeeId ?? this.employeeId,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      name,
      email,
      image,
      employeeId,
      startDate,
      endDate,
    ];
  }
}
