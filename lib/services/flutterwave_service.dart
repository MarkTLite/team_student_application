import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:universal_html/html.dart' as html;

class FlutterwaveService {
  static String encryptionKey = dotenv.env['encryptionKey'] ?? "";
  static String publicKey = dotenv.env['publicKey'] ?? "";
  static String secretKey = dotenv.env['secretKey'] ?? "";
  static String currency = FlutterwaveCurrency.UGX;

  //Add a method to make the flutter wave payment
  //This Method includes all the values needed to create the Flutterwave Instance
  static Future makeFlutterwavePayment(BuildContext context, String fullname,
      String phone, String email, String amount) async {
    try {
      final tx_Ref = DateTime.now().toIso8601String();
      var url = Uri.https('api.flutterwave.com', 'v3/payments');
      final response = await http.post(
        url,
        headers: {
          "Authorization": "Bearer $secretKey",
          // "Access-Control-Allow-Origin": "*",
          // 'Content-Type': 'application/x-www-form-urlencoded',
          // 'Accept': '*/*'
        },
        body: {
          "tx_ref": tx_Ref,
          "amount": amount,
          "currency": "UGX",
          "redirect_url": "",
          "customer":
              '{"email": email, "phonenumber": phone, "name": fullname}',
          "customizations":
              '{"title": "TEAM University Application Fee Payment"}',
          "payment_options": "card, ussd, mobilemoneyuganda"
        },
      ).then((value) => value);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      final checkoutUrl = decodedResponse['data']['link'];
      html.window.open(checkoutUrl, '_blank');
      await Future.delayed(Duration(seconds: 10));
      return true;
    } catch (error) {
      print(error);
    }

    // Stream verifyPay()
    //   final transactionsResponse = await http.get(Uri.parse('https://api.flutterwave.com/v3/transactions?tx_ref=$tx_Ref'));
    //   var decodedResponse = jsonDecode(utf8.decode(transactionsResponse.bodyBytes)) as Map;
    //   if (response == null) {
    //     print("Transaction Failed");
    //   } else {
    //     if (response.status == "Transaction successful") {
    //       print('RESPONSE:${response.data}');
    //       print('RESPONSE:${response.message}');
    //       return true;
    //     } else {
    //       print('RESPONSE:${response.message}');
    //       return true;
    //     }
    //   }
    // } catch (error) {
    //   print(error);
    // }
  }
}
