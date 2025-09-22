import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:s2/services/firebase_services/auth_repe.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  late final StreamSubscription<User?> _sub;

  AuthCubit(this._repo) : super(const AuthInitial()) {
    // نسمع تغيّر حالة المستخدم ونحوّل UI
    _sub = _repo.authStateChanges().listen((user) {
      if (user == null) {
        emit(const AuthUnauthenticated());
      } else {
        emit(AuthAuthenticated(user));
      }
    });
  }

  Future<void> signInEmail(String email, String password) async {
    emit(const AuthLoading());
    try {
      await _repo.signInWithEmail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      emit(AuthUnauthenticated(e.message));
    } catch (_) {
      emit(const AuthUnauthenticated('Failed to sign in'));
    }
  }

  Future<void> registerEmail(String email, String password) async {
    emit(const AuthLoading());
    try {
      await _repo.registerWithEmail(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      emit(AuthUnauthenticated(e.message));
    } catch (_) {
      emit(const AuthUnauthenticated('Registration failed'));
    }
  }

  Future<void> resetPassword(String email) async {
    emit(const AuthLoading());
    try {
      await _repo.sendPasswordResetEmail(email);
      // بنرجّع الشاشة مع رسالة نجاح بسيطة
      emit(const AuthUnauthenticated('Password reset email sent'));
    } on FirebaseAuthException catch (e) {
      emit(AuthUnauthenticated(e.message));
    } catch (_) {
      emit(const AuthUnauthenticated('Failed to send reset email'));
    }
  }

  Future<void> signOut() async {
    emit(const AuthLoading());
    await _repo.signOut();
    // الاستريم هيحوّل الحالة لـ Unauthenticated تلقائيًا بعد signOut
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }
}
