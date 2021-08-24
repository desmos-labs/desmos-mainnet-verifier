// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sdk.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return Coin(
    amount: json['amount'] as String,
    denom: json['denom'] as String,
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'amount': instance.amount,
      'denom': instance.denom,
    };
