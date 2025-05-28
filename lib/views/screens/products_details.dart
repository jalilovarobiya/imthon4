import 'package:imthon3/utils/main_util.dart';

class ProductsDetails extends StatefulWidget {
  final ProductModel model;
  const ProductsDetails({super.key, required this.model});

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int son = 0;
  void qosh() {
    son++;
  }

  void ayr() {
    son--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.model.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Text(
              widget.model.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "\$  ${widget.model.price}",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Text(
              "Description",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.",
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    qosh();
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                  iconSize: 40,
                ),
                20.width,
                CircleAvatar(child: Text(son.toString()), radius: 25),
                20.width,
                IconButton(
                  onPressed: () {
                    ayr();
                    setState(() {});
                  },
                  icon: Icon(Icons.remove),
                  iconSize: 40,
                ),
                Spacer(),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) {
                          return Delivary();
                        },
                      ),
                    );
                  },
                  child: Text("Add to card"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
