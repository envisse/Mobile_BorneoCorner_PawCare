import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:flutter_paw_care/home_screen/home_Screen.dart';

//PAGE Verification_Phone_Number (PAGE 6)
//menggunakan statful widget untuk verifikasi textfield jika kosong
class InsertPhoneNumber extends StatefulWidget {
  @override
  _InsertPhoneNumberState createState() => _InsertPhoneNumberState();
}

class _InsertPhoneNumberState extends State<InsertPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mulai',
          style: TextStyle(
              color: primary_color,
              fontWeight: FontWeight.bold,
              fontSize: Appbar_font_size),
        ),
        backgroundColor: bgcolorAppbar,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MarginVertical * 1.5),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: MarginHorizontal),
            child: Column(
              children: [
                Text(
                  'Masukkan nomor ponselmu,untuk menikmati layanan dari Radhiyah Pethsop and Care',
                  style: TextStyle(
                      color: primary_color, fontSize: Content_font_size),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: MarginVertical * 2,
                ),
                //textfield_section
                Container(
                  child: TextField(
                    
                    decoration: InputDecoration(
                        hintText: 'Nomor HP',
                        prefixIcon: Icon(Icons.phone),
                        // prefixText: '+62    ',
                        prefixStyle: TextStyle(color:Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
                  ),
                ),
                SizedBox(
                  height: MarginVertical,
                ),
                //button section
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40,
                      child: ElevatedButton(
                        //action jika di press
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InsertOTPNumber()));
                        },
                        child: Text('Lanjut'),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

//PAGE Verification_OTP_Code (PAGE 7)
class InsertOTPNumber extends StatefulWidget {
  @override
  _InsertOTPNumberState createState() => _InsertOTPNumberState();
}

class _InsertOTPNumberState extends State<InsertOTPNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Verifikasi',
          style: TextStyle(
              color: primary_color,
              fontWeight: FontWeight.bold,
              fontSize: Appbar_font_size),
        ),
        //remove back button leading if previous navigator is push method
        automaticallyImplyLeading: false,
        backgroundColor: bgcolorAppbar,
      ),
      body: Container(
        margin: EdgeInsets.only(top: MarginVertical * 1.5),
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: MarginHorizontal),
            child: Column(
              children: [
                Text(
                  'Masukkan kode OTP yang telah kami kirim ke HP-mu',
                  style: TextStyle(
                      color: primary_color, fontSize: Content_font_size),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: MarginVertical * 2,
                ),
                //textfield_section
                Container(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Masukkan kode OTP',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15)),
                  ),
                ),
                SizedBox(
                  height: MarginVertical,
                ),
                //button section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40,
                      child: Theme(
                        data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                        ),
                        //flatbutton
                        child: FlatButton(
                          //action jika di press
                          onPressed: () {
                            print('pressed');
                          },
                          child: Text(
                            'kirim Ulang',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          disabledTextColor: disablebutton,
                          textColor: primary_color,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: 40,
                      child: ElevatedButton(
                        //semua route pada verifikasi di remove
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LocationConfirmation()),
                              (route) => false);
                        },
                        child: Text('Verifikasi'),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}

//PAGE Location_Confirmation (PAGE 8)
class LocationConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aktifkan Lokasi',
          style: TextStyle(
              color: primary_color,
              fontWeight: FontWeight.bold,
              fontSize: Appbar_font_size),
        ),
        backgroundColor: bgcolorAppbar,
      ),
      body: Container(
        margin: EdgeInsets.only(
            left: MarginHorizontal,
            right: MarginHorizontal,
            top: MarginVertical * 3,
            bottom: MarginVertical),
        child: Column(
          children: [
            Icon(
              Icons.pin_drop,
              color: primary_color,
              size: 200.0,
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              'Kami membutuhkan Lokasi untuk menampilkan produk yang tersedia disekitar kamu',
              style:
                  TextStyle(color: textcolorblack, fontSize: Content_font_size),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.60,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      child: Text('AKTIFKAN LOKASI',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: 5),
                  Theme(
                    data: ThemeData(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent),
                    child: FlatButton(
                      onPressed: () {Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()),
                        );},
                      child: Text(
                        'LEWATI',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textColor: primary_color,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
