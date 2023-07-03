class Pharmacy {
  late String name;
  late String address;
  late String image;
  late int price;

  Pharmacy(
      {required this.name,
      required this.address,
      required this.image,
      required this.price});
}

List<Pharmacy> pharmacylist = [
  Pharmacy(
    name: 'Farma Pharmacy',
    address: '40m near Kok super market',
    price: 2500,
    image: 'assets/farma.png',
  ),
  Pharmacy(
    name: 'Sarwaran Pharmacy',
    address: 'Havalan near Majidi mall ',
    price: 2000,
    image: 'assets/sarwaran.png',
  ),
  Pharmacy(
    name: 'Nadwa Pharmacy',
    address: '40m near Kok super market',
    price: 3000,
    image: 'assets/nadwa.png',
  ),
];
