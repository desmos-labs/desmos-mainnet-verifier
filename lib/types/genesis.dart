import 'package:json_annotation/json_annotation.dart';
import 'bank.dart';

part 'genesis.g.dart';

@JsonSerializable()
class Genesis {
  @JsonKey(name: 'app_state')
  final AppState appState;

  Genesis({required this.appState});

  factory Genesis.fromJson(Map<String, dynamic> json) {
    return _$GenesisFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GenesisToJson(this);
  }

  /// Returns the balance associated with this [address], or `null` if not found.
  Balance? getBalance(String address) {
    try {
      return appState.bank.balances.firstWhere((bal) => bal.address == address);
    } catch (e) {
      return null;
    }
  }
}

@JsonSerializable()
class AppState {
  @JsonKey(name: 'bank')
  final BankState bank;

  AppState({required this.bank});

  factory AppState.fromJson(Map<String, dynamic> json) {
    return _$AppStateFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AppStateToJson(this);
  }
}
