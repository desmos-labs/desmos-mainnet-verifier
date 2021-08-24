// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genesis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genesis _$GenesisFromJson(Map<String, dynamic> json) {
  return Genesis(
    appState: AppState.fromJson(json['app_state'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GenesisToJson(Genesis instance) => <String, dynamic>{
      'app_state': instance.appState,
    };

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
    bank: BankState.fromJson(json['bank'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'bank': instance.bank,
    };
