import 'dart:convert';

import '../../../domain/entity/order_card_entity.dart';
import 'module.dart';
import 'storage.dart';

class OrdersModel extends OrderCardEntity {
  final int? id;
  final int? userId;
  final double? orderAmount;
  final int? couponDiscountAmount;
  final String? couponDiscountTitle;
  final String? paymentStatus;
  final String? orderStatus;
  final double? totalTaxAmount;
  final String? paymentMethod;
  final dynamic transactionReference;
  final dynamic deliveryAddressId;
  final dynamic deliveryManId;
  final dynamic couponCode;
  final dynamic orderNote;
  final String? orderType;
  final int? checked;
  final int? storeId;
  final DateTime? createdAtModel;
  final DateTime? updatedAt;
  final int? deliveryCharge;
  final String? scheduleAt;
  final dynamic callback;
  final String? otp;
  final String? pending;
  final dynamic accepted;
  final dynamic confirmed;
  final dynamic processing;
  final dynamic handover;
  final dynamic pickedUp;
  final dynamic delivered;
  final dynamic canceled;
  final dynamic refundRequested;
  final dynamic refunded;
  final String? deliveryAddress;
  final dynamic estimatedDeliveryDate;
  final int? scheduled;
  final int? storeDiscountAmount;
  final int? originalDeliveryCharge;
  final dynamic failed;
  final String? adjusment;
  final int? edited;
  final dynamic deliveryTime;
  final int? zoneId;
  final int? moduleId;
  final dynamic orderAttachment;
  final dynamic parcelCategoryId;
  final dynamic receiverDetails;
  final dynamic chargePayer;
  final double? distance;
  final int? dmTips;
  final dynamic freeDeliveryBy;
  final dynamic refundRequestCanceled;
  final bool? prescriptionOrder;
  final String? taxStatus;
  final dynamic dmVehicleId;
  final dynamic cancellationReason;
  final dynamic canceledBy;
  final dynamic couponCreatedBy;
  final String? discountOnProductBy;
  final dynamic processingTime;
  final dynamic unavailableItemNote;
  final bool? cutlery;
  final dynamic deliveryInstruction;
  final int? taxPercentage;
  final int? additionalCharge;
  final dynamic orderProof;
  final int? partiallyPaidAmount;
  final bool? isGuest;
  final int? flashAdminDiscountAmount;
  final int? flashStoreDiscountAmount;
  final dynamic cashBackId;
  final int? extraPackagingAmount;
  final int? refBonusAmount;
  final String? moduleType;
  final List<dynamic>? orderAttachmentFullUrl;
  final List<dynamic>? orderProofFullUrl;
  final List<Storage>? storage;
  final Module? module;

  OrdersModel({
    this.id,
    this.userId,
    this.orderAmount,
    this.couponDiscountAmount,
    this.couponDiscountTitle,
    this.paymentStatus,
    this.orderStatus,
    this.totalTaxAmount,
    this.paymentMethod,
    this.transactionReference,
    this.deliveryAddressId,
    this.deliveryManId,
    this.couponCode,
    this.orderNote,
    this.orderType,
    this.checked,
    this.storeId,
    this.createdAtModel,
    this.updatedAt,
    this.deliveryCharge,
    this.scheduleAt,
    this.callback,
    this.otp,
    this.pending,
    this.accepted,
    this.confirmed,
    this.processing,
    this.handover,
    this.pickedUp,
    this.delivered,
    this.canceled,
    this.refundRequested,
    this.refunded,
    this.deliveryAddress,
    this.estimatedDeliveryDate,
    this.scheduled,
    this.storeDiscountAmount,
    this.originalDeliveryCharge,
    this.failed,
    this.adjusment,
    this.edited,
    this.deliveryTime,
    this.zoneId,
    this.moduleId,
    this.orderAttachment,
    this.parcelCategoryId,
    this.receiverDetails,
    this.chargePayer,
    this.distance,
    this.dmTips,
    this.freeDeliveryBy,
    this.refundRequestCanceled,
    this.prescriptionOrder,
    this.taxStatus,
    this.dmVehicleId,
    this.cancellationReason,
    this.canceledBy,
    this.couponCreatedBy,
    this.discountOnProductBy,
    this.processingTime,
    this.unavailableItemNote,
    this.cutlery,
    this.deliveryInstruction,
    this.taxPercentage,
    this.additionalCharge,
    this.orderProof,
    this.partiallyPaidAmount,
    this.isGuest,
    this.flashAdminDiscountAmount,
    this.flashStoreDiscountAmount,
    this.cashBackId,
    this.extraPackagingAmount,
    this.refBonusAmount,
    this.moduleType,
    this.orderAttachmentFullUrl,
    this.orderProofFullUrl,
    this.storage,
    this.module,
  }) : super(
          orderNo: id ?? 0,
          totalAmount: orderAmount ?? 0.0,
          createdAt: createdAtModel ?? DateTime.now(),
          orderOwnerName: userId.toString(),
        );

