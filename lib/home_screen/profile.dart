import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_paw_care/const/color_padding.dart';

//Tab Profile
class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  //default option
  String text = 'Semua Riwayat';
  final int _i = 1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          //bagian profile
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
                color: primary_color,
                padding: EdgeInsets.symmetric(
                    horizontal: MarginHorizontal,
                    vertical: MarginVertical - 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                        ),
                        Text(
                          'Nama',
                          style: TextStyle(
                              fontSize: Appbar_font_size,
                              color: textcolorwhite),
                        ),
                        Text(
                          'No HP',
                          style: TextStyle(
                              fontSize: Appbar_font_size - 5,
                              color: textcolorwhite),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EditProfile()));
                          },
                          alignment: Alignment.centerRight,
                        ),
                      ],
                    )
                  ],
                )),
          ),

          //bagian option button
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: MarginHorizontal),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.list),
                    label: Text(text),
                    onPressed: () async {
                      text = await _asyncSimpleDialog(context);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                  )
                ],
              ),
            ),
          ),

          //bagian history list (tested)
          _i == 0
              //jika history ada isinya
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.check,
                        color: primary_color,
                        size: MediaQuery.of(context).size.width * 0.4,
                      ),
                      Text(
                        'Ada isinya',
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                )
              :
              // jika history tidak ada isinya
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: primary_color,
                        size: MediaQuery.of(context).size.width * 0.4,
                      ),
                      Text(
                        'History Pesan Kamu Kosong',
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }
}

//optionbutton di profile
Future _asyncSimpleDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: [
            SimpleDialogOption(
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.pop(context, 'Semua Riwayat');
              },
              child: const Text(
                'Semua Riwayat',
                textAlign: TextAlign.center,
              ),
            ),
            SimpleDialogOption(
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.pop(context, 'Pesanan Obat');
              },
              child: const Text(
                'Pesanan Obat',
                textAlign: TextAlign.center,
              ),
            ),
            SimpleDialogOption(
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.pop(context, 'Konsultasi');
              },
              child: const Text(
                'Konsultasi',
                textAlign: TextAlign.center,
              ),
            ),
            SimpleDialogOption(
              padding: EdgeInsets.symmetric(vertical: 10),
              onPressed: () {
                Navigator.pop(context, 'Test Lab');
              },
              child: const Text(
                'Test Lab',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      });
}


//Tab edit profile
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  //generate jenis kelamin (nunutk dropdown list)
  JenisKelamin selectedjeniskelamin;
  List<JenisKelamin> jeniskelamins = [
    JenisKelamin('Laki - laki'),
    JenisKelamin('Perempuan'),
  ];

  List<DropdownMenuItem> jeniskelaminitems(List<JenisKelamin> jeniskelamin) {
    List<DropdownMenuItem> items = [];
    for (var item in jeniskelamins) {
      items.add(DropdownMenuItem(
        child: Text(item.jeniskelamin),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lengkapi Profile Kamu'),
      ),
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.18,
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blueGrey),
                ),
              )),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: MarginHorizontal),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    inputtext(
                        prefixicon: Icon(Icons.person),
                        hintText: 'Nama Lengkap',
                        linetext: 1),
                    SizedBox(
                      height: 5,
                    ),
                    inputtext(
                        prefixicon: Icon(Icons.date_range),
                        hintText: 'Tanggal Lahir',
                        linetext: 1),
                    SizedBox(
                      height: 5,
                    ),
                    inputtext(
                        prefixicon: Icon(Icons.phone),
                        hintText: 'Nomor Ponsel',
                        linetext: 1),
                    SizedBox(
                      height: 5,
                    ),
                    //dropdown jenis kelamin
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Jenis kelamin : ',
                            style: TextStyle(fontSize: Body_font_size),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 200,
                            child: DropdownButton(
                              isExpanded: true,
                              value: selectedjeniskelamin,
                              items: jeniskelaminitems(jeniskelamins),
                              onChanged: (item) {
                                setState(() {
                                  selectedjeniskelamin = item;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    inputtext(
                        prefixicon: Icon(Icons.mail_rounded),
                        hintText: 'Email',
                        linetext: 1),
                    SizedBox(
                      height: 5,
                    ),
                    inputtext(
                        prefixicon: null,
                        hintText: 'Tentang pengguna',
                        linetext: 9),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              child: Text('Simpan'),
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

//input textfield
  TextField inputtext({Icon prefixicon, String hintText, int linetext}) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: prefixicon,
          hintText: hintText,
          prefixStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
      maxLines: linetext,
    );
  }
}

//class jenis kelamin
class JenisKelamin {
  String jeniskelamin;
  JenisKelamin(this.jeniskelamin);
}