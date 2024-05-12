import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_bag/features/loginPage/ui/loginPage.dart';
import 'package:shopping_bag/utils/textStyles.dart';

import '../bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterBloc registerBloc = RegisterBloc();
  @override
  void initState() {
    registerBloc.add(RegisterInitialEvent());
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController rePassController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case RegisterLoadedState:
            return Scaffold(
              body: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  margin: EdgeInsets.all(30),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Text(
                              "Join Active eCommerce",
                              style: MyTextStyles.PmainTitle,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Name",
                          style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                        ),
                        textFormField(
                          "sreejith",
                          nameController,
                          (name) => name!.length < 3
                              ? "Name should be at least 3 characters"
                              : null,
                        ),
                        Text(
                          "Email",
                          style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                        ),
                        textFormField(
                          "sreejithhkm@gmail.com",
                          emailController,
                          (email) =>
                              email!.isEmpty ? "Field can't be empty" : null,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "or Register with phone number",
                            style: MyTextStyles.PmainTitle.copyWith(
                                fontSize: 15, color: Colors.deepPurple),
                          ),
                        ),
                        Text(
                          "Password",
                          style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                        ),
                        textFormField(
                          "*******",
                          passController,
                          (pass) =>
                              pass!.isEmpty ? "Field can't be empty" : null,
                        ),
                        Text(
                          "Re-enter Password",
                          style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                        ),
                        textFormField(
                          "*******",
                          rePassController,
                          (rePass) =>
                              rePass!.isEmpty ? "Field can't be empty" : null,
                        ),
                        const SizedBox(height: 20),
                        button("Sign up", Colors.red.shade500, () {
                          if (formKey.currentState!.validate()) {
                            if (passController.value == rePassController.value) {
                              registerBloc.add(StoreDataEvent(
                                  name: nameController.text,
                                  email: emailController.text,
                                  password: passController.text));
                            }else{
                              print("error password");
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            LoginPage()));
                          }else{
                            print("failed");
                          }
                        }),
                        Center(child: text("Already have an account?")),
                        button("Login", Colors.yellow.shade800, () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        }),
                      ],
                    ),
                  ),
                ),
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }

  Widget textFormField(String hint, TextEditingController controller,
      String? Function(String?)? validate) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
        validator: validate,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        ),
      ),
    );
  }

  Widget button(String name, Color color, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color,
          ),
          child: Center(
            child: Text(
              name,
              style: MyTextStyles.PmainTitle.copyWith(
                  color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget text(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
      ),
    );
  }
}