  factory OrdersModel.fromMap(Map<String, dynamic> data) => OrdersModel(
        id: data['id'] as int?,
        userId: data['user_id'] as int?,
        orderAmount: (data['order_amount'] as num?)?.toDouble(),
        couponDiscountAmount: data['coupon_discount_amount'] as int?,
        couponDiscountTitle: data['coupon_discount_title'] as String?,
        paymentStatus: data['payment_status'] as String?,
        orderStatus: data['order_status'] as String?,
        totalTaxAmount: (data['total_tax_amount'] as num?)?.toDouble(),
        paymentMethod: data['payment_method'] as String?,
        transactionReference: data['transaction_reference'] as dynamic,
        deliveryAddressId: data['delivery_address_id'] as dynamic,
        deliveryManId: data['delivery_man_id'] as dynamic,
        couponCode: data['coupon_code'] as dynamic,
        orderNote: data['order_note'] as dynamic,
        orderType: data['order_type'] as String?,
        checked: data['checked'] as int?,
        storeId: data['store_id'] as int?,
        createdAtModel: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        deliveryCharge: data['delivery_charge'] as int?,
        scheduleAt: data['schedule_at'] as String?,
        callback: data['callback'] as dynamic,
        otp: data['otp'] as String?,
        pending: data['pending'] as String?,
        accepted: data['accepted'] as dynamic,
        confirmed: data['confirmed'] as dynamic,
        processing: data['processing'] as dynamic,
        handover: data['handover'] as dynamic,
        pickedUp: data['picked_up'] as dynamic,
        delivered: data['delivered'] as dynamic,
        canceled: data['canceled'] as dynamic,
        refundRequested: data['refund_requested'] as dynamic,
        refunded: data['refunded'] as dynamic,
        deliveryAddress: data['delivery_address'] as String?,
        estimatedDeliveryDate: data['estimated_delivery_date'] as dynamic,
        scheduled: data['scheduled'] as int?,
        storeDiscountAmount: data['store_discount_amount'] as int?,
        originalDeliveryCharge: data['original_delivery_charge'] as int?,
        failed: data['failed'] as dynamic,
        adjusment: data['adjusment'] as String?,
        edited: data['edited'] as int?,
        deliveryTime: data['delivery_time'] as dynamic,
        zoneId: data['zone_id'] as int?,
        moduleId: data['module_id'] as int?,
        orderAttachment: data['order_attachment'] as dynamic,
        parcelCategoryId: data['parcel_category_id'] as dynamic,
        receiverDetails: data['receiver_details'] as dynamic,
        chargePayer: data['charge_payer'] as dynamic,
        distance: (data['distance'] as num?)?.toDouble(),
        dmTips: data['dm_tips'] as int?,
        freeDeliveryBy: data['free_delivery_by'] as dynamic,
        refundRequestCanceled: data['refund_request_canceled'] as dynamic,
        prescriptionOrder: data['prescription_order'] as bool?,
        taxStatus: data['tax_status'] as String?,
        dmVehicleId: data['dm_vehicle_id'] as dynamic,
        cancellationReason: data['cancellation_reason'] as dynamic,
        canceledBy: data['canceled_by'] as dynamic,
        couponCreatedBy: data['coupon_created_by'] as dynamic,
        discountOnProductBy: data['discount_on_product_by'] as String?,
        processingTime: data['processing_time'] as dynamic,
        unavailableItemNote: data['unavailable_item_note'] as dynamic,
        cutlery: data['cutlery'] as bool?,
        deliveryInstruction: data['delivery_instruction'] as dynamic,
        taxPercentage: data['tax_percentage'] as int?,
        additionalCharge: data['additional_charge'] as int?,
        orderProof: data['order_proof'] as dynamic,
        partiallyPaidAmount: data['partially_paid_amount'] as int?,
        isGuest: data['is_guest'] as bool?,
        flashAdminDiscountAmount: data['flash_admin_discount_amount'] as int?,
        flashStoreDiscountAmount: data['flash_store_discount_amount'] as int?,
        cashBackId: data['cash_back_id'] as dynamic,
        extraPackagingAmount: data['extra_packaging_amount'] as int?,
        refBonusAmount: data['ref_bonus_amount'] as int?,
        moduleType: data['module_type'] as String?,
        orderAttachmentFullUrl:
            data['order_attachment_full_url'] as List<dynamic>?,
        orderProofFullUrl: data['order_proof_full_url'] as List<dynamic>?,
        storage: data['storage'] == null
            ? null
            : (data['storage'] as List)
                .map((e) => Storage.fromJson(e))
                .toList(),
        module: data['module'] == null
            ? null
            : Module.fromMap(data['module'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'user_id': userId,
        'order_amount': orderAmount,
        'coupon_discount_amount': couponDiscountAmount,
        'coupon_discount_title': couponDiscountTitle,
        'payment_status': paymentStatus,
        'order_status': orderStatus,
        'total_tax_amount': totalTaxAmount,
        'payment_method': paymentMethod,
        'transaction_reference': transactionReference,
        'delivery_address_id': deliveryAddressId,
        'delivery_man_id': deliveryManId,
        'coupon_code': couponCode,
        'order_note': orderNote,
        'order_type': orderType,
        'checked': checked,
        'store_id': storeId,
        'created_at': createdAt,
        'updated_at': updatedAt?.toIso8601String(),
        'delivery_charge': deliveryCharge,
        'schedule_at': scheduleAt,
        'callback': callback,
        'otp': otp,
        'pending': pending,
        'accepted': accepted,
        'confirmed': confirmed,
        'processing': processing,
        'handover': handover,
        'picked_up': pickedUp,
        'delivered': delivered,
        'canceled': canceled,
        'refund_requested': refundRequested,
        'refunded': refunded,
        'delivery_address': deliveryAddress,
        'estimated_delivery_date': estimatedDeliveryDate,
        'scheduled': scheduled,
        'store_discount_amount': storeDiscountAmount,
        'original_delivery_charge': originalDeliveryCharge,
        'failed': failed,
        'adjusment': adjusment,
        'edited': edited,
        'delivery_time': deliveryTime,
        'zone_id': zoneId,
        'module_id': moduleId,
        'order_attachment': orderAttachment,
        'parcel_category_id': parcelCategoryId,
        'receiver_details': receiverDetails,
        'charge_payer': chargePayer,
        'distance': distance,
        'dm_tips': dmTips,
        'free_delivery_by': freeDeliveryBy,
        'refund_request_canceled': refundRequestCanceled,
        'prescription_order': prescriptionOrder,
        'tax_status': taxStatus,
        'dm_vehicle_id': dmVehicleId,
        'cancellation_reason': cancellationReason,
        'canceled_by': canceledBy,
        'coupon_created_by': couponCreatedBy,
        'discount_on_product_by': discountOnProductBy,
        'processing_time': processingTime,
        'unavailable_item_note': unavailableItemNote,
        'cutlery': cutlery,
        'delivery_instruction': deliveryInstruction,
        'tax_percentage': taxPercentage,
        'additional_charge': additionalCharge,
        'order_proof': orderProof,
        'partially_paid_amount': partiallyPaidAmount,
        'is_guest': isGuest,
        'flash_admin_discount_amount': flashAdminDiscountAmount,
        'flash_store_discount_amount': flashStoreDiscountAmount,
        'cash_back_id': cashBackId,
        'extra_packaging_amount': extraPackagingAmount,
        'ref_bonus_amount': refBonusAmount,
        'module_type': moduleType,
        'order_attachment_full_url': orderAttachmentFullUrl,
        'order_proof_full_url': orderProofFullUrl,
        'storage': storage,
        'module': module?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrdersModel].
  factory OrdersModel.fromJson(String data) {
    return OrdersModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrdersModel] to a JSON string.
  String toJson() => json.encode(toMap());

  OrdersModel copyWith({
    int? id,
    int? userId,
    double? orderAmount,
    int? couponDiscountAmount,
    String? couponDiscountTitle,
    String? paymentStatus,
    String? orderStatus,
    double? totalTaxAmount,
    String? paymentMethod,
    dynamic transactionReference,
    dynamic deliveryAddressId,
    dynamic deliveryManId,
    dynamic couponCode,
    dynamic orderNote,
    String? orderType,
    int? checked,
    int? storeId,
    DateTime? createdAtModel,
    DateTime? updatedAt,
    int? deliveryCharge,
    String? scheduleAt,
    dynamic callback,
    String? otp,
    String? pending,
    dynamic accepted,
    dynamic confirmed,
    dynamic processing,
    dynamic handover,
    dynamic pickedUp,
    dynamic delivered,
    dynamic canceled,
    dynamic refundRequested,
    dynamic refunded,
    String? deliveryAddress,
    dynamic estimatedDeliveryDate,
    int? scheduled,
    int? storeDiscountAmount,
    int? originalDeliveryCharge,
    dynamic failed,
    String? adjusment,
    int? edited,
    dynamic deliveryTime,
    int? zoneId,
    int? moduleId,
    dynamic orderAttachment,
    dynamic parcelCategoryId,
    dynamic receiverDetails,
    dynamic chargePayer,
    double? distance,
    int? dmTips,
    dynamic freeDeliveryBy,
    dynamic refundRequestCanceled,
    bool? prescriptionOrder,
    String? taxStatus,
    dynamic dmVehicleId,
    dynamic cancellationReason,
    dynamic canceledBy,
    dynamic couponCreatedBy,
    String? discountOnProductBy,
    dynamic processingTime,
    dynamic unavailableItemNote,
    bool? cutlery,
    dynamic deliveryInstruction,
    int? taxPercentage,
    int? additionalCharge,
    dynamic orderProof,
    int? partiallyPaidAmount,
    bool? isGuest,
    int? flashAdminDiscountAmount,
    int? flashStoreDiscountAmount,
    dynamic cashBackId,
    int? extraPackagingAmount,
    int? refBonusAmount,
    String? moduleType,
    List<dynamic>? orderAttachmentFullUrl,
    List<dynamic>? orderProofFullUrl,
    List<Storage>? storage,
    Module? module,
  }) {
    return OrdersModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      orderAmount: orderAmount ?? this.orderAmount,
      couponDiscountAmount: couponDiscountAmount ?? this.couponDiscountAmount,
      couponDiscountTitle: couponDiscountTitle ?? this.couponDiscountTitle,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      totalTaxAmount: totalTaxAmount ?? this.totalTaxAmount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      transactionReference: transactionReference ?? this.transactionReference,
      deliveryAddressId: deliveryAddressId ?? this.deliveryAddressId,
      deliveryManId: deliveryManId ?? this.deliveryManId,
      couponCode: couponCode ?? this.couponCode,
      orderNote: orderNote ?? this.orderNote,
      orderType: orderType ?? this.orderType,
      checked: checked ?? this.checked,
      storeId: storeId ?? this.storeId,
      createdAtModel: createdAtModel ?? this.createdAtModel,
      updatedAt: updatedAt ?? this.updatedAt,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      scheduleAt: scheduleAt ?? this.scheduleAt,
      callback: callback ?? this.callback,
      otp: otp ?? this.otp,
      pending: pending ?? this.pending,
      accepted: accepted ?? this.accepted,
      confirmed: confirmed ?? this.confirmed,
      processing: processing ?? this.processing,
      handover: handover ?? this.handover,
      pickedUp: pickedUp ?? this.pickedUp,
      delivered: delivered ?? this.delivered,
      canceled: canceled ?? this.canceled,
      refundRequested: refundRequested ?? this.refundRequested,
      refunded: refunded ?? this.refunded,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      estimatedDeliveryDate:
          estimatedDeliveryDate ?? this.estimatedDeliveryDate,
      scheduled: scheduled ?? this.scheduled,
      storeDiscountAmount: storeDiscountAmount ?? this.storeDiscountAmount,
      originalDeliveryCharge:
          originalDeliveryCharge ?? this.originalDeliveryCharge,
      failed: failed ?? this.failed,
      adjusment: adjusment ?? this.adjusment,
      edited: edited ?? this.edited,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      zoneId: zoneId ?? this.zoneId,
      moduleId: moduleId ?? this.moduleId,
      orderAttachment: orderAttachment ?? this.orderAttachment,
      parcelCategoryId: parcelCategoryId ?? this.parcelCategoryId,
      receiverDetails: receiverDetails ?? this.receiverDetails,
      chargePayer: chargePayer ?? this.chargePayer,
      distance: distance ?? this.distance,
      dmTips: dmTips ?? this.dmTips,
      freeDeliveryBy: freeDeliveryBy ?? this.freeDeliveryBy,
      refundRequestCanceled:
          refundRequestCanceled ?? this.refundRequestCanceled,
      prescriptionOrder: prescriptionOrder ?? this.prescriptionOrder,
      taxStatus: taxStatus ?? this.taxStatus,
      dmVehicleId: dmVehicleId ?? this.dmVehicleId,
      cancellationReason: cancellationReason ?? this.cancellationReason,
      canceledBy: canceledBy ?? this.canceledBy,
      couponCreatedBy: couponCreatedBy ?? this.couponCreatedBy,
      discountOnProductBy: discountOnProductBy ?? this.discountOnProductBy,
      processingTime: processingTime ?? this.processingTime,
      unavailableItemNote: unavailableItemNote ?? this.unavailableItemNote,
      cutlery: cutlery ?? this.cutlery,
      deliveryInstruction: deliveryInstruction ?? this.deliveryInstruction,
      taxPercentage: taxPercentage ?? this.taxPercentage,
      additionalCharge: additionalCharge ?? this.additionalCharge,
      orderProof: orderProof ?? this.orderProof,
      partiallyPaidAmount: partiallyPaidAmount ?? this.partiallyPaidAmount,
      isGuest: isGuest ?? this.isGuest,
      flashAdminDiscountAmount:
          flashAdminDiscountAmount ?? this.flashAdminDiscountAmount,
      flashStoreDiscountAmount:
          flashStoreDiscountAmount ?? this.flashStoreDiscountAmount,
      cashBackId: cashBackId ?? this.cashBackId,
      extraPackagingAmount: extraPackagingAmount ?? this.extraPackagingAmount,
      refBonusAmount: refBonusAmount ?? this.refBonusAmount,
      moduleType: moduleType ?? this.moduleType,
      orderAttachmentFullUrl:
          orderAttachmentFullUrl ?? this.orderAttachmentFullUrl,
      orderProofFullUrl: orderProofFullUrl ?? this.orderProofFullUrl,
      storage: storage ?? this.storage,
      module: module ?? this.module,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      orderAmount,
      couponDiscountAmount,
      couponDiscountTitle,
      paymentStatus,
      orderStatus,
      totalTaxAmount,
      paymentMethod,
      transactionReference,
      deliveryAddressId,
      deliveryManId,
      couponCode,
      orderNote,
      orderType,
      checked,
      storeId,
      createdAtModel,
      updatedAt,
      deliveryCharge,
      scheduleAt,
      callback,
      otp,
      pending,
      accepted,
      confirmed,
      processing,
      handover,
      pickedUp,
      delivered,
      canceled,
      refundRequested,
      refunded,
      deliveryAddress,
      estimatedDeliveryDate,
      scheduled,
      storeDiscountAmount,
      originalDeliveryCharge,
      failed,
      adjusment,
      edited,
      deliveryTime,
      zoneId,
      moduleId,
      orderAttachment,
      parcelCategoryId,
      receiverDetails,
      chargePayer,
      distance,
      dmTips,
      freeDeliveryBy,
      refundRequestCanceled,
      prescriptionOrder,
      taxStatus,
      dmVehicleId,
      cancellationReason,
      canceledBy,
      couponCreatedBy,
      discountOnProductBy,
      processingTime,
      unavailableItemNote,
      cutlery,
      deliveryInstruction,
      taxPercentage,
      additionalCharge,
      orderProof,
      partiallyPaidAmount,
      isGuest,
      flashAdminDiscountAmount,
      flashStoreDiscountAmount,
      cashBackId,
      extraPackagingAmount,
      refBonusAmount,
      moduleType,
      orderAttachmentFullUrl,
      orderProofFullUrl,
      storage,
      module,
    ];
  }
}
