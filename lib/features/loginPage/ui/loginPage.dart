
import 'package:flutter/material.dart';
import 'package:shopping_bag/features/registerPage/ui/registerPage.dart';
import 'package:shopping_bag/utils/textStyles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
 Key formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      "Login Active eCommerce",
                      style: MyTextStyles.PmainTitle,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Email",
                  style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                ),
                textFormField("sreejithhkm@gmail.com", emailController,(email)=>email!.isEmpty?"field can't be empty":null),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Text("Forgot password",
                        style: MyTextStyles.PmainTitle.copyWith(
                            fontSize: 15, color: Colors.deepPurple))),
                Text(
                  "Password",
                  style: MyTextStyles.PmainTitle.copyWith(fontSize: 15),
                ),
                textFormField("******* ", emailController,(pass)=>pass!.isEmpty?"field can't be empty":null),
                const SizedBox(height: 20,),
                button("Login",Colors.yellow.shade800,(){


                }),
                Center(child: text("or create a new account")),
                button("Sign up", Colors.red.shade500,(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  RegisterPage()));
                }
              ),
                Center(child: text("Login with"))

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textFormField(String email, TextEditingController controller,String? Function(String?)?validate) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextFormField(
  validator:validate,
        controller: controller,
        decoration: InputDecoration(
          hintText: email,
          hintStyle:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
        ),
      ),
    );
  }

  button(String name,Color color,VoidCallback navigate) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: InkWell(
        onTap:navigate,
        child: Container(
          height: 50,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color
          ),
          child: Center(child: Text(name,
          style: MyTextStyles.PmainTitle.copyWith(color: Colors.white,
          fontSize: 20),)),
        ),
      ),
    );
  }

 Widget text(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(title,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w600
      ),),
    );
  }
}
