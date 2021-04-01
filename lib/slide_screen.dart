import 'package:flutter/material.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:flutter_paw_care/verification.dart';

//SLIDE SCREEN PAGE (PAGE 2 - 5)
class SlideScreen extends StatefulWidget {
  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  int _currentpage = 0;
  PageController _controller = PageController();

  List _pages = [
    SliderPage(
      desc:
          'Terlalu Sibuk untuk ketemu dokter hewan untuk petmu ? Chat dan telelpon dokter hewanmukapan saja',
      title: 'Halo Vet',
    ),
    SliderPage(
      desc:
          'Layanan Klinik Radhiyan Pet Shop and Care yang bisa diakses 24 jam',
      title: 'Klinik',
    ),
    SliderPage(
      desc:
          'Layanan panggilan dokter hewan Radhiyan Pet and Care untuk keadaan darurat',
      title: 'Go Vet',
    ),
    SliderPage(
      desc:
          'Semua Transaksi dan Medical Record Petmu bersifat pribadi sehingga kami simpan dengan aman',
      title: 'Aman dan terpercaya',
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: _pages.length,
            onPageChanged: _onChanged,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pages.length, (int index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    height: 10,
                    width: (index == _currentpage) ? 30 : 10,
                    margin: EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: (index == _currentpage)
                          ? Colors.black
                          : Colors.black26,
                    ),
                  );
                }),
              ),
              //Raisedbutton deprecated (flutter docs) ganti ke Elevatedbutton
              ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: MarginHorizontal * 1.5, vertical: 20),
                  child: Text(
                    'MULAI SEKARANG',
                    style: TextStyle(),
                  ),
                ),
                //statement jika slidescreen blum diterakhir maka button di disable
                onPressed: (_currentpage == (_pages.length - 1))
                    ? //push-replace go to Page verification
                    () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InsertPhoneNumber()),
                        );
                      }
                    : null,
              ),
              SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SliderPage extends StatelessWidget {
  final String title;
  final String desc;

  const SliderPage({Key key, this.title, this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 100,
        margin: EdgeInsets.only(
            left: MarginHorizontal,
            right: MarginHorizontal,
            bottom: MarginVertical * 5,
            top: MarginVertical * 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 100,
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline5.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: Head_font_size,
                    color: primary_color),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: MarginHorizontal / 4),
              child: Text(
                desc,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: text_color_carousel),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
