import 'package:country_picker/country_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otp_authentication/screens/verify.dart';

import '../models/contactModel.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  static String verificationId = "";

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late ContactModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = ContactModel();

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Country country = Country(phoneCode: "91", countryCode: "IN", e164Sc: 0, geographic: true,
      level: 1, name: "India", example: "India", displayName: "India", displayNameNoCountryCode: "IN", e164Key: "");
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Please enter your mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(171, 32),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(70, 10, 70, 0),
                  child: Text(
                    'You\'ll receive a 4 digit code to verify next.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                child: Container(
                  width: 1,
                  height: 58,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: InkWell(
                          onTap: () {
                            showCountryPicker(context: context,
                                countryListTheme: CountryListThemeData(bottomSheetHeight: 400),
                                onSelect: (value) {
                              setState(() {
                                country = value;
                              });
                            });
                          },
                          child: Text("${country.flagEmoji}  +${country.phoneCode}",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black
                          ),),
                        )
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                          child: TextFormField(
                            controller: _model.textController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintText: 'Mobile Number',
                              hintStyle: const TextStyle(
                                fontFamily: 'Readex Pro',
                                color: Colors.grey,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              errorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF2E3B62),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xFF2E3B62),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            validator: (value) {
                              if(value!.isEmpty){
                                return "This field cannot be empty.";
                              }
                              else if(value.length < 10){
                                return "Length cannot be less than 10";
                              }
                              return null;
                            },
                            style: TextStyle(),
                            keyboardType: TextInputType.phone,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '+${country.phoneCode + _model.textController!.value.text}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Contact.verificationId = verificationId;
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Verify(phoneCode: country.phoneCode, contact: _model.textController)));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Container(
                    width: 1,
                    height: 53,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2E3B62),
                    ),
                    child: const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'CONTINUE',
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
