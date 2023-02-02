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
import 'package:todoapp/ui/signup/signup_provider.dart';
import 'package:todoapp/ui/widgets/loader.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  //late SignInProvider signUpProvider;

  @override
  initState() {
   // signUpProvider = Provider.of<SignInProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.todoBackground,
      body: SafeArea(
          child: Consumer<SignInProvider>(builder: (context, provider, child) {
        return Stack(
          children: [
            SingleChildScrollView(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
              child: Container(
                color: ColorManager.todoBackground,
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
                        AppStrings.signUpTitle,
                        style: getBoldStyle(
                            fontSize: FontSizes.s30, color: ColorManager.white),
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
                        errorText: provider.email.error,
                        errorStyle: TextStyle(
                            color: ColorManager.error,
                            fontSize: FontSizes.s14,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular),
                        //hintStyle: getSemiBoldStyle(fontSize:FontSize.s20,color: ColorManager.primary),
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
                        //fillColor: Colors.red,
                        hintStyle: const TextStyle(
                            color: Colors.grey,
                            fontSize: FontSizes.s14,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular),
                        errorText: provider.password.error,
                        errorStyle: TextStyle(
                            color: ColorManager.error,
                            fontSize: FontSizes.s14,
                            fontFamily: FontConstants.fontFamily,
                            fontWeight: FontWeightManager.regular),
                        //hintStyle: getSemiBoldStyle(fontSize:FontSize.s20,color: ColorManager.primary),
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
                            ),
                            onPressed: () async {
                              if (provider.isValid) {
                                if (await provider
                                        .signInWithEmailAndPassword() !=
                                    null) {
                                  // ignore: use_build_context_synchronously
                                  Navigator.pushNamed(
                                    context,
                                    Routes.loginRoute,
                                  );
                                }
                              }
                            },
                            child: Text(
                              "Sign Up".toUpperCase(),
                              style: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: FontSizes.s17),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                      text: " Existing User ? ",
                      style: TextStyle(
                          color: ColorManager.lightGrey,
                          fontSize: 18,
                          fontWeight: FontWeight.normal),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login In",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.loginRoute,
                                );
                              },
                            style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    )),
                  ],
                ),
              ),
            )),
            provider.isLoading ? const LoaderPage() : Container(),
          ],
        );
      })),
    );
  }
}
