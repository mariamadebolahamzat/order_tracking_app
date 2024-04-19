import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:order_tracking_app/src/domain/auth/repository/auth_repository_interface.dart';
import 'package:order_tracking_app/src/domain/core/exceptions.dart';

final class AuthRepositoryImpl implements AuthRepositoryInterface {
  AuthRepositoryImpl();

  static final GoogleSignIn googleAuth = GoogleSignIn();

  @override
  Future<Either<AppException, User>> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        final User user = userCredential.user!;

        return Right(user);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        return const Left(
            MessageException('The account already exists with a different credential.'));
      } else if (e.code == 'invalid-credential') {
        return const Left(MessageException(
          'Error occurred while accessing credentials. Try again.',
        ));
      }
    } on Exception catch (e) {
      Left(MessageException(e.toString()));
    }
    return const Left(AuthException('Unknown error occurred'));
  }
}
