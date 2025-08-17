import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../model/profile_model.dart';
import '../../res/app_string.dart';
import 'base_authentication_service.dart';

class DataAuthenticationService extends BaseAuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  /// Signs in a user using email and password.
  ///
  /// Throws [FirebaseAuthException] if sign-in fails.
  @override
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    return await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Sign in user with Google account
  @override
  Future<UserCredential?> signWithGoogle() async {

    /*
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    return _firebaseAuth.signInWithCredential(credential);
    */

  }

  /// Checks if the current user's profile exists in Firestore.
  ///
  /// Returns `true` if the user document exists, otherwise `false`.
  /// Returns `false` immediately if no user is signed in
  @override
  Future<bool> doesUserProfileExist() async {
    final userId = _firebaseAuth.currentUser?.uid;
    if (userId == null) return false;

    final userDoc = await _firebaseFirestore
        .collection(AppString.firebaseUserCollection)
        .doc(userId)
        .get();

    return userDoc.exists;
  }

  /// Create a new user document in Firestore using Gmail account
  @override
  Future<void> createNewUserWithGoogle(
      {required User user, required ProfileModel profileModel}) async {
    _firebaseFirestore
        .collection(AppString.firebaseUserCollection)
        .doc(user.uid)
        .set(profileModel.toMap());
  }

  /// Upload user image to Firebase Storage and return its download URL
  @override
  Future<String> uploadUserImgeUrl(
      {required File file, bool isProfile = false}) async {
    String fileName = "ju_grocery_${DateTime.now().millisecondsSinceEpoch}";
    final storagePath = isProfile
        ? "${AppString.firebaseUserCollection}/${_firebaseAuth.currentUser!.uid}/profile/$fileName"
        : "${AppString.firebaseUserCollection}/profile/$fileName";

    final ref = _firebaseStorage.ref().child(storagePath);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    return snapshot.ref.getDownloadURL();
  }

  /// Create a new user with email and password
  @override
  Future<UserCredential> createUserWithEmilandPasword(
          {required String email, required String password}) async =>
      _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  /// Upload or update user profile data in Firestore
  @override
  Future<void> uploadUserProfile(
      {required ProfileModel profileModel,
      required String firebaseDocument}) async {
    await _firebaseFirestore
        .collection(AppString.firebaseUserCollection)
        .doc(firebaseDocument)
        .set(profileModel.toMap());
  }

  /// Send a password reset email to the user
  @override
  Future<void> forgetPasswordSnapshot({required String email}) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> signOutApp() async {
    _firebaseAuth.signOut();
  }
}
