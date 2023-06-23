import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_authentication/screens/contact.dart';
import 'package:pinput/pinput.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key, required this.phoneCode, this.contact}) : super(key: key);

  final contact;
  final phoneCode;

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {

  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0XFF46A6DD)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color(0XFF46A6DD)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0XFF46A6DD),
      ),
    );

    var code = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Verify Phone",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Code is sent to ${widget.contact.value.text}",
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Pinput(
                length: 6,
                // defaultPinTheme: defaultPinTheme,
                // focusedPinTheme: focusedPinTheme,
                // submittedPinTheme: submittedPinTheme,

                showCursor: true,
                onCompleted: (pin) => print(pin),
                onChanged: (value) { code = value; },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Didn't receive the code ?",
                  style: TextStyle(
                    color: Colors.grey
                  ),),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,  '/contact', (route) => false,);
                      },
                      child: const Text(
                        "Request Again",
                        style: TextStyle(color: Colors.black),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    PhoneAuthCredential credential = PhoneAuthProvider.credential(
                        verificationId: Contact.verificationId, smsCode: code);
                    await auth.signInWithCredential(credential);
                    Navigator.pushNamed(context, "/signin");
                  },
                  child: Container(
                    width: 600,
                    height: 53,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E3B62),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'VERIFY AND CONTINUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Outfit',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}