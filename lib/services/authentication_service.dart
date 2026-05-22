import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {
  /// Firebase Instance Create
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Google Sing In Instance
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  /// SingUp For User
  Future<UserCredential?> singUp(String email, String password) async {
    try {
      UserCredential? cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred;
    } on FirebaseException {
      rethrow;
    }
  }

  /// Login For User
  Future<User?> login(String email, String password) async {
    try {
      UserCredential? cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } on FirebaseException {
      rethrow;
    }
  }

  ///Continue With Google
  Future<UserCredential> continueWithGoogle() async {
    try {
      String webClientId =
          '435259897362-ue26409ab7nisiqpelr55eupi03bu2rf.apps.googleusercontent.com';
      await _googleSignIn.initialize(serverClientId: webClientId);

      GoogleSignInAccount account = await _googleSignIn.authenticate();

      GoogleSignInAuthentication gooleAuth = account.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: gooleAuth.idToken,
        accessToken: gooleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential;
    } on FirebaseException {
      rethrow;
    }
  }

  /// Reset Password For User
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseException {
      rethrow;
    }
  }

  // logout User
  Future<void> logout() async {
    // Firebase logout
    await _auth.signOut();

    // Google logout (IMPORTANT)
    await _googleSignIn.signOut();
  }

  // Current USER
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
