class Article {
  final String image, title, description, tanggal, namapenulis;
  final int index;

  Article(
      {this.index,
      this.image,
      this.title,
      this.description,
      this.tanggal,
      this.namapenulis});
}

List<Article> articles = [
  Article(
      namapenulis: 'Markonah',
      tanggal: '3 Januari',
      index: 1,
      image: 'assets/images/location.png',
      title: 'Article 1',
      description: dummyText),
  Article(
      namapenulis: 'Markonah',
      tanggal: '3 Januari',
      index: 2,
      image: 'assets/images/appreciation.png',
      title: 'Article 2',
      description: dummyText),
  Article(
      namapenulis: 'Markonah',
      tanggal: '10 Januari',
      index: 3,
      image: 'assets/images/metrics.png',
      title: 'Article 3',
      description: dummyText),
  Article(
      namapenulis: 'Markonah',
      tanggal: '12 Januari',
      index: 4,
      image: 'assets/images/nature.png',
      title: 'Article 4',
      description: dummyText),
  Article(
      namapenulis: 'Markonah',
      tanggal: '3 Januari',
      index: 5,
      image: 'assets/images/updates.png',
      title: 'Article 5',
      description: dummyText),
  Article(
      namapenulis: 'Markonah',
      tanggal: '3 Januari',
      index: 6,
      image: 'assets/images/workers.png',
      title: 'Article 6',
      description: dummyText),
  Article(
      namapenulis: 'Markonah',
      tanggal: '3 Januari',
      index: 7,
      image: 'assets/images/workers.png',
      title: 'Article 7',
      description: dummyText),
];
String dummyText =
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores cupiditate dolorem, fuga illo incidunt molestias nulla quam recusandae sunt temporibus. Assumenda iste nam obcaecati porro quod repellendus repudiandae temporibus ut.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Asperiores cupiditate dolorem, fuga illo incidunt molestias nulla quam recusandae sunt temporibus. Assumenda iste nam obcaecati porro quod repellendus repudiandae temporibus ut.";
