import 'package:flutter/material.dart';
import 'package:urlshortener/widgets/appbar.dart';

import '../widgets/popupmenuwidget.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Map<String, dynamic>> myList2 = [
    {
      'modal': 't-shirt',
      'mark': 'polo',
      'image': 'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
      'price': '176.50'
    },
    {
      'modal': 't-shirt',
      'mark': 'polo',
      'image': 'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
      'price': '144.00'
    },
    {
      'modal': 't-shirt',
      'mark': 'massimo dutti',
      'image': 'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
      'price': '120.50'
    },
    {
      'modal': 't-shirt',
      'mark': 'lc waikiki',
      'image': 'https://pngimg.com/uploads/tshirt/tshirt_PNG5449.png',
      'price': '90.75'
    },
    {
      'modal': 'trousers',
      'mark': 'lc waikiki',
      'image':
          'https://www.seekpng.com/png/detail/388-3888604_grey-formal-pants-with-self-designs-formal-pant.png',
      'price': '90.75'
    },
    {
      'modal': 'trousers',
      'mark': 'polo',
      'image':
          'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
      'price': '90.75'
    },
    {
      'modal': 'trousers',
      'mark': 'zara',
      'image':
          'https://www.seekpng.com/png/detail/388-3888604_grey-formal-pants-with-self-designs-formal-pant.png',
      'price': '345.75'
    },
    {
      'modal': 'trousers',
      'mark': 'mavi',
      'image':
          'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
      'price': '244.75'
    },
    {
      'modal': 'trousers',
      'mark': 'lee',
      'image':
          'https://e7.pngegg.com/pngimages/738/197/png-clipart-cargo-pants-t-shirt-trousers-trouser-s-trouser-png-transparent-images-transparency-and-translucency.png',
      'price': '679.00'
    },
    {
      'modal': 'trousers',
      'mark': 'dockers',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '90.75'
    },
    {
      'modal': 'shoes',
      'mark': 'nike',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '1.500'
    },
    {
      'modal': 'shoes',
      'mark': 'adidas',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '650.25'
    },
    {
      'modal': 'shoes',
      'mark': 'colombia',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '800.00'
    },
    {
      'modal': 'shoes',
      'mark': 'puma',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '500.00'
    },
    {
      'modal': 'shoes',
      'mark': 'snackers',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '700.00'
    },
    {
      'modal': 'shoes',
      'mark': 'puma',
      'image':
          'https://pngimg.com/uploads/running_shoes/running_shoes_PNG5817.png',
      'price': '245.00'
    },
  ];

  late List<Map<String, dynamic>> filterlist = [];

  @override
  void initState() {
    filterlist = myList2;

    super.initState();
  }

  bool isOk = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myappbar(
            context,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterlist = myList2
                      .where((e) =>
                          e["mark"].toLowerCase().contains(value.toLowerCase()))
                      .toList(); /*myList2.where((i) => i.contains(value)).toList();*/
                  setState(() {});
                },
                decoration: const InputDecoration(
                    hintText: 'write here', labelText: 'search product'),
              ),
            ),
            PopupWidget()),
        /*  floatingActionButton: FloatingActionButton(child: Text('Z-A'),
          onPressed: () {
          isOk = true ;
          setState(() {});
        }),*/
        body: Column(
          children: [
            Expanded(
              child: filterlist.length == 0
                  ? const Center(child: Text('böyle bir sonuç yok'))
                  : ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      reverse: isOk,
                      itemCount: filterlist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          // ignore: unnecessary_null_comparison
                          leading: Image.network(
                            filterlist[index]['image'],
                            cacheHeight: 50,
                            cacheWidth: 50,
                          ),
                          title: Text(filterlist[index]['mark']),
                          subtitle: Text(filterlist[index]['modal']),
                          trailing: Text('${filterlist[index]['price']} ₺'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
