import '../models/langModel.dart';
import 'package:flutter/material.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  _SelectLanguageState createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  late SelectLanguageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = SelectLanguageModel();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  String dropdownValue = 'English'; // Initial dropdown value

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://cdn3.vectorstock.com/i/1000x1000/96/72/gallery-icon-vector-21679672.jpg',
                          width: 94,
                          height: 76,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                        child: Text(
                          'Please select your language',
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                   const  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(80, 10, 80, 0),
                      child: Text(
                        'You can change the language at any time.',
                        textAlign: TextAlign.center,
                        style: TextStyle(

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 30, 0),
                    child: Container(
                      width: 295,
                      height: 51,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Padding(padding: const EdgeInsetsDirectional.fromSTEB(20,0,0,0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: [
                          'English',
                          'Hindi',
                          'Gujarati',
                          'Marathi',
                          'German',
                          'Finnish',
                          'Italian',
                          'Dutch',
                          'French'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )),
                    ),
                ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pushNamed(context, '/contact');
                        },
                        child: Container(
                          width: 295,
                          height: 51,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2E3B62),
                          ),
                          alignment: const AlignmentDirectional(0, 0),
                          child: const Text(
                            'NEXT',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 1.15),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/wave.png',
                      width: 380,
                      height: 150,
                      fit: BoxFit.cover,
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
