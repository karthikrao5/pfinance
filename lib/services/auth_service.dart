import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserState {
  final User? user;
  final bool isLoading;
  final String? error;

  const UserState({this.user, this.isLoading = false, this.error});
}

class AuthService extends Cubit<UserState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FlutterAppAuth appAuth = const FlutterAppAuth();

  AuthService() : super(const UserState()) {
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      if (currentUser.email != null) {}

      emit(UserState(isLoading: false, user: currentUser));

      auth.userChanges().listen((final User? user) {
        if (user == null) {
          emit(const UserState(isLoading: false, user: null));
        } else {
          emit(UserState(isLoading: false, user: user));
        }
      });
    }
  }

  Future<void> loginAction({final signup = false}) async {
    emit(const UserState(isLoading: true));

    final auth0Token =
        await appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
      dotenv.env["AUTH0_CLIENT_ID"]!,
      dotenv.env["AUTH0_REDIRECT_URL"]!,
      issuer: "https://${dotenv.env["AUTH0_DOMAIN"]}",
      scopes: ["openid", "profile", "offline_access", "email"],
      promptValues: ["login"],
    ));

    auth0Token.accessToken
  }

  Future<void> logoutAction() async {
    emit(const UserState(isLoading: true));
  }
}
