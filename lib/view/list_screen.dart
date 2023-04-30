import 'package:flutter/material.dart';

import '../model/list/pc_model.dart';
import '../model/list/phone_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ListTotal> totalList = [];

  @override
  Widget build(BuildContext context) {
    //Toplam listesine pc listesindeki değişkenleri atadık.
    totalList = pc
        .map((e) => ListTotal(
            name: e.name,
            image: e.image,
            color: e.color,
            price: e.price,
            properties: e.properties))
        .toList();
//phones listesinden alınan değişkeni totalList listesine ekleriz.
    for (var i in phones) {
      totalList.add(ListTotal(
          name: i.name,
          image: i.image,
          color: i.color,
          price: i.price,
          properties: i.properties));
    }
    //toplam listenin elemanlarının büyükten küçüğe doğru sıralanması sağlandı.
    totalList.sort(
      (a, b) => b.price.compareTo(a.price),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 230, 241, 165),
        title: const Text('Liste İşlemleri'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 170,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: totalList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 290,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          children: [
                            Image.network(
                              totalList[index].image,
                              width: 100,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Model:${totalList[index].name}'),
                                Text('Renk:${totalList[index].color}',
                                ),
                                Text(
                                  'Fiyat:${totalList[index].price}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: totalList[index].price < 10
                                          ? Colors.green
                                          : totalList[index].price > 20
                                              ? Colors.red
                                              : Colors.yellow),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: phones.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  phones[index].image,
                                )),
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(20)),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            phones[index].name,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                backgroundColor: Colors.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            buildpcText(),
            Container(
              height: 340,
              child: ListView.builder(
                  itemCount: pc.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20)),
                          child: ListTile(
                            leading: Image.network(pc[index].image),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(pc[index].name),
                                Wrap(
                                  children: [
                                    Text(
                                      pc[index].properties,
                                      style: const TextStyle(fontSize: 8),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            trailing: Container(
                              height: 30,
                              width: 60,
                              decoration: BoxDecoration(
                                  color: pc[index].price >= 20
                                      ? Colors.red
                                      : pc[index].price < 10
                                          ? Colors.green
                                          : Colors.yellow,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(pc[index].price.toString())),
                            ),
                          ),
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }

  List<Phone> phones = [
    Phone(
        image:
            'https://m.media-amazon.com/images/I/71kZfQA-Y7L._AC._SR360,460.jpg',
        name: 'İphone 11(128Gb)',
        properties:
            '6.1 inç Liquid Retina HD LCD ekran Suya ve toza dayanıklılık (30 dakikaya kadar maksimum 2 metre derinlik, IP68)',
        color: 'Beyaz',
        price: 17.723),
    Phone(
        image:
            'https://m.media-amazon.com/images/I/71ZiSXOdnhL._AC._SR360,460.jpg',
        name: 'İphone 13',
        properties:
            '12 MP Geniş ve Ultra Geniş kameralara sahip gelişmiş çift kamera sistemi; Fotoğrafik Stiller, Akıllı HDR 4, Gece modu, 4K Dolby Vision HDR kayıt',
        color: 'Mavi',
        price: 27.570),
    Phone(
        image:
            'https://m.media-amazon.com/images/I/91dplUBhwtL._AC._SR360,460.jpg',
        name: 'Xiaomi POCO 5',
        properties:
            '12 MP Geniş ve Ultra Geniş kameralara sahip gelişmiş çift kamera sistemi; Fotoğrafik Stiller, Akıllı HDR 4, Gece modu, 4K Dolby Vision HDR kayıt',
        color: 'Siyah',
        price: 11.169),
    Phone(
        image:
            'https://m.media-amazon.com/images/I/91-HXU8eS3L._AC._SR360,460.jpg',
        name: 'Samsung Galaxy A04',
        properties:
            '12 MP Geniş ve Ultra Geniş kameralara sahip gelişmiş çift kamera sistemi; Fotoğrafik Stiller, Akıllı HDR 4, Gece modu, 4K Dolby Vision HDR kayıt',
        color: 'Mavi',
        price: 4.339),
  ];

  List<Computer> pc = [
    Computer(
        image: 'https://m.media-amazon.com/images/I/51C5T66X03L._AC_UL400_.jpg',
        name: 'ASUS ZenBook',
        properties:
            'ASUS Zenbook 13 OLED UX325EA-KG654W i7-1165G7 16GB 1TB SSD 13.3 FHD Windows 11',
        color: 'Gri',
        price: 23.999),
    Computer(
        image: 'https://m.media-amazon.com/images/I/61ZE-CQMu9L._AC_UL400_.jpg',
        name: 'Monster HUMA',
        properties:
            'Monster Huma H4 V5.1.8 Intel Core i5-1235U 16GB RAM 512GB SSD Windows 11 14,1" FHD Rose Gold',
        color: 'Pembe',
        price: 16.199),
    Computer(
        image: 'https://m.media-amazon.com/images/I/71dP-vXWsdL._AC_UL400_.jpg',
        name: 'HP Victus',
        properties:
            'HP Victus 16 Dizüstü Bilgisayar, 16,1 inç FHD IPS 144 Hz, AMD Ryzen 5 5600H, 16 GB Ram, NVIDIA GeForce RTX 3050 TI, FreeDos, 512 GB SSD, Performans Mavisi, 54S65EA',
        color: 'Gri',
        price: 23.000),
    Computer(
        image: 'https://m.media-amazon.com/images/I/61ss8Rbf82L._AC_UL400_.jpg',
        name: 'LENOVA İdeaPed',
        properties:
            'Lenovo IdeaPad 5 Pro Dizüstü Bilgisayar, 16" 2.5K WQXGA, AMD Ryzen 7 5800H, 16GB RAM, 512GB SSD, NVIDIA GeForce RTX 3050 4GB, FreeDOS, 82L5007HTX',
        color: 'Gri',
        price: 9.000),
  ];

  Widget buildpcText() {
    return Container(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'Dizüstü Bilgisayarlar'.toUpperCase(),
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 3),
          ),
        ));
  }
}

class ListTotal {
  String image;
  String name;
  String properties;
  String color;
  double price;
  ListTotal(
      {required this.name,
      required this.image,
      required this.color,
      required this.price,
      required this.properties});
}
