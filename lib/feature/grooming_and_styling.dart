import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';

class GroomingStyling extends StatefulWidget {
  @override
  _GroomingStylingState createState() => _GroomingStylingState();
}

class _GroomingStylingState extends State<GroomingStyling>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grooming & Styling'),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              child: Text('Price list'),
            ),
            Tab(
              child: Text('Order Now'),
            )
          ],
          unselectedLabelColor: Colors.white,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.white),
          labelColor: primary_color,
        ),
        elevation: 0,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          //tab price list
          PriceListmingAndStyling(),
          //tab order now
          OrderNowGroomingAndStyling()
        ],
      ),
    );
  }
}

//tab order now
class OrderNowGroomingAndStyling extends StatefulWidget {
  @override
  _OrderNowGroomingAndStylingState createState() =>
      _OrderNowGroomingAndStylingState();
}

class _OrderNowGroomingAndStylingState
    extends State<OrderNowGroomingAndStyling> {
  List tanggal = ['Item 1', 'Item 2', 'Items '];
  List timelist = ['16 : 00', '19 : 00', '21 : 00'];
  String selectedtime, selecteddate;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: MarginHorizontal,
                  right: MarginHorizontal,
                  top: MarginVertical - 10),
              child: Column(
                children: [
                  dropdownwidget(
                      hint: 'Tanggal Booking',
                      items: tanggal,
                      selected: selecteddate,
                      changeselected: (item) {
                        setState(() {
                          selecteddate = item;
                        });
                      }),
                  SizedBox(
                    height: 10,
                  ),
                  dropdownwidget(
                      hint: 'Waktu Booking',
                      items: timelist,
                      selected: selectedtime,
                      changeselected: (item) {
                        setState(() {
                          selectedtime = item;
                        });
                      }),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print('yourpressit');
              },
              child: Text(
                'SELANJUTNYA',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Body_font_size),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0))),
            ),
          ),
        ],
      ),
    );
  }

  Container dropdownwidget(
      {String hint, List items, String selected, Function changeselected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: bordercolor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            hint: Text(hint),
            isExpanded: true,
            value: selected,
            items: items.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: changeselected),
      ),
    );
  }
}

//tab Price List
class PriceListmingAndStyling extends StatefulWidget {
  @override
  _PriceListmingAndStylingState createState() =>
      _PriceListmingAndStylingState();
}

class _PriceListmingAndStylingState extends State<PriceListmingAndStyling> {
  //list dropdown menu
  List negara = ['Item 1', 'Item 2', 'Items '];
  List provinsi = ['16 : 00', '19 : 00', '21 : 00'];
  List kota = ['16 : 00', '19 : 00', '21 : 00'];
  List jenishewan = ['16 : 00', '19 : 00', '21 : 00'];
  List berat = ['16 : 00', '19 : 00', '21 : 00'];
  List qty = ['16 : 00', '19 : 00', '21 : 00'];
  List fur = ['16 : 00', '19 : 00', '21 : 00'];

  //Selected item dropdown menu
  String selectednegara,
      selectedprovinsi,
      selectedkota,
      selectedjenishewan,
      selectedberat,
      selectedqty,
      selectedfur;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                  left: MarginHorizontal,
                  right: MarginHorizontal,
                  top: MarginVertical - 10),
              child: Column(
                children: [
                  dropdownwidget(
                      hint: 'Negara',
                      items: negara,
                      selected: selectednegara,
                      changeselected: (item) {
                        setState(() {
                          selectedprovinsi = item;
                        });
                      }),
                  paddingsizedbox(),
                  dropdownwidget(
                      hint: 'Provinsi',
                      items: provinsi,
                      selected: selectedprovinsi,
                      changeselected: (item) {
                        setState(() {
                          selectedprovinsi = item;
                        });
                      }),
                  paddingsizedbox(),
                  dropdownwidget(
                      hint: 'Kota / Kabupaten',
                      items: kota,
                      selected: selectedkota,
                      changeselected: (item) {
                        setState(() {
                          selectedkota = item;
                        });
                      }),
                  paddingsizedbox(),
                  //row jenis hewan qty
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: dropdownwidget(
                            hint: 'Jenis Hewan',
                            items: kota,
                            selected: selectedjenishewan,
                            changeselected: (item) {
                              setState(() {
                                selectedjenishewan = item;
                              });
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: dropdownwidget(
                            hint: 'Qty',
                            items: kota,
                            selected: selectedqty,
                            changeselected: (item) {
                              setState(() {
                                selectedqty = item;
                              });
                            }),
                      ),
                    ],
                  ),
                  paddingsizedbox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: dropdownwidget(
                            hint: 'Berat',
                            items: kota,
                            selected: selectedberat,
                            changeselected: (item) {
                              setState(() {
                                selectedberat = item;
                              });
                            }),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: dropdownwidget(
                            hint: 'Fur',
                            items: kota,
                            selected: selectedfur,
                            changeselected: (item) {
                              setState(() {
                                selectedfur = item;
                              });
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                print('yourpressit');
              },
              child: Text(
                'Order Sekarang',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: Body_font_size),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0))),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox paddingsizedbox() {
    return SizedBox(
      height: 10,
    );
  }

  Container dropdownwidget(
      {String hint, List items, String selected, Function changeselected}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: bordercolor)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            hint: Text(hint),
            isExpanded: true,
            value: selected,
            items: items.map((value) {
              return DropdownMenuItem(
                child: Text(value),
                value: value,
              );
            }).toList(),
            onChanged: changeselected),
      ),
    );
  }
}
