// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      imageUrl: json['imageUrl'] as String,
      price: (json['price'] as num).toDouble(),
      shopUrl: json['shopUrl'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'price': instance.price,
      'shopUrl': instance.shopUrl,
      'title': instance.title,
    };