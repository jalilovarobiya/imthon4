import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:imthon3/utils/main_util.dart';
import 'package:imthon3/views/widgets/category_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productVM = ProductViewModel();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Text("Your Location", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white, size: 35),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  AppImages.wallpaper,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 100,
                  left: 20,
                  right: 20,
                  child: Text(
                    "Provide the best food for you",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Find by Category"),
                      Text(
                        "See All",
                        style: TextStyle(color: Appcolors.appOrange),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CatergoryWidget(
                        icon: Icon(FontAwesomeIcons.burger),
                        name: "Burger",
                        color: const Color.fromARGB(255, 130, 182, 225),
                      ),
                      CatergoryWidget(
                        icon: Icon(FontAwesomeIcons.pizzaSlice),
                        name: "Pizza",
                        color: const Color.fromARGB(255, 132, 184, 227),
                      ),
                      CatergoryWidget(
                        icon: Icon(Icons.local_cafe),
                        color: const Color.fromARGB(255, 223, 187, 132),
                        name: "Drinks",
                      ),
                      CatergoryWidget(
                        icon: Icon(FontAwesomeIcons.hotdog),
                        name: "Hot dog",
                        color: const Color.fromARGB(255, 230, 135, 128),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            FutureBuilder<List<ProductModel>>(
              future: productVM.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }

                final products = snapshot.data ?? [];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children:
                          products
                              .map((product) => ProductWidget(product: product))
                              .toList(),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
