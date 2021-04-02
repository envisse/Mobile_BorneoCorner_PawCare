import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:flutter_paw_care/data_handler/petshop_and_care.dart';
import 'package:flutter_paw_care/data_handler/produt_list.dart';
import 'grooming_and_styling.dart';

//Tab petshop and care
class PetshopCare extends StatefulWidget {
  @override
  _PetshopCareState createState() => _PetshopCareState();
}

class _PetshopCareState extends State<PetshopCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetShop & Care'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: petshops.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MarginHorizontal, vertical: 10),
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                //informasi dokter
                ListTile(
                  leading: ConstrainedBox(
                    constraints: BoxConstraints(
                        minWidth: 90,
                        minHeight: 100,
                        maxWidth: 90,
                        maxHeight: 110),
                    child: Image.asset(
                      petshops[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    petshops[index].name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(petshops[index].alamat,
                          style: TextStyle(fontSize: 17))),
                  trailing: GestureDetector(
                    child: Container(
                      height: double.infinity,
                      child: Icon(
                        Icons.chevron_right_outlined,
                        color: primary_color,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetShopDetail(
                                    petshop: petshops[index],
                                  )));
                    },
                  ),
                ),
                //button whatsapp and location
              ],
            ),
          );
        },
      ),
    );
  }
}

//Tab Petshop detail
class PetShopDetail extends StatelessWidget {
  final PetShop petshop;

  PetShopDetail({this.petshop});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PetShop & Care'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(Icons.search),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          //bagian atas (image , nama , button)
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            color: primary_color,
            padding: EdgeInsets.symmetric(horizontal: MarginHorizontal + 10),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: Container(
                    height: MediaQuery.of(context).size.width * 0.30,
                    child: Image.asset(
                      petshop.image,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.05,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        petshop.name,
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            child: Text('Grooming'),
                            onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context) => GroomingStyling()));},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade600,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                          ),
                          ElevatedButton(
                            child: Text('Penitipan'),
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue.shade600,
                              onPrimary: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0)),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          //category
          Container(
            decoration: BoxDecoration(color: Colors.white),
            height: MediaQuery.of(context).size.height * 0.08,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                category(
                    icon: Icons.ac_unit, function: null, label: 'Pet Food'),
                category(
                    icon: Icons.local_pizza,
                    function: null,
                    label: 'Pet LItter'),
                category(
                    icon: Icons.healing,
                    function: null,
                    label: 'Healing and Healt'),
                category(
                    icon: Icons.toll_outlined,
                    function: null,
                    label: 'accessories'),
              ],
            ),
          ),
          //list barang
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MarginHorizontal + 10),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MarginHorizontal + 5,
                  mainAxisSpacing: MarginVertical,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => Itemcards(
                  product: products[index],
                  function: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailProduct(
                                product: products[index],
                              ))),
                ),
              ),
            ),
          ),
        ],
      ),
      //background color
      backgroundColor: Colors.grey.shade200,
    );
  }

  Container category({IconData icon, Function function, String label}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: TextButton.icon(
        label: Text(
          label,
          style: TextStyle(color: Colors.black),
        ),
        icon: Icon(
          icon,
          color: primary_color,
        ),
        onPressed: function,
      ),
    );
  }
}

class Itemcards extends StatelessWidget {
  final Product product;
  final Function function;

  const Itemcards({Key key, this.product, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(product.name), Text(product.price)],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(3.0, 3.0),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                  color: Colors.black12),
            ]),
      ),
    );
  }
}

//Tab Product
class DetailProduct extends StatelessWidget {
  final Product product;
  DetailProduct({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Barang'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //product image
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  product.image,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          //Product price and name
          Container(
            margin: EdgeInsets.symmetric(
                vertical: MarginVertical, horizontal: MarginHorizontal),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                SizedBox(
                  height: 5,
                ),
                Text('Rp. ${product.price}',
                    style: Theme.of(context).textTheme.headline6.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.black54)),
              ],
            ),
          ),
          //detail product
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MarginHorizontal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Detail Produk',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.black54)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    product.desc,
                  )
                ],
              ),
            ),
          ),

          //button add cart and amount
          SizedBox(
            height: 50,
            width: double.infinity,
            child: AddtoCart(),
          )
        ],
      ),
    );
  }
}

class AddtoCart extends StatefulWidget {
  @override
  _AddtoCartState createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary_color,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.white,
                  onPressed: () {
                    (counter != 0) ? (counter--) : null;
                    setState(() {});
                  },
                ),
                Text(counter.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Body_font_size,
                        color: Colors.white)),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.white,
                  onPressed: () {
                    counter++;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: double.infinity,
            child: ElevatedButton(
              child: Text(
                'Add To Cart',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Body_font_size),
              ),
              onPressed: () {
                print('you click me');
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0))),
            ),
          )
        ],
      ),
    );
  }
}
