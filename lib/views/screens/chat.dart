import 'package:imthon3/utils/main_util.dart';

class Chat extends StatelessWidget {
  final UsersModel users;
  const Chat({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UsersTile(image: users.image, name: users.name),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call_outlined)),
        ],
      ),
      body: Column(children: [Expanded(child: Center(child: Text("data")))]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Write a message...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.send, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.mic, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
