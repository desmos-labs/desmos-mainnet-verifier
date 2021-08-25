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
            children: [
              Text(
                'Welcome to the Desmos mainnet wallet verifier',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(height: 16),
              Text(
                'Here you will be able to verify the allocation made to '
                'your wallet inside the genesis state of the upcoming '
                'Desmos mainnet.',
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(height: 60),
              Text('Please insert here your address:'),
              SizedBox(height: 4),
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
              SizedBox(height: 24),
              Text('Your balance at genesis will be'),
              SizedBox(height: 10),
              Text(
                _amount,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
