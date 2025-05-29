import 'package:imthon3/utils/main_util.dart';

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
      body: Column(
        children: [
          Image.asset(
            AppImages.wallpaper,
            width: double.infinity,
            fit: BoxFit.cover,
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
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Find by Category"),
                        Text(
                          "See All",
                          style: TextStyle(color: Appcolors.appOrange),
                        ),
                      ],
                    ),
                  ),
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
    );
  }
}
