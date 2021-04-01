import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_paw_care/const/color_padding.dart';
import 'package:flutter_paw_care/data_handler/artikel.dart';

class DetailArtikel extends StatelessWidget {
  final Article article;
  DetailArtikel({this.article});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            stretch: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                article.image,
                fit: BoxFit.cover,
              ),
              stretchModes: [
                StretchMode.zoomBackground,
                StretchMode.blurBackground
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MarginHorizontal, vertical: MarginVertical),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //title
                      Text(
                        article.title,
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            fontWeight: FontWeight.bold, color: primary_color),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //tanggal nama penulis
                      Text(
                        'Tanggal ${article.tanggal} -  Penulis oleh ${article.namapenulis}',
                        style: TextStyle(fontSize: Body_font_size,height: 1.5,fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //isi artikel
                      Text(article.description,
                          style: TextStyle(fontSize: Body_font_size,height: 1.5)),
                    ],
                  ),
                );
              },
              // jika listnya lebih dari 1
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
