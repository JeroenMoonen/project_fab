import 'package:project_fab/localization/localization.dart';

class LocalizationEN implements Localization {
  // Login
  @override
  String get loginSubmit => 'Login';
  @override
  String get loginPageTitle => 'Login';
  @override
  String get loginSubTitle => 'Welcome back!';
  @override
  String get loginEmail => 'E-mail';
  @override
  String get loginPassword => 'Password';
  @override
  String get loginRegister => 'Dont have an account yet?';
  @override
  String get loginForgotPassword => 'Forgot password';

  // Register
  @override
  String get registerPageTitle => 'Registreren';
  @override
  String get registerSubTitle => 'Create an account';
  @override
  String get registerEmail => 'E-mail';
  @override
  String get registerDateOfBirth => 'Date of birth';
  @override
  String get registerPassword => 'Password';
  @override
  String get registerConfirmPassword => 'Confirm Password';
  @override
  String get registerSubmit => 'Sign up';
  @override
  String get registerLogin => 'Already have an account?';

  //Checkins
  @override
  String get checkinLeaveAMessage => 'Leave a comment';
  @override
  String get checkinCheersAndComments => 'Cheers & comments';

  //Comments
  @override
  String get commentsThereAreNoComments => 'There are no comments yet';
  @override
  String get commentsLeaveAComment => 'Leave a comment';

  //Forgot password
  @override
  String get forgotPasswordTitle => 'Forgot password';
  @override
  String get forgotPasswordSubtitle => 'No problem, we got you';
  @override
  String get forgotPasswordEmail => "Email";
  @override
  String get forgotPasswordSubmit => 'Send me a reset link';
  @override
  String get forgotPasswordIDoRemember => 'Nevermind, I remember now!';

  //Profile
  @override
  String get profileFollowers => 'Followers';
  @override
  String get profileFriends => 'Friends';
  @override
  String get profileCheckins => 'Check-ins';

  //Profile settings
  @override
  String get profileSettingsFirstname => 'First name';
  @override
  String get profileSettingsLastname => 'Last name';
  @override
  String get profileSettingsLocation => 'Location';
  @override
  String get profileSettingsAbout => 'About';

  @override
  String get home => 'home';
  @override
  String get discover => 'discover';
  @override
  String get people => 'people';
  @override
  String get profile => 'profile';
}
