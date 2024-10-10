import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

Future<UserCredential> signInWithApple() async {
  // Create a new apple sign in request
  final appleCredential = await SignInWithApple.getAppleIDCredential(
    scopes: [
      // Scope.email,
      // Scope.fullName,
    ],
  );

  // Create a new credential
  final credential = OAuthProvider("apple.com").credential(
    idToken: appleCredential.identityToken,
    accessToken: appleCredential.authorizationCode,
  );

  // Sign in with the credential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
