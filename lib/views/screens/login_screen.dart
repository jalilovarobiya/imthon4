import 'package:imthon3/utils/main_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthViewmodel authviewmodel;
  final _myKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

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
        await authviewmodel.login(password: password, email: email);

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
        if (error.contains("INVALID_LOGIN_CREDENTIALS")) {
          message = "Email yoki parol xato";
        } else if (error.contains("TOO_MANY_ATTEMPTS_TRY_LATER")) {
          message = "Ko'p urunish, iltmos keynroq urnb koring";
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
                "Login to your account.",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
              ),
              Text("Please sign in to your account "),
              40.height,
              Text("Email Address"),
              10.height,
              MyFormKey(
                controller: _email,
                hintText: "Email",
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
              Text("Password"),
              10.height,
              MyFormKey(
                controller: _password,
                hideText: true,
                hintText: "Password",
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
              AppButton.appTextButton(
                contex: context,
                color: Appcolors.appOrange,
                text: "Ro'yxatdan o'tish",
                screen: RegisterScreen(),
              ),
              AppButton.appTextButton(
                contex: context,
                text: "Forgot password?",
                screen: ForgetPassword(),
                color: Appcolors.appOrange,
              ),
              20.height,
              AppButton.orangeBotton(text: "Sign In", onprassed: _submit),
            ],
          ),
        ),
      ),
    );
  }
}
