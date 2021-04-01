class Dokter {
  final String name, specialist, phonenumber, location, image;

  Dokter({
    this.name,
    this.specialist,
    this.phonenumber,
    this.location,
    this.image,
  });
}

List<Dokter> dokters = [
  Dokter(
      name: 'Jamaludin',
      specialist: 'Dokter Anjing',
      phonenumber: '08534551281',
      location: 'GG.Teyvat',
      image: 'assets/images/dokter/face1.jpg'),
  Dokter(
      name: 'Carl',
      specialist: 'Dokter Kucing',
      phonenumber: '08534551101',
      location: 'GG.Liyue',
      image: 'assets/images/dokter/face2.jpg'),
  Dokter(
      name: 'Katherine',
      specialist: 'Dokter hewan Umum',
      phonenumber: '99201822',
      location: 'GG.Coastline',
      image: 'assets/images/dokter/face3.jpg'),
  Dokter(
      name: 'Nina',
      specialist: 'Dokter hewan umum',
      phonenumber: '9910287',
      location: 'Oregon',
      image: 'assets/images/dokter/face4.jpg'),
];
