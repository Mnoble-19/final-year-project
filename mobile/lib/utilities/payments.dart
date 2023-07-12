import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

Future<void> collectPayment() async {

  final Uri url = Uri.parse('https://silicon-pay.com/payModal/S648964387c9540.03959857');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }


  // String apiKey = '4kzD9WMh283536e722f89ce0d4eeeb81db86cd39';
  // String url = 'https://silicon-pay.com/process_payments';
  //
  // Map<String, dynamic> dataReq = {
  //   "req": "mobile_money",
  //   "currency": "UGX",
  //   "phone": "+256781564218",
  //   "encryption_key": apiKey,
  //   "amount": "10000",
  //   "emailAddress": "wanderaemmabryan@gmail.com",
  //   'call_back': " https://290d-105-21-80-26.in.ngrok.io",
  //   "txRef": "ETOLLSXX1"
  // };
  //
  // final response = await http.post(
  //   Uri.parse(url),
  //   headers: {
  //     'Content-Type': 'application/json',
  //   },
  //   body: json.encode(dataReq),
  // );
  //
  // if (response.statusCode == 200) {
  //   // Payment request successful, handle the response here
  //   print(response.body);
  // } else {
  //   // Payment request failed, handle the error here
  //   print('Payment request failed: ${response.statusCode}');
  // }
}
