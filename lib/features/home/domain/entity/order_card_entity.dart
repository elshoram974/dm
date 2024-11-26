import 'package:equatable/equatable.dart';

class OrderCardEntity extends Equatable {
  const OrderCardEntity({
    required this.orderId,
    required this.orderNo,
    required this.totalAmount,
    required this.createdAt,
  });

  factory OrderCardEntity.example() {
    return OrderCardEntity(
      orderId: 5,
      orderNo: 1234567890,
      createdAt: DateTime.now(),
      totalAmount: 111.666,
    );
  }

  final int orderId;
  final int orderNo;
  final double totalAmount;
  final DateTime createdAt;
  @override
  List<Object?> get props => [
        orderId,
        orderNo,
        createdAt,
        totalAmount,
      ];
}
