import 'package:imthon3/utils/main_util.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              Text(
                "Your new password must be different from the previously used password",
              ),
              30.height,
              Text("New Password"),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Text("Must be at least 8 character"),
              20.height,
              Text("Confirm Password"),
              TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              ),
              Text("Both password must match"),
              Spacer(),
              AppButton.orangeBotton(
                text: "Continue",
                onprassed: () {
                  AppButtomsheet.showSuccessSheet(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
