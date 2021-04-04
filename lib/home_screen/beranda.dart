import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:flutter_paw_care/data_handler/artikel.dart';
import 'package:flutter_paw_care/detail_artikel.dart';
import 'package:location/location.dart';

//feature import link
import 'package:flutter_paw_care/feature/halo_vet.dart';
import 'package:flutter_paw_care/feature/pet_shop_and_care.dart';
import 'package:flutter_paw_care/feature/cage_and_clean.dart';
import 'package:flutter_paw_care/feature/go_vet.dart';

//Tab Beranda
class BerandaTab extends StatefulWidget {
  @override
  _BerandaTabState createState() => _BerandaTabState();
}

class _BerandaTabState extends State<BerandaTab> {
  Location location = new Location();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //List MainMenu
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                //menubutton halo vet
                menubutton(
                    icon: Icons.home_repair_service,
                    navigator: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HaloVet()));
                    },
                    text: 'HaloVet'),
                //menubutton Cage & Clean
                menubutton(
                    icon: Icons.blur_linear_outlined,
                    navigator: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CageClean()));
                    },
                    text: 'Cage and Clean'),
                //menubutton Petshop & care
                menubutton(
                    icon: Icons.border_bottom_sharp,
                    navigator: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PetshopCare()));
                    },
                    text: 'Petshop and Care'),
                //menu button GoVet
                menubutton(
                  icon: Icons.games_sharp,
                  navigator: () {
                    location.requestPermission().then((permissionStatus) {
                      if (permissionStatus == PermissionStatus.granted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GoVet()));
                      }
                    });
                  },
                  text: 'GoVet',
                ),

                menubutton(
                    icon: Icons.edit_road,
                    navigator: null,
                    text: 'Petshop and Care'),
                menubutton(
                    icon: Icons.add_to_drive,
                    navigator: null,
                    text: 'Petshop and Care'),
              ],
            ),
          ),
          //List artikel
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: 80,
                          minHeight: 80,
                          maxWidth: 80,
                          maxHeight: 80),
                      child: Image.asset(
                        articles[index].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(articles[index].title),
                    subtitle: Text(
                      articles[index].description,
                      maxLines: 2,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DetailArtikel(article: articles[index])));
                    },
                  ),
                );
              },
              itemCount: articles.length,
            ),
          ),
        ],
      ),
    );
  }

//function untuk pilihan menu
  GestureDetector menubutton({IconData icon, Function navigator, String text}) {
    return GestureDetector(
      onTap: navigator,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: icon_color,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                height: 30,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                )),
          ],
        ),
        width: 100.0,
      ),
    );
  }
}
