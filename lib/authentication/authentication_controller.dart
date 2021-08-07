// to keep track of our users current authentication state
// in the app we are going to create an auth controller
// inside of a controller folder

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sentezel/authentication/authentication_repository.dart';

//------AuthControllerProvider--
final authControllerProvider = StateNotifierProvider<AuthController, User?>(
  // (
  (ref) =>
//       //we use cascade notation to call appstarted method
//       //once the auth controller is instantiated
//       //this means as soons as the app loads
//       //our user will be authenticated thanks to the app started method

      AuthController(ref.read)..appStarted(),
// );
);

class AuthController extends StateNotifier<User?> {
  //Auth controller extends StateNotifier of type
//Nullable user. This means that the state of out auth controller
//can either be null when the user is not logged in
  //Auth controller takes in a reader and
  final Reader _read;

  //nullable stream subscription of typenullable type user
  //called _authStateSubscription
  StreamSubscription<User?>? _authStateChangesSubscription;

  //in the constructor we set the initial state of our
  // AuthController to null because no user is signed in
  //using super we are calling parent constructor which
  //is the constructor of StateNotifier
  AuthController(this._read) : super(null) {
    //we subscribe the auth state changes to stream from our
    //auth repository and update our auth controller state
    //whenever user logs in or logs out
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription = _read(authRepositoryProvider)
        .authStateChanges
        .listen((user) => state = user);
  }

  //we also need a disposed method to cancel out auth state changes
  //subscription if it exist

  @override
  void dispose() {
    _authStateChangesSubscription?.cancel();
    super.dispose();
  }

  //appStarted function gets the current user from firebase
  //if the user is null then we log the user in
  //with singin anonymously
  void appStarted() async {
    final user = _read(authRepositoryProvider).getCurrentUser();
    if (user == null) {
      await _read(authRepositoryProvider).signinAnonymously();
    }
  }

  //signout calls our auth repositories signout method
  void signOut() async {
    await _read(authRepositoryProvider).signOut();
  }
}
