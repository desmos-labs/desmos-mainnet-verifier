// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankState _$BankStateFromJson(Map<String, dynamic> json) {
  return BankState(
    balances: (json['balances'] as List<dynamic>)
        .map((e) => Balance.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BankStateToJson(BankState instance) => <String, dynamic>{
      'balances': instance.balances,
    };

Balance _$BalanceFromJson(Map<String, dynamic> json) {
  return Balance(
    address: json['address'] as String,
    coins: (json['coins'] as List<dynamic>)
        .map((e) => Coin.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BalanceToJson(Balance instance) => <String, dynamic>{
      'address': instance.address,
      'coins': instance.coins,
    };
