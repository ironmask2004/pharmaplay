import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_widgets.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  // TextEditingController emailAddressLoginController;
  // TextEditingController passwordLoginController;
  bool passwordLoginVisibility = true;
  bool _loadingButton1 = false;
  bool _loadingButton2 = false;
  bool _loadingButton3 = false;
  bool _loadingButton4 = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    //emailAddressLoginController = TextEditingController();
    //passwordLoginController = TextEditingController();
    passwordLoginVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.secondaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.secondaryColor,
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: Image.asset(
                      'assets/images/login_bg@2x.png',
                    ).image,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 24, 0, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/finWallet_logo_landscape.png',
                              width: 170,
                              height: 60,
                              fit: BoxFit.fitWidth,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Get Started',
                                    style: FlutterFlowTheme.title1,
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      'Create your account below.',
                                      style: FlutterFlowTheme.subtitle1,
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: TextFormField(
                                  //   controller: emailAddressLoginController,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                    ),
                                    hintText: 'Enter your email...',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.secondaryColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: 'Lexend Deca',
                                    fontStyle: FontStyle.normal,
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                                child: TextFormField(
                                  //controller: passwordLoginController,
                                  obscureText: !passwordLoginVisibility,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 14,
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                    ),
                                    hintText: 'Enter your password...',
                                    hintStyle:
                                        FlutterFlowTheme.bodyText1.override(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13,
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0x98FFFFFF),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.secondaryColor,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 20, 24),
                                    suffixIcon: InkWell(
                                      onTap: () => setState(
                                        () => passwordLoginVisibility =
                                            !passwordLoginVisibility,
                                      ),
                                      child: Icon(
                                        passwordLoginVisibility
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined,
                                        color: Color(0x98FFFFFF),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.bodyText1.override(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.normal,
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.primaryColor,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 24, 0, 24),
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        setState(() => _loadingButton1 = true);
                                        try {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const ForgotPasswordWidget(),
                                            ),
                                          );
                                        } finally {
                                          setState(
                                              () => _loadingButton1 = false);
                                        }
                                      },
                                      // text: 'Forgot Password?',
                                      /*options: FFButtonOptions(
                                        width: 170,
                                        height: 40,
                                        color: Color(0x001A1F24),
                                        textStyle:
                                            FlutterFlowTheme.subtitle2.override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                        ),
                                        elevation: 0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: 8,
                                      ),*/
                                      // loading: _loadingButton1,
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () async {
                                      setState(() => _loadingButton2 = true);
                                      try {
                                        final user = await signInWithEmail(
                                            // context,
                                            // emailAddressLoginController.text,
                                            // passwordLoginController.text,
                                            );
                                        if (user == null) {
                                          return;
                                        }

                                        await Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NavBarPage(),
                                          ),
                                          (r) => false,
                                        );
                                      } finally {
                                        setState(() => _loadingButton2 = false);
                                      }
                                    },
                                    // text: 'Login',
                                    /* options: FFButtonOptions(
                                      width: 120,
                                      height: 50,
                                      color: FlutterFlowTheme.primaryColor,
                                      textStyle:
                                          FlutterFlowTheme.subtitle2.override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.textColor,
                                      ),
                                      elevation: 3,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1,
                                      ),*/
                                    //borderRadius: 30,
                                  ),
                                  //loading: _loadingButton2,
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.secondaryColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Don\'t have an account?',
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            setState(
                                                () => _loadingButton3 = true);
                                            try {
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterAccountWidget(),
                                                ),
                                              );
                                            } finally {
                                              setState(() =>
                                                  _loadingButton3 = false);
                                            }
                                          },
                                          text: 'Create',
                                          options: FFButtonOptions(
                                            iconPadding:
                                                EdgeInsetsGeometry.infinity,
                                            padding:
                                                EdgeInsetsGeometry.infinity,
                                            width: 85,
                                            height: 40,
                                            color:
                                                FlutterFlowTheme.secondaryColor,
                                            textStyle: FlutterFlowTheme
                                                .bodyText2
                                                .override(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              fontStyle: FontStyle.normal,
                                              fontFamily: 'Lexend Deca',
                                              color:
                                                  FlutterFlowTheme.primaryColor,
                                            ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius: 12,
                                          ),
                                          //  loading: _loadingButton3,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_rounded,
                                          color: FlutterFlowTheme.primaryColor,
                                          size: 24,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                        child: FloatingActionButton(
                          onPressed: () async {
                            setState(() => _loadingButton4 = true);
                          },
                          //text: 'Continue as Guest',
                         // options: FFButtonOptions(
                            //width: 230,
                          //  height: 50,
                          //  color: FlutterFlowTheme.background,
                           // textStyle: FlutterFlowTheme.subtitle2.override(
                           //   fontFamily: 'Lexend Deca',
                           //   color: FlutterFlowTheme.textColor,
                            ),
//elevation: 3,
                            //borderSide: BorderSide(
                             // color: Colors.transparent,
                             // width: 1,
                            ),
                           // borderRadius: 30,
                         // ),
                         // loading: _loadingButton4,
                        ),
                     // )
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  signInWithEmail() {}
}

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NavBarPage extends StatelessWidget {
  const NavBarPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
