// //Contains all the mehtod signatures that
// // our auth repository will implement.
// //This is very usefule in testing our repository
// //because we can easily create a mock auth repository
// // that we know for sure has implemented
// // all of the required methods
// //

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:sentezel/common/exceptions/customExceptions.dart';
// import 'package:sentezel/common/providers/fireBase_provider.dart';

// abstract class BaseAuthRepository {
//   Stream<User?> get authStateChanges;
//   Future<void> signinAnonymously();
//   User? getCurrentUser();
//   Future<void> signOut();
// }

// //we can access it accross our app
// final authRepositoryProvider =
//     Provider<AuthRepository>((ref) => AuthRepository(ref.read));

// class AuthRepository implements BaseAuthRepository {
//   //This Reader is from RiverPod.
//   //This reader allows the auth repository to read other
//   // providers in the app
//   //In this case we need to read our firebase auth.instance
//   //which we will get from a provider
//   // called firebase auth provider from general_providers.dart
//   final Reader _read;

//   const AuthRepository(this._read);

//   @override
//   //we have to do is to access firebaseauth.instance
//   // with read firebase auth provider and call the method
//   // authstate changes -this method returns a nullable user
//   //whenever the current user sign in or signout

//   Stream<User?> get authStateChanges =>
//       _read(firebaseAuthProvider).authStateChanges();
//   @override
//   Future<void> signinAnonymously() async {
//     //SigninAnonymously is asynchronous and we just have to await
//     // a sign in anonymously to create our user in firbebase
//     //note that if an anonymous user is already signed in
//     //this method returns the existing anonymous user.
//     try {
//       await _read(firebaseAuthProvider).signInAnonymously();
//     } on FirebaseAuthException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }

//   @override
//   getCurrentUser() {
//     print('--WARNING---GET USER IN THE AUTH REPOSITORY IS CALLED--');
//     // returns the current user
//     try {
//       _read(firebaseAuthProvider).currentUser;
//     } on FirebaseAuthException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }

//   @override
//   Future<void> signOut() async {
//     //first logs out the current user and sign in the user
//     //anonymously by calling our sing in anonymously method
//     //this ensures that users will always be authenticated
//     // while using our app
//     try {
//       await _read(firebaseAuthProvider).signOut();
//       await _read(firebaseAuthProvider).signInAnonymously();
//     } on FirebaseAuthException catch (e) {
//       throw CustomException(message: e.message);
//     }
//   }
// }
