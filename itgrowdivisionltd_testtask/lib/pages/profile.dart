import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


  late DataProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<DataProvider>(context, listen: false);
    provider.getAccountInformation(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Profile'),),
      body: Consumer<DataProvider>(
        builder: (context, provider, widget) {
          if (!provider.loading) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: [
                Text('Name: ' + provider.accountInfo.name.toString()),
                Text('Phone: ' + provider.lastFourNumbersPhone),
                Text('Address: ' + provider.accountInfo.address.toString()),
                Text('City: ' + provider.accountInfo.city.toString()),
                Text('Country: ' + provider.accountInfo.country.toString()),
                Text('ZipCode: ' + provider.accountInfo.zipCode.toString()),
                Text('Balance: ' + provider.accountInfo.balance.toString()),
                Text('Currency: ' + provider.accountInfo.currency.toString()),
                Text('Current Trades Count: ' + provider.accountInfo.currentTradesCount.toString()),
                Text('Current Trades Volume: ' + provider.accountInfo.currentTradesVolume.toString()),
                Text('Equity: ' + provider.accountInfo.equity.toString()),
                Text('Free Margin: ' + provider.accountInfo.freeMargin.toString()),
                Text('Any Open Trades: ' + provider.accountInfo.isAnyOpenTrades.toString()),
                Text('Ais Swap Free: ' + provider.accountInfo.isSwapFree.toString()),
                Text('Leverage: ' + provider.accountInfo.leverage.toString()),
                Text('Total Trades Count: ' + provider.accountInfo.totalTradesCount.toString()),
                Text('Total Trades Volume: ' + provider.accountInfo.totalTradesVolume.toString()),
                Text('Type: ' + provider.accountInfo.type.toString()),
                Text('Verification Level: ' + provider.accountInfo.verificationLevel.toString()),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    ),
    );
  }

}
