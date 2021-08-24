import 'package:json_annotation/json_annotation.dart';

import 'sdk.dart';

part 'bank.g.dart';

@JsonSerializable()
class BankState {
  @JsonKey(name: 'balances')
  final List<Balance> balances;

  BankState({required this.balances});

  factory BankState.fromJson(Map<String, dynamic> json) {
    return _$BankStateFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BankStateToJson(this);
  }
}

@JsonSerializable()
class Balance {
  @JsonKey(name: 'address')
  final String address;

  @JsonKey(name: 'coins')
  final List<Coin> coins;

  Balance({required this.address, required this.coins});

  factory Balance.fromJson(Map<String, dynamic> json) {
    return _$BalanceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$BalanceToJson(this);
  }

  Coin getDSM() {
    final denom = 'udsm';
    return coins
        .where((coin) => coin.denom == denom)
        .map((e) => e.amountToInt())
        .fold(
          Coin(denom: denom, amount: '0'),
          (prev, amount) => Coin(
            denom: prev.denom,
            amount: (prev.amountToInt() + amount).toString(),
          ),
        );
  }
}
