import 'package:imthon3/utils/main_util.dart';

class ProfileDitails extends StatelessWidget {
  const ProfileDitails({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text("Info"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ProfileEdit();
                  },
                ),
              );
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer<ChangePhotoViewmodel>(
                builder: (context, change, child) {
                  return CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        change.imgPath != null
                            ? FileImage(File(change.imgPath!))
                            : NetworkImage(
                              "https://unsplash.com/photos/gray-concrete-painted-wall-yI3weKNBRTc",
                            ),
                  );
                },
              ),
              20.height,
              Text("name"),
              50.height,
              Container(
                width: double.infinity,
                // height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color:
                      isDark
                          ? const Color.fromARGB(
                            255,
                            139,
                            181,
                            201,
                          ).withOpacity(0.1)
                          : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.4),

                      offset: Offset(0, 4),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "username".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text("user.name"),
                      15.height,
                      Text(
                        "phone".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text("user.phone"),
                      15.height,
                      Text(
                        "birthday".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      Text("user.phone"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
