import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<String> myList = [
    'amerika',
    'rusya',
    'çin',
    'türkiye',
    'britanya',
    'kanada',
    'almanya',
    'japonya',
    'nijerya'
  ];
  late List<String> filterlist;

  @override
  void initState() {
    filterlist = myList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  filterlist = myList
                      .where((i) => i.contains(value))
                      .toList();
                  setState(() {});
                },
                decoration: const InputDecoration(
                    hintText: 'write here', labelText: 'country name'),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filterlist.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(filterlist[index].toString()),
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
