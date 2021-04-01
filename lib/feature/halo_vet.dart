import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:flutter_paw_care/data_handler/dokter.dart';

class HaloVet extends StatefulWidget {
  @override
  _HaloVetState createState() => _HaloVetState();
}

class _HaloVetState extends State<HaloVet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HaloVet'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                print('you hit search');
              },
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: dokters.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: MarginHorizontal, vertical: 10),
            padding: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(3.0, 3.0),
                      blurRadius: 10.0,
                      spreadRadius: 2.0,
                      color: Colors.black12),
                ]),
            child: Column(
              children: [
                //informasi dokter
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(dokters[index].image),
                    radius: 30,
                  ),
                  title: Text(dokters[index].name),
                  subtitle: Text(dokters[index].specialist),
                ),
                //button whatsapp and location
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      icon: Icon(Icons.phone),
                      label: Text(
                        'Whatsapp',
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        print('whatsapp button');
                      },
                    ),
                    TextButton.icon(
                      icon: Icon(
                        Icons.location_pin,
                        color: primary_color,
                      ),
                      label: Text(
                        'Lokasi',
                        style: TextStyle(color: Colors.black38),
                      ),
                      onPressed: () {
                        print('location button');
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.grey.shade200,
    );
  }
}
