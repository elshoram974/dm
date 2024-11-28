import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomerCardEntity extends Equatable {
  const CustomerCardEntity({
    required this.customerId,
    required this.pharmacyName,
    required this.city,
    required this.color,
    this.image,
    // required this.lastOrderDate,
    this.isVerified = false,
    required this.name,
  });

  factory CustomerCardEntity.example() {
    return const CustomerCardEntity(
      customerId: "985356",
      name: "name of customer",
      pharmacyName: "name of pharmacy",
      city: "place of customer",
      color: Colors.black,
      // lastOrderDate: DateTime.now(),
    );
  }
  final String customerId;
  final String name;
  final String? pharmacyName;
  final String? city;
  final String? image;
  // final DateTime? lastOrderDate;
  final Color color;
  final bool isVerified;

  @override
  List<Object?> get props => [
        customerId,
        pharmacyName,
        city,
        image,
        // lastOrderDate,
        isVerified,
      ];
}
