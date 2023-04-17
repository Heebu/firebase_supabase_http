import 'package:supabase_flutter/supabase_flutter.dart';


class SuperBaseAuth {
  final superBaseAuth = Supabase.instance.client.auth;

  //Sign up with email and password
   signUpAuthEmailPassword(String email, String password) async{

   if(email.toString().isNotEmpty || password.toString().isNotEmpty || (email.toString().isNotEmpty && password.toString().isNotEmpty)) {
      try {
        final AuthResponse res = await superBaseAuth.signUp(
          email: email,
          password: password,
        );
        final Session? session = res.session;
        final User? user = res.user;

      } catch (e) {
        print(e.toString());
      }
    }else{
    print('Please fill in the text fields');
   }
  }

  //Sign in with email and password
  signInEmailPassword(String email, String password, ) async{

    if(email.toString().isNotEmpty || password.toString().isNotEmpty || (email.toString().isNotEmpty && password.toString().isNotEmpty)) {
      try {
        final AuthResponse res = await superBaseAuth.signInWithPassword(
          email: email,
          password: password,
          captchaToken: HiveLocalStorage.encryptionKey,
        );
        final Session? session = res.session;
        final User? user = res.user;
      } catch (e) {
        print(e.toString());      }
    }else{
      print('Please fill in the text fields');
    }
  }

  //verification with phone number (still in progress...)
  Future<String> verifyPhoneNumber(String phoneNumber) async{
    String result = 'An unexpected error occurred';

    if(phoneNumber.toString().isNotEmpty && phoneNumber.toString().isNotEmpty) {
      try {
       await superBaseAuth.signInWithOtp(phone: phoneNumber, shouldCreateUser: true);
        result = 'Success';
      } catch (e) {
        result = e.toString();
      }
    }else{
      result = 'Please fill in the text fields';
    }
    return result;
  }

  //verification otp with email link
  Future<String> verifyOTPLink(String email) async{
    String result = 'An unexpected error occurred';

    if(email.toString().isNotEmpty) {
      try {
        final AuthResponse res = await superBaseAuth.verifyOTP(
          type: OtpType.magiclink,
         email: email,
          token: '',
        );
        final Session? session = res.session;
        final User? user = res.user;

        result = 'Success';
      } catch (e) {
        result = e.toString();
      }
    }else{
      result = 'Please fill in the text fields';
    }
    return result;
  }

  //verification otp (still in progress...)
  Future<String> verifyOTP(String phoneNumber) async{
    String result = 'An unexpected error occurred';

    if(phoneNumber.toString().isNotEmpty || phoneNumber.toString().length >= 12) {
      try {
        final AuthResponse res = await superBaseAuth.verifyOTP(
          type: OtpType.magiclink,
          phone: phoneNumber,
          token: '',
        );
        final Session? session = res.session;
        final User? user = res.user;

        result = 'Success';
      } catch (e) {
        result = e.toString();
      }
    }else{
      result = 'Please fill in the text fields';
    }
    return result;
  }

//Forget Password
  forgotPassword(String email) async{
    if(email.toString().isNotEmpty) {
      try {
         await superBaseAuth.resetPasswordForEmail(email );

      } catch (e) {
        print(e.toString());      }
    }else{
      print('Please fill in the text fields');
    }
  }

//Sign Out
  signOut() async{
      try {
        await superBaseAuth.signOut();
      } catch (e) {
        print(e.toString());
    }
  }
}