import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  //Sign out
  Future signOut() async {
    try {
      await _auth.signOut();
      return 'Success';
    } catch (e) {
      return e.toString();
    }
  }

  //Delete user from the firebase
  Future deleteUser() async {
    try {
      String? userid = _auth.currentUser?.uid;
      await _auth.currentUser!.delete().then((value) async =>
          await _fireStore.collection('userData').doc(userid).delete());

      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
      return null;
    }
  }

  //User state check
  Future authStateCheck() async {
    _auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        return null;
      } else {
        print('User is signed in!');
      }
    });
  }

  //Password reset
  Future changePassword(password) async {
    try {
      final user = _auth.currentUser;

      await user?.updatePassword(password);

      print("Successfully changed password");
      return 'Success';
    } catch (e) {
      print(e);
      return 'Failed';
    }
  }

  //Return user id from firebaseAuth
  Future getCurrentUserId() async {
    final user = await _auth.currentUser;
    if (user != null) {
      return user.uid;
    } else {
      return 'No User';
    }
  }

  //Update firestore data
  Future updateUser(firstNameUpdated, lastNameUpdated, emailUpdated,
      dropdownval, image) async {
    //Update user profile picture
    try {
      if (image != null) {
        await _auth.currentUser?.updatePhotoURL(image);
      }

      //Update User Email
      await _auth.currentUser?.updateEmail(emailUpdated);
      //Update display Name
      await _auth.currentUser
          ?.updateDisplayName(firstNameUpdated + " " + lastNameUpdated);
      //Update user data in firestore
      await _fireStore
          .collection('userData')
          .doc(_auth.currentUser?.uid)
          .update({
        'firstName': firstNameUpdated,
        'lastName': lastNameUpdated,
        'email': emailUpdated,
        'gender': dropdownval
      });
      return 'Success';
    } catch (e) {
      return e.toString();
    }
  }
}
