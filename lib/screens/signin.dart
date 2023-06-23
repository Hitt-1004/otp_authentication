import 'package:flutter/material.dart';

import '../models/signinModel.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SignInModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = SignInModel();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  var role = "";
  var color = Colors.white, color1 = Colors.white;

  void toggle() {
    if(color == Colors.white){
      color = Color(0XFF2E3B62);
      color1 = Colors.white;
      role = "shipper";
    }
    else if(color1 == Colors.white){
      color = Colors.white;
      color1 = Color(0XFF2E3B62);
      role = "transporter";
    }
    else if(color1 == Color(0XFF2E3B62) && color == Colors.white){
      color = Colors.white;
      color1 = Colors.white;
    }
    else if(color == Color(0XFF2E3B62) && color1 == Colors.white){
      color = Colors.white;
      color1 = Colors.white;
    }
  }

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
                'Please select your profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                  width: 100,
                  height: 100,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: InkWell(
                            onTap: () {
                              role = 'shipper';
                              setState(() {
                                toggle();
                              });
                            },
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: color,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Icon(
                          Icons.warehouse_outlined,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                      const SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Shipper',
                                  style:
                                  TextStyle(
                                    fontSize: 18
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                                  style:
                                  TextStyle(
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                  width: 100,
                  height: 100,
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
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: InkWell(
                            onTap: () {
                              role = 'transporter';
                              setState(() {
                                toggle();
                              });
                            },
                            child: Container(
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: color1,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 20, 0),
                        child: Icon(
                          Icons.local_shipping_outlined,
                          color: Colors.black,
                          size: 35,
                        ),
                      ),
                      const SingleChildScrollView(
                        child:
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Transporter',
                                  style:
                                  TextStyle(
                                    fontSize: 18
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  'Lorem ipsum dolor sit amet, \nconsectetur adipiscing elit.',
                                  style:
                                  TextStyle(
                                    fontSize: 12
                                  ),
                                ),
                              ],
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                child: Container(
                  width: 100,
                  height: 56,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2E3B62),
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: const Text(
                    'CONTINUE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
