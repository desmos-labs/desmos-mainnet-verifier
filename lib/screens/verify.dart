import 'package:flutter/material.dart';

import 'package:desmos_rewards_verifier/apis/export.dart';

/// Represents the screen allowing to verify the allocated amount of a wallet.
class VerifyWalletScreen extends StatefulWidget {
  final genesisApis = GenesisAPIs.create();

  VerifyWalletScreen({Key? key}) : super(key: key);

  @override
  _VerifyWalletScreenState createState() => _VerifyWalletScreenState();
}

class _VerifyWalletScreenState extends State<VerifyWalletScreen> {
  late TextEditingController _controller;
  String _amount = '0 DSM';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png', height: 35),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        )),
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Desmos mainnet wallet verifier',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 25),
              Text(
                'Here you will be able to verify the allocation made to '
                'your wallet inside the genesis state of the upcoming '
                'Desmos mainnet.',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              Text('Please insert here your address:'),
              SizedBox(height: 25),
              TextField(
                textAlign: TextAlign.center,
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Address',
                ),
                onChanged: (String value) async {
                  if (value.length != 45) {
                    return;
                  }

                  final amount = await widget.genesisApis.getBalance(value);
                  setState(() {
                    _amount = amount;
                  });
                },
              ),
              SizedBox(height: 50),
              Text('Your balance at genesis will be: '),
              SizedBox(height: 25),
              Text(_amount, style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}
