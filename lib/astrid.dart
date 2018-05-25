library astrid;

import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fetch_widget/flutter_fetch_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;


// Widget to get the Balance from a given Public Key
// Please refer to (https://www.stellar.org/developers/horizon/reference/endpoints/accounts-single.html)
class Balance extends StatelessWidget {
  final String url;
  final String publicKey;

  Balance({
    @required this.url,
    @required this.publicKey
  });

  @override
  Widget build(BuildContext context) => new FetchWidget<AccountDetails>(
      url: url+publicKey,
      transform: _accountDetails,
      builder: (fetchPost) {
        return new Text('${fetchPost.data.balance}');
      },
    );
}

AccountDetails _accountDetails(response) {
  final Map<String, dynamic> json = convert.json.decode(response.body);
  final bal = json['balances'];
  for (var items in bal) {
    Map myMap = items;
    print(myMap['balance']);
    return new AccountDetails(myMap['balance']);
  }
}

class AccountDetails {
  final balance;
  AccountDetails(this.balance);
}

