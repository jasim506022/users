import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../model/profile_model.dart';
import '../../../res/app_string.dart';
import '../base_authentication_service.dart';

class FirebaseAuthenticationService extends BaseAuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseStorage = FirebaseStorage.instance;

  @override
  User? getCurrentUser() => _firebaseAuth.currentUser;

  /// Sign in user with email and password
  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  /// Sign in user with Google account
  Future<UserCredential?> signWithGoogle() async {
    final googleSignIn = GoogleSignIn.standard(); // Named constructor
    final googleUser = await googleSignIn.signIn();

    if (googleUser == null) return null; // User canceled the sign-in

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return _firebaseAuth.signInWithCredential(credential);
  }

  /// Check if the user exists in Firestore
  @override
  Future<bool> userExists() async {
    final userId = _firebaseAuth.currentUser?.uid;
    if (userId == null) return false;

    final userDoc = await _firebaseFirestore
        .collection(AppString.collectionUsers)
        .doc(userId)
        .get();

    return userDoc.exists;
  }

  /// Create a new user document in Firestore using Gmail account
  @override
  Future<void> createNewUserWithGoogle({
    required User user,
    required ProfileModel profileModel,
  }) async {
    _firebaseFirestore
        .collection(AppString.collectionUsers)
        .doc(user.uid)
        .set(profileModel.toMap());
  }

  /// Uploads a user image to Firebase Storage and returns its download URL.
  ///
  /// The image is stored under a path based on whether it's a profile image:
  /// - If [isProfile] is true: stored in `<sellerId>/profile/`
  /// - Otherwise: stored in a general profile folder.
  @override
  Future<String> uploadUserImageUrl({
    required File file,
    bool isProfile = false,
  }) async {
    final uid = _firebaseAuth.currentUser!.uid;
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final fileName = "ju_grocery_$timestamp";
    final storagePath = isProfile
        ? "${AppString.collectionUsers}/$uid/profile/$fileName"
        : "${AppString.collectionUsers}/profile/$fileName";

    final ref = _firebaseStorage.ref().child(storagePath);
    final uploadTask = ref.putFile(file);

    final snapshot = await uploadTask.whenComplete(() {});
    return snapshot.ref.getDownloadURL();
  }

  /// Create a new user with email and password
  @override
  Future<UserCredential> createUserWithEmilandPassword({
    required String email,
    required String password,
  }) async => _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  /// Upload or update user profile data in Firestore
  @override
  Future<void> uploadUserProfile({
    required ProfileModel profileModel,
    required String firebaseDocument,
  }) async {
    await _firebaseFirestore
        .collection(AppString.collectionUsers)
        .doc(firebaseDocument)
        .set(profileModel.toMap());
  }

  /// Send a password reset email to the user
  @override
  Future<void> forgetPasswordSnapshot({required String email}) async {
    _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  /// Signs the user out of the application
  @override
  Future<void> signOutApp() async {
    _firebaseAuth.signOut();
  }
}
