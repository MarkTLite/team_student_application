import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthStateProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  AuthStateProvider() {
    _initAuthState();
  }

  void _initAuthState() async {
    // session/tab auth state persistence for web
    print("setting session persistence");
    await _auth.setPersistence(Persistence.SESSION);
  }

  //listen to auth changes
  Stream<User?> get onAuthStateChanged {
    return _auth.authStateChanges();
  }

  //Stream for user details
  Stream getAuthUserDetails(User user) {
    return FirebaseFirestore.instance
        .collection('students')
        .doc(user.uid)
        .snapshots();
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getAuthUserDoc(
      User? user) async {
    return await FirebaseFirestore.instance
        .collection('students')
        .doc(user!.uid)
        .get()
        .then((value) => value);
  }

  Future signUp({name, email, password, imageURL, phoneNumber}) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((userCredential) async {
        //update user profile
        await Future.delayed(const Duration(seconds: 5));
        await FirebaseFirestore.instance
            .collection('students')
            .doc(userCredential.user?.uid)
            .set({
          'displayName': name,
          'phoneNumber': phoneNumber,
          'email': email,
          'role': 'student',
          'photoURL': imageURL,
          'uid': userCredential.user?.uid,
          'id': userCredential.user?.uid,
          'seenAMR': false
        });
      });
      print("Currently Signed in: ${_auth.currentUser?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print("EXCEPTION $e");
    }
  }

  Future signInWithEmailAndPassword(email, password) async {
    try {
      final userCredential = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      return ([true, "success"]);
    } on FirebaseAuthException catch (e) {
      print(e);
      return ([false, e.message]);
    } catch (e) {
      print(e);
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // userStatus(String status) async {
  //   await firebaseFirestore
  //       .collection('users')
  //       .doc(auth.currentUser?.uid)
  //       .update({'status': status}).then(
  //           (value) => print("DocumentSnapshot successfully updated!"),
  //           onError: (e) => print("Error updating document $e"));
  // }
}
