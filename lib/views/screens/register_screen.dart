import 'package:imthon3/utils/main_util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final AuthViewmodel authviewmodel;
  final _myKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _passwordConfirmation = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    authviewmodel = context.read<AuthViewmodel>();
  }

  void _submit() async {
    if (_myKey.currentState!.validate()) {
      final email = _email.text;
      final password = _password.text;

      try {
        await authviewmodel.register(password: password, email: email);

        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return MainScreen();
              },
            ),
          );
        }
      } catch (e) {
        final error = e.toString();
        String message = error;
        if (error.contains("EMAIL_EXISTS")) {
          message = "Bunday email oldn ro'yxatdan o'tgan";
        } else if (error.contains("TOO_MANY_ATTEMPTS_TRY_LATER")) {
          message = "Ko'p urunish, iltmos keynroq urnb koring";
        } else {
          print(e);
        }
        if (mounted) {
          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        }
      }
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _passwordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _myKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create your new account",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
              ),
              Text("Create an account to start looking for the food you like"),
              30.height,
              Text("Email Address"),
              10.height,
              MyFormKey(
                controller: _email,
                hintText: "Email kiriting",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Iltimos email kiriting";
                  }
                  if (!value.contains("@")) {
                    return "Iltimos to'g'ri email kiriting";
                  }
                  return null;
                },
              ),
              10.height,
              Text("User Name"),
              10.height,
              MyFormKey(
                controller: _password,
                hideText: true,
                hintText: "Parol kiriting",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Iltimos email kiriting";
                  }
                  if (value.length < 6) {
                    return "Parolda 6ta va undan ko'p elementlar bo'lishi shart";
                  }
                  return null;
                },
              ),
              10.height,
              Text("Password"),
              10.height,
              MyFormKey(
                controller: _passwordConfirmation,
                hideText: true,
                hintText: "Parolingizni qayta kiriting",
                validator: (value) {
                  if (value != _password.text) {
                    return "Parollar mos kelmadi";
                  }
                  return null;
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Kirish",
                  style: TextStyle(fontSize: 20, color: Appcolors.appOrange),
                ),
              ),
              AppButton.appTextButton(
                contex: context,
                text: "Forgot password?",
                screen: ForgetPassword(),
                color: Appcolors.appOrange,
              ),
              20.height,
              AppButton.orangeBotton(
                text: "Ro'yxatdan o'tish",
                onprassed: _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
