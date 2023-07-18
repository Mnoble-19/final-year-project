

import 'package:url_launcher/url_launcher.dart';

Future<void> collectPayment() async {

  final Uri url = Uri.parse('https://silicon-pay.com/payModal/S648964387c9540.03959857');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }}