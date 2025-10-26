import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<UserCredential> registerUser(
    String name,
    String email,
    String password,
  ) async {
    var user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await user.user!.updateDisplayName(name);
    return user;
  }

  Future<UserCredential> signIn(String email, String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  bool isLoggedIn() {
    var user = FirebaseAuth.instance.currentUser;
    return user != null;
  }

  Future<void> forgotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static User? get user => FirebaseAuth.instance.currentUser;

  googleSignIn() async {
    final GoogleSignInAccount? user = await GoogleSignIn().signIn();
    if (user == null) return;
    final GoogleSignInAuthentication auth = await user.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: auth.accessToken,
      idToken: auth.idToken,
    );

    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );

    return userCredential.user;
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<void> signOutGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();
    await googleSignIn.signOut();
  }
}
