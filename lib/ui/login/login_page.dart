// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/resources/assests_manager.dart';
import 'package:todoapp/resources/color_manager.dart';
import 'package:todoapp/resources/font_manager.dart';
import 'package:todoapp/resources/routes_manager.dart';
import 'package:todoapp/resources/strings_manager.dart';
import 'package:todoapp/resources/style_manager.dart';
import 'package:todoapp/resources/value_manager.dart';

import 'package:todoapp/ui/login/login_provider.dart';
import 'package:todoapp/ui/widgets/loader.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginProvider loginProvider;

  @override
  initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.initializeFirebase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.todoBackground,
      body: SafeArea(child: FutureBuilder(
          //future: loginProvider.initializeFirebase(),
          builder: (context, snapshot) {
        if (snapshot.hasData == true) {
          return Container();
          // ChangeNotifierProvider<LobbyProvider>(
          //     create: (context) => LobbyProvider(), child: LobbyPage());
        }
        return Consumer<LoginProvider>(builder: (context, provider, child) {
          return Stack(
            children: [
              SingleChildScrollView(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
                child: SizedBox(
                  height: (MediaQuery.of(context).size.height),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: AppSize.s150,
                        child: Image.asset(
                          ImageAssets.loginLogo,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p20, top: AppPadding.p25),
                        child: Text(
                          AppStrings.loginTitle,
                          style: getBoldStyle(
                              fontSize: FontSizes.s30,
                              color: ColorManager.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        style: getSemiBoldStyle(
                            fontSize: FontSizes.s16,
                            color: ColorManager.textColor),
                        decoration: InputDecoration(
                          hintText: "Email",
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white24), //<-- SEE HERE
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          errorText: loginProvider.email.error,
                          errorStyle: TextStyle(
                              color: ColorManager.error,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                        ),
                        onChanged: (val) {
                          provider.changeEmail(val);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        style: getSemiBoldStyle(
                            fontSize: FontSizes.s16,
                            color: ColorManager.textColor),
                        decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.white24), //<-- SEE HERE
                          ),
                          hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                          errorText: loginProvider.password.error,
                          errorStyle: TextStyle(
                              color: ColorManager.error,
                              fontSize: FontSizes.s14,
                              fontFamily: FontConstants.fontFamily,
                              fontWeight: FontWeightManager.regular),
                        ),
                        onChanged: (val) {
                          provider.changePassword(val);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: AppPadding.p0, top: AppPadding.p20),
                        child: SizedBox(
                            width: double.maxFinite,
                            height: AppSize.s50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.buttonColor,
                                  shadowColor: Colors.black,
                                  elevation: 20,
                                ),
                                onPressed: () async {
                                  if (loginProvider.isValid) {
                                    if (await provider
                                            .loginWithEmailAndPassword() !=
                                        null) {
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(
                                        context,
                                        Routes.lobbyRoute,
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  "Login".toUpperCase(),
                                  style: getBoldStyle(
                                      color: ColorManager.primary,
                                      fontSize: FontSizes.s17),
                                ))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          text: TextSpan(
                        text: " Don't have a account? ",
                        style: TextStyle(
                            color: ColorManager.lightGrey,
                            fontSize: 18,
                            fontWeight: FontWeight.normal),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Sign Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.signInRoute,
                                  );
                                },
                              style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                          child: Container(
                              width: double.maxFinite,
                              height: AppSize.s50,
                              color: Colors.white,
                              margin: const EdgeInsets.only(top: 25),
                              child: Center(
                                  child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 30.0,
                                    width: 30.0,
                                    decoration: const BoxDecoration(
                                      // color: ColorManager.error,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImageAssets.googleLogo),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager.black),
                                  ),
                                ],
                              ))),
                          onTap: () async {
                            if (await provider.googleLogin() != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamed(
                                context,
                                Routes.lobbyRoute,
                              );
                            }
                          }),
                    ],
                  ),
                ),
              )),
              provider.isLoading ? const LoaderPage() : Container(),
            ],
          );
        });
      })),
    );
  }
}
