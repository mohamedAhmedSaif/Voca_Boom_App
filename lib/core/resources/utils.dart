import 'package:flutter/material.dart';
import 'package:voca_boom_app/models/sign_up/required_password_field_model.dart';

class Utils {
  Utils._();

  static const String kSignUp = 'Sign Up';
  static const String kEmail = 'Email';
  static const String kPassword = 'Password';
  static const String kForgetPassword = 'Forget Password....?';
  static const String kSignUpNow = 'Sign Up Now';
  static const String kDonHaveAnAccount = 'Don’t have an account?';
  static const String kEnterYourEmail = 'Enter Your Email';
  static const String kEnterYourPassword = 'Enter Your Password';
  static const String kVocaBoom = 'VocaBoom';
  static const String kHelloInVocaBoom = 'Hello in Vocaboom';
  static const String kWhoAreYou = 'Who Are You ?';
  static const String kTeacher = 'Teacher';
  static const String kStudent = 'Student';
  static const String kLearnTheLetters = 'Learn The Letters';
  static const String kTryQuizpressed = "Try Quiz pressed!";
  static const String kTryQuiz = "Try Quiz";
  static const String kselectapaymentmethod = 'select a payment method';
  static const String kInstaPay = 'InstaPay';
  static const String kvisa = 'Visa';
  static const String kMastercard = 'Mastercard';
  static const String kselectyourpayment = 'select your pay ment';
  static const String kpaynow = 'pay now';
  static const String kBack = 'Back';
  static const String kPleaseEnterEmail =
      'Please enter the email address associated with your account, and we\'ll send you OTP to reset your password.';
  static const String kEnterEmail = 'Enter your email address';
  static const String kSendCode = 'Send Code';
  static const String kLogIn = 'Log In';
  static const String kDontHaveAnAccount = "Don't have an account? ";
  static const String kSoundIcon = 'Sound icon pressed!';
  static const String kSimpleSentences = 'Simple Sentences';
  static const String kSpeakUnderstand = 'Speak & Understand';
  static const String kTryASituation = 'Try a Situation';
  static const String kTryQuizButton =
      'Try Quiz button pressed on Sentences Page!';

  static const String kPleaseEnterAtLeast8Characters =
      'Please enter at least 8 characters';

  static const String kPleaseEnterSomeText = 'Please enter some text';
  static const List<Map<String, dynamic>> letters = [
    {'letter': 'A', 'letterSmall': 'a', 'word': 'Apple', 'icon': Icons.apple},
    {
      'letter': 'B',
      'letterSmall': 'b',
      'word': 'Ball',
      'icon': Icons.sports_baseball,
    },
    {
      'letter': 'C',
      'letterSmall': 'c',
      'word': 'Car',
      'icon': Icons.directions_car,
    },
    {'letter': 'D', 'letterSmall': 'd', 'word': 'Duck', 'icon': Icons.toys},
    {'letter': 'E', 'letterSmall': 'e', 'word': 'Egg', 'icon': Icons.egg},
    {'letter': 'F', 'letterSmall': 'f', 'word': 'Fish', 'icon': Icons.set_meal},
    {'letter': 'G', 'letterSmall': 'g', 'word': 'Girl', 'icon': Icons.face},
    {'letter': 'H', 'letterSmall': 'h', 'word': 'Horse', 'icon': Icons.pets},
    {
      'letter': 'I',
      'letterSmall': 'i',
      'word': 'Ice Cream',
      'icon': Icons.icecream,
    },
    {'letter': 'J', 'letterSmall': 'j', 'word': 'Jar', 'icon': Icons.coffee},
    {'letter': 'K', 'letterSmall': 'k', 'word': 'Key', 'icon': Icons.vpn_key},
    {
      'letter': 'L',
      'letterSmall': 'l',
      'word': 'Light',
      'icon': Icons.lightbulb,
    },
    {
      'letter': 'M',
      'letterSmall': 'm',
      'word': 'Moon',
      'icon': Icons.brightness_2,
    },
    {'letter': 'N', 'letterSmall': 'n', 'word': 'Nose', 'icon': Icons.sick},
    {
      'letter': 'O',
      'letterSmall': 'o',
      'word': 'Octopus',
      'icon': Icons.bubble_chart,
    },
    {'letter': 'P', 'letterSmall': 'p', 'word': 'Pencil', 'icon': Icons.edit},
    {
      'letter': 'Q',
      'letterSmall': 'q',
      'word': 'Queen',
      'icon': Icons.emoji_people,
    },
    {
      'letter': 'R',
      'letterSmall': 'r',
      'word': 'Rocket',
      'icon': Icons.rocket_launch,
    },
    {'letter': 'S', 'letterSmall': 's', 'word': 'Star', 'icon': Icons.star},
    {'letter': 'T', 'letterSmall': 't', 'word': 'Tree', 'icon': Icons.park},
    {
      'letter': 'U',
      'letterSmall': 'u',
      'word': 'Umbrella',
      'icon': Icons.umbrella,
    },
    {
      'letter': 'V',
      'letterSmall': 'v',
      'word': 'Volcano',
      'icon': Icons.terrain,
    },
    {
      'letter': 'W',
      'letterSmall': 'w',
      'word': 'Worm',
      'icon': Icons.settings_input_component,
    },
    {
      'letter': 'X',
      'letterSmall': 'x',
      'word': 'Xylophone',
      'icon': Icons.music_note,
    },
    {'letter': 'Y', 'letterSmall': 'y', 'word': 'Yoyo', 'icon': Icons.toys},
    {
      'letter': 'Z',
      'letterSmall': 'z',
      'word': 'Zebra',
      'icon': Icons.agriculture,
    },
  ];

  static const String kFirstName = 'First Name';

  static const String kEnterYourFirstName = 'Enter your first name';

  static const String kEnterYourLastName = 'Enter your last name';

  static const String kLastName = 'Last Name';

  static const String kPhone = 'Phone Number';

  static const String kEnterYourPhone = 'Enter your phone number';

  static const String kConfirmPassword = 'Confirm Password';

  static const String kEnterYourConfirmPassword = 'Enter your confirm password';

  static const String kUploadImageForYourProfile =
      'Upload image for your profile';

  static const String kUploadImage = 'Uplaod Image';
  static List<RequiredPasswordFieldModel> listRequiredPasswordFieldModel = [
    RequiredPasswordFieldModel(title: 'At least 12 characters', validate: false),
    RequiredPasswordFieldModel(title: 'One Uppercase Character', validate: false),
    RequiredPasswordFieldModel(title: 'One Lowercase Character', validate: false),
    RequiredPasswordFieldModel(title: 'One Number', validate: false),
    RequiredPasswordFieldModel(title: 'One Special Character', validate: false),
  ];

  static const String kJoinUs = 'Join Us';
}
