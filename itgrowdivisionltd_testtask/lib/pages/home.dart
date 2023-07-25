import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:itgrowdivisionltd_testtask/pages/profile.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  late DataProvider provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<DataProvider>(context, listen: false);
    provider.getOpenTrades(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Home'),),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: Icon(
                Icons.supervised_user_circle_sharp,
              ),
              title: const Text('Profile'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_sharp,
              ),
              title: const Text('Logout'),
              onTap: () {
                provider.logoutUser(context);
              },
            ),
          ],
        ),
      ),
      body: Consumer<DataProvider>(
        builder: (context, provider, widget) {
          if (!provider.loading) {
            return ListView(
              padding: const EdgeInsets.all(8),
              children: provider.openTradeList.map((item) =>
                  ListTile(
                    leading: CachedNetworkImage(
                      height: 50,
                      width: 50,
                      imageUrl: getImageUrl(item.symbol.toString()),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    title: Text(
                        'Current Price: ' + item.currentPrice.toString()),
                    subtitle: Text('Profit: ' + item.profit.toString()),
                    trailing: Text(item.openTime.toString()),)
              ).toList(),);
          } else {
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    ),
    );
  }

  String getImageUrl(String type) {
    String url = '';
    if (type == '#Ethereum') {
      url =
      'https://blog.logomyway.com/wp-content/uploads/2021/11/Ethereum-logo.png';
    } else if (type == 'EURUSD') {
      url =
      'https://w7.pngwing.com/pngs/792/756/png-transparent-euro-sign-euro-sign-currency-symbol-icon-euro-sign-text-logo-number-thumbnail.png';
    } else if (type == 'USDJPY') {
      url =
      'https://w7.pngwing.com/pngs/649/386/png-transparent-yen-sign-japanese-yen-currency-symbol-euro-sign-symbol-miscellaneous-hand-cross.png';
    }
    return url;
  }
}
