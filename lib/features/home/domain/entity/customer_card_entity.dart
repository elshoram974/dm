import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CustomerCardEntity extends Equatable {
  final String customerId;
  final String name;
  final String place;
  final String address;
  final String? image;
  final DateTime? lastOrderDate;
  final Color color;
  final bool isVerified;
  final bool isFavorite;

  const CustomerCardEntity({
    required this.customerId,
    required this.name,
    required this.place,
    required this.address,
    required this.color,
    this.image,
    required this.lastOrderDate,
    this.isVerified = false,
    this.isFavorite = false,
  });
  
  @override
  List<Object?> get props => [customerId, name, place, address, image, lastOrderDate, isVerified, isFavorite];
}
