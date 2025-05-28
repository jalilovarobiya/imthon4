import 'package:imthon3/utils/main_util.dart';

class ChatList extends StatelessWidget {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = UsersViewmodels();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Chat"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
      ),
      body: FutureBuilder<List<UsersModel>>(
        future: viewModel.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Xatolik: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Foydalanuvchilar topilmadi'));
          }
          final users = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 20),
                      Text("Search here."),
                      Spacer(),
                      Icon(Icons.mic),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    itemCount: users.length,
                    itemBuilder: (ctx, index) {
                      final user = users[index];

                      return UsersTile(
                        image: user.image,
                        name: user.name,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Chat(users: user),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// class ChatList extends StatelessWidget {
//   const ChatList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
//             child: Text(
//               "Message",
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey,
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                     offset: Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     width: 300,
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 15),
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           hintText: "Search",
//                           border: InputBorder.none,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Icon(Icons.search),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: const Color.fromARGB(255, 16, 59, 93),
//         child: IconButton(
//           onPressed: () {},
//           icon: Icon(Icons.message, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }
