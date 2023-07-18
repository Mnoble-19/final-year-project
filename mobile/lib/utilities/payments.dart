import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> collectPayment(double credits) async {
  try {
    FirebaseAuth _auth = FirebaseAuth.instance;

    
    double newCredits = await addCredits(credits);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .update({
      'credits': newCredits,
    });


    await FirebaseFirestore.instance
        .collection('transactions')
        .doc(generateTransactionId())
        .set({
      'amount': credits,
      'balance': newCredits,
      'date': DateTime.now(),
      'type': "credit",
      'user': _auth.currentUser!.uid,
    });

    final Uri url =
        Uri.parse('https://silicon-pay.com/payModal/S648964387c9540.03959857');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }

    return true;
  } catch (err) {
    print("Error adding credits: $err");
    return false;
  }
}

Future<double> addCredits(double credits) async {
  try {
    print("cred:$credits");
    FirebaseAuth _auth = FirebaseAuth.instance;
    double currentCredits = 0;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .get();
    if (documentSnapshot.exists) {
      currentCredits = documentSnapshot.get('credits');
    }
    print("currentCredits + credits: ${currentCredits + credits}");
    return currentCredits + credits;
  } catch (err) {
    print("Error adding credits: $err");
    return 0;
  }
}

String generateTransactionId() {
  int currentTime = DateTime.now().millisecondsSinceEpoch;
  int randomNumber = int.parse(currentTime.toString().substring(8));
  return 'TXN${currentTime}_$randomNumber';
}
