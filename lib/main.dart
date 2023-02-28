import 'package:flutter/material.dart';
import 'package:grapth/pages/already_signed_up_account_page.dart';
import 'package:grapth/pages/authentication_number.dart';
import 'package:grapth/pages/phone_number_page.dart';
import 'package:grapth/pages/sign_in_textfields.dart';
import 'package:grapth/terms_of_service/terms_of_service_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'Pretendard',
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFFFFFFFF),
            errorStyle: TextStyle(fontSize: 0,height: 0),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.5,
                color: Color(0xFFAEAEAE)),
            contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFDDDDDD),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFF07BEB8),
              ),
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xFFE74C3C))),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Color(0xFFE74C3C))),
          ),
      ),
      initialRoute: '/PhoneNumberPage',
      routes: {
        '/PhoneNumberPage' : (context) => PhoneNumberPage(),
        '/AuthenticationNumber' : (context) => AuthenticationNumber(),
        '/TermsOfServicePage' : (context) => TermsOfServicePage(),
        '/AlreadySignedUpAccountPage' : (context) => AlreadySignedUpAccountPage(),
        '/SignInTextFieldsPage' : (context) => SignInTextFieldsPage()
      },
    );
  }
}
