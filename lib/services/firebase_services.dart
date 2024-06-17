import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserDetails(
      String userId, String username, String userImageUrl) async {
    // Save the user details to Firestore
    await _firestore.collection('users').doc(userId).set({
      'id': userId,
      'firstName': username,
      'imageUrl': userImageUrl,
    });

    // Save the user ID to shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<bool> userExists(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();
    return userDoc.exists;
  }

  Future<void> createNewUser(
      String userId, String username, String userImageUrl) async {
    await saveUserDetails(userId, username, userImageUrl);

    await _firestore.collection('rocks').doc(userId).set({
      'balance': 400,
      'level': 1,
      'referral': 0,
      'claimed_bonus': true,
    });
  }

  Future<void> updateUserCoins(String userId, int coins) async {
    final userDoc = _firestore.collection('rocks').doc(userId);
    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(userDoc);
      if (snapshot.exists) {
        final currentCoins = snapshot.data()?['balance'] ?? 0;
        transaction.update(userDoc, {'balance': currentCoins + coins});
      }
    });
  }

  Future<void> updateUserLevel(String userId, int level) async {
    final userDoc = _firestore.collection('rocks').doc(userId);
    await userDoc.update({'level': level});
  }

  Future<void> updateUserReferrals(String userId, int referrals) async {
    final userDoc = _firestore.collection('rocks').doc(userId);
    await userDoc.update({'referral': referrals});
  }
}
