import 'package:equatable/equatable.dart';

class OrderCardEntity extends Equatable {
  const OrderCardEntity({
    required this.orderNo,
    required this.totalAmount,
    this.orderOwnerName,
    required this.createdAt,
  });

  factory OrderCardEntity.example() {
    return OrderCardEntity(
      orderNo: 1234567890,
      orderOwnerName: 'John Doe',
      createdAt: DateTime.now(),
      totalAmount: 111.666,
    );
  }

  final int orderNo;
  final double totalAmount;
  final String? orderOwnerName;
  final DateTime createdAt;
  @override
  List<Object?> get props => [orderNo, orderOwnerName, createdAt, totalAmount];
}
