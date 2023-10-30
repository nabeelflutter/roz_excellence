import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rose_excellence_admin_panel_web1/routes/pages/pages.dart';
import 'package:rose_excellence_admin_panel_web1/view/widget/textfields.dart';
import 'package:rose_excellence_admin_panel_web1/view_model/login_bloc/login_bloc.dart';
import 'package:provider/provider.dart';
import '../../constants/constants.dart';
import '../validation/validation.dart';
import 'buttons.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.text})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    final emailAndPasswordProvider = Provider.of<LoginBloc>(context);
    // Bloc loginBloc = context.read<LoginScreenBloc>();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passController = TextEditingController();
    bool obscureText = true;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
      child: Stack(

        children: <Widget>[
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                  left: Constants.padding,
                  top: Constants.avatarRadius + Constants.padding,
                  right: Constants.padding,
                  bottom: Constants.padding),
              margin: const EdgeInsets.only(top: Constants.avatarRadius),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Constants.padding),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        //padding: EdgeInsets.only(left: 15),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              color: Constants.darkPink, fontSize: 25),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextField(
                          readOnly: false,
                          validator: (value) {
                        return FieldValidator.validateEmail(value);
                      },
                          textEditingController: _emailController,
                          textColor: Colors.black,
                          MediaQuery.of(context).size.width,
                          'Username or Email'),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                          readOnly: false,
                          validator: (value) {
                        return FieldValidator.validatePassword(value);
                      },
                          isObscure: obscureText,
                          textEditingController: _passController,
                          suffix: InkWell(
                              onTap: () {
                                if (obscureText == false) {
                                } else {}
                              },
                              child: const Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey,
                              )),
                          textColor: Colors.black,
                          MediaQuery.of(context).size.width,
                          'Password'),
                      const SizedBox(
                        height: 20,
                      ),
                      LoginOrSignUpPageButton(
                          function: () {
                            if(formKey.currentState!.validate()){
                              emailAndPasswordProvider.add(LoginClickEvent(email: _emailController.text.toString(), password: _passController.text.toString()));
                            }
                          },
                          width: MediaQuery.of(context).size.width,
                          color: Constants.darkPink,
                          height: 40,
                          buttonText: 'Login',
                          textColor: Colors.white,
                          borderColor: Constants.darkPink,
                          backgroundColor: Constants.darkPink),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(Constants.avatarRadius)),
                  child: Image.asset('assets/images/m_logo.png')),
            ),
          ),
          BlocConsumer<LoginBloc,LoginState>(builder: (context, state) {
            if(state is LoginScreenLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            return SizedBox();
          }, listener: (context, state) {
            if(state is LoginScreenLoadedState){
              Navigator.pushNamed(context, PageName.homeScreenBehaviour);
            }
            if(state is LoginScreenErrorState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error.toString())));
            }
          },)
        ],
      ),
    );
  }
}
