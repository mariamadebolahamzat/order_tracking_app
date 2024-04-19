import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:order_tracking_app/src/domain/core/exceptions.dart';
import 'package:order_tracking_app/src/infrastructure/auth/repository/auth_repo_impl.dart';

abstract interface class AuthRepositoryInterface {
  Future<Either<AppException, User>> signInWithGoogle();
}

final authRepositoryProvider = Provider.autoDispose<AuthRepositoryInterface>((ref) {
  return AuthRepositoryImpl();
});
