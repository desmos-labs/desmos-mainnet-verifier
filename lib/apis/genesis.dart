import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:desmos_rewards_verifier/types/export.dart';
import 'package:intl/intl.dart';

const PENULTIMATE_GENESIS_URL =
    'https://raw.githubusercontent.com/desmos-labs/mainnet/main/penultimate_genesis.json';
const GENESIS_URL =
    'https://raw.githubusercontent.com/desmos-labs/mainnet/main/genesis.json';

/// Represents the set of APIs used to interact with the genesis state.
class GenesisAPIs {
  GenesisAPIs._();

  factory GenesisAPIs.create() {
    return GenesisAPIs._();
  }

  Future<String> getBalance(String address) async {
    // Try from penultimate genesis
    var response = await http.get(Uri.parse(PENULTIMATE_GENESIS_URL));
    if (response.statusCode != 200) {
      // If it fails, try getting the real genesis
      response = await http.get(Uri.parse(GENESIS_URL));
    }

    if (response.statusCode != 200) {
      return response.body;
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final genesis = Genesis.fromJson(json);
    final balance = genesis.getBalance(address);
    if (balance == null) {
      return '0 DSM';
    }

    final amount = balance.getDSM().amountToInt() / 1000000;
    final formatter = NumberFormat('#,##0.######', 'en_US');
    return '${formatter.format(amount)} DSM';
  }
}
