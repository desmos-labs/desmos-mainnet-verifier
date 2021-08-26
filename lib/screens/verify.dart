import 'package:flutter/material.dart';

import 'package:desmos_rewards_verifier/apis/export.dart';
import 'package:desmos_rewards_verifier/utils/export.dart';

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
        title: Row(
          children: [
            getLogoSpacer(context),
            Image.asset('assets/images/logo.png', height: 35),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: getPadding(context),
          children: [
            SizedBox(
              width: 700,
              child: Text(
                'Desmos mainnet wallet verifier'.toUpperCase(),
                style: Theme.of(context).textTheme.headline1,
              ),
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
            Dimensions.isMobile(context)
                ? Column(
                    children: [
                      getInputText(context),
                      getButton(context),
                    ],
                  )
                : SizedBox(
                    height: 44,
                    child: Row(
                      children: [
                        getInputText(context),
                        getButton(context),
                      ],
                    ),
                  ),
            SizedBox(height: 24),
            Text('Your balance at genesis will be'),
            SizedBox(height: 10),
            Text(
              _amount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }

  Widget getLogoSpacer(BuildContext context) {
    return SizedBox(
      width: Dimensions.isMobile(context) ? 72 : 150,
    );
  }

  EdgeInsets getPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: Dimensions.isMobile(context) ? 84 : 168,
      vertical: Dimensions.isMobile(context) ? 84 : 168,
    );
  }

  Widget getInputText(BuildContext context) {
    final borderRadius = Dimensions.isMobile(context)
        ? BorderRadius.circular(4)
        : BorderRadius.only(
            topLeft: Radius.circular(4),
            bottomLeft: Radius.circular(4),
          );

    final input = TextField(
      controller: _controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'Desmos address',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: borderRadius,
        ),
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color(0xFF8B8B8B),
        ),
      ),
    );

    return Dimensions.isMobile(context)
        ? Row(children: [Expanded(child: input)])
        : SizedBox(width: 464, child: input);
  }

  Widget getButton(BuildContext context) {
    final borderRadius = Dimensions.isMobile(context)
        ? BorderRadius.circular(4)
        : BorderRadius.only(
            topRight: Radius.circular(4),
            bottomRight: Radius.circular(4),
          );

    final button = OutlinedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Color(0xFFEE6D54),
        ),
      ),
      onPressed: _getAmount,
      child: Text(
        'Calculate',
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
      ),
    );

    return Dimensions.isMobile(context)
        ? Row(children: [Expanded(child: button)])
        : SizedBox(width: 137, height: 44, child: button);
  }

  /// Gets the amount of tokens to be allocated for the input address,
  /// and updates the state to show such amount.
  void _getAmount() async {
    final value = _controller.text;
    if (value.length != 45) {
      return;
    }

    final amount = await widget.genesisApis.getBalance(value);
    setState(() {
      _amount = amount;
    });
  }
}
