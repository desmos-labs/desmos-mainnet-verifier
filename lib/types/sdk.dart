import 'package:json_annotation/json_annotation.dart';

part 'sdk.g.dart';

@JsonSerializable()
class Coin {
  @JsonKey(name: 'amount')
  final String amount;

  @JsonKey(name: 'denom')
  final String denom;

  Coin({required this.amount, required this.denom});

  factory Coin.fromJson(Map<String, dynamic> json) {
    return _$CoinFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CoinToJson(this);
  }

  int amountToInt() {
    return int.parse(amount);
  }
}
