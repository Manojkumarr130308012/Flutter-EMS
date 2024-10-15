import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/core/utils/enum/auth_enums.dart';
import 'package:oriens_eam/core/utils/extensions/build_context/local.dart';
import 'package:oriens_eam/features/0_auth/auth_presentation/view/url_page.dart';
import 'package:oriens_eam/features/0_auth/auth_presentation/view/widgets/text_form_field_widget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/preference_manager.dart';
import '../../../../core/utils/validate_operations.dart';
import '../auth_bloc/auth_bloc.dart';

// class LoginPage extends StatelessWidget {
//   static const routeName = "/login";
//   const LoginPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       padding: EdgeInsets.only(
//           top: 50, bottom: MediaQuery.of(context).viewInsets.bottom),
//       child: Stack(
//         children: [
//           const Padding(
//             padding: EdgeInsets.only(top: 60.0, left: 22),
//             child: Text(
//               'Login',
//               style: TextStyle(
//                   fontSize: 30,
//                   color: Colors.black54,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 200.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(40),
//                     topRight: Radius.circular(40)),
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 18.0, right: 18),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const TextField(
//                       decoration: InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.check,
//                             color: Colors.grey,
//                           ),
//                           label: Text(
//                             'Email',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54,
//                             ),
//                           )),
//                     ),
//                     const TextField(
//                       decoration: InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.visibility_off,
//                             color: Colors.grey,
//                           ),
//                           label: Text(
//                             'Password',
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black54,
//                             ),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     const Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         'Forgot Password?',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17,
//                           color: Colors.black54,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     Container(
//                       height: 55,
//                       width: 300,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         gradient: LinearGradient(colors: [
//                           Colors.blue,
//                           Colors.blue.shade200,
//                         ]),
//                       ),
//                       child: const Center(
//                         child: Text(
//                           'SIGN IN',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.white),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     const Align(
//                       alignment: Alignment.center,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Don't have account?",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.grey),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           Text(
//                             "Sign up",
//                             style: TextStyle(
//
//                                 ///done login page
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 17,
//                                 color: Colors.black),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late StreamSubscription authStream;
  late final AuthBloc authBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController =
      TextEditingController(text: "SiteAdmin@Orienseam");
  TextEditingController passwordController =
      TextEditingController(text: "123@EAMADmin");
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String fcmToken = "Getting Firebase Token";

  // emailController.text = "SiteAdmin@Orienseam";
  // passwordController.text = "123@EAMADmin";

  bool? get validate => _formKey.currentState?.validate();
  @override
  void initState() {
    getTokenz();
    _getStoragePermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Setting Button added by S
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200),
                      height: 50,
                      width: 50,
                      child: IconButton(
                        icon: const Icon(Icons.settings),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UrlPage()),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        BlocListener<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state.status == AuthStatus.authenticated) {
                              Future.delayed(const Duration(seconds: 2))
                                  .then((value) => context.go("/home"));
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _header(context),
                              const SizedBox(
                                height: 20,
                              ),
                              BlocConsumer<AuthBloc, AuthState>(
                                listener: (context, state) {
                                  if (state.status !=
                                          AuthStatus.authenticated &&
                                      state.status != AuthStatus.loading) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: const Text(
                                          "Invalid Email Or Password"),
                                      backgroundColor: Colors.red.shade300,
                                    ));
                                  }
                                },
                                builder: (context, state) {
                                  return _inputField(context, state,
                                      ontap: () async {
                                    if (validate != null && validate == true) {
                                      print("email" +
                                          emailController.text.trim());
                                      print("password" +
                                          passwordController.text.trim());
                                      print("fcm" + fcmToken);
                                      print(
                                          "url${SharedPreferenceUtils.getString('eamAPIBaseURL')!}");

                                      context.read<AuthBloc>().add(
                                          LoginRequested(
                                              emailController.text.trim(),
                                              passwordController.text.trim(),
                                              fcmToken));
                                    }
                                  });
                                },
                              ),
                              _forgotPassword(context),
                              // _signup(context),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(BuildContext context) {
    return Column(
      children: [
        // const Image(
        //   height: 100,
        //   width: 200,
        //   image: AssetImage("assets/images/farm.jpeg"),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(Icons.settings_sharp, size: 40, color: Colors.red),
            // SizedBox(
            //   width: 15,
            // ),
            Text(
              context.local.app_title,
              style: const TextStyle(fontSize: 34, color: Colors.red),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("Enter your credential to login"),
      ],
    );
  }

  _inputField(context, state, {Function()? ontap}) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _EmailFormField(emailController: emailController),
          // TextField(
          //   decoration: InputDecoration(
          //       hintText: "Username",
          //       border: OutlineInputBorder(
          //           borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          //       fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          //       filled: true,
          //       prefixIcon: const Icon(Icons.person_outline_outlined)),
          // ),
          // const SizedBox(height: 10),
          _PasswordFormField(passwordController: passwordController),
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: "Password",
          //     border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          //     fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
          //     filled: true,
          //     prefixIcon: const Icon(Icons.lock_outline),
          //   ),
          //   obscureText: true,
          // ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: ontap,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: state.status == AuthStatus.loading
                ? const Center(child: CupertinoActivityIndicator())
                : const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
          )
        ],
      ),
    );
  }

  getTokenz() async {
    String? token = await _firebaseMessaging.getToken();
    fcmToken = token!;
    print("fcmToken ${fcmToken}");
  }

  Future _getStoragePermission() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final AndroidDeviceInfo info = await deviceInfoPlugin.androidInfo;
    final permissionStatus = await Permission.storage.status;
    if (permissionStatus.isDenied) {
      // Here just ask for the permission for the first time
      await Permission.storage.request();
    } else if (permissionStatus.isPermanentlyDenied) {
      // Here open app settings for user to manually enable permission in case
      // where permission was permanently denied
      await openAppSettings();
    } else {
      // Do stuff that require permission here
    }
  }

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {
          GoRouter.of(context).push("/forgot-password");
        },
        child: const Text("Forgot password?"));
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        TextButton(onPressed: () {}, child: const Text("Sign Up"))
      ],
    );
  }
}

class _EmailFormField extends StatelessWidget {
  const _EmailFormField({
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: emailController,
      title: StringConstants.emailTitle,
      hintText: StringConstants.emailHint,
      prefixIcon: Icons.person_2_outlined,
      keyboardType: TextInputType.emailAddress,
      onSaved: (value) {
        emailController.text = value!;
      },
      validator: (value) => ValidateOperations.emailValidation(value),
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  const _PasswordFormField({
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      controller: passwordController,
      title: StringConstants.passwordTitle,
      hintText: StringConstants.passwordHint,
      prefixIcon: Icons.lock_outline_rounded,
      isPassword: true,
      onSaved: (value) {
        passwordController.text = value!;
      },
      validator: (value) => ValidateOperations.normalValidation(value),
    );
  }
}
