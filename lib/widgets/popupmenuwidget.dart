
import 'package:flutter/material.dart';

class PopupWidget extends StatefulWidget {
  const PopupWidget({ Key? key }) : super(key: key);

  @override
  State<PopupWidget> createState() => _PopupWidgetState();
}

class _PopupWidgetState extends State<PopupWidget> {
    bool isOk = false;
  @override
  Widget build(BuildContext context) {
    return   PopupMenuButton(
            icon: const Icon(
              Icons.filter_list,
              color: Colors.black,
            ),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                    child: const Text('A-Z sırala'),
                    onTap: () {
                      isOk = false;
                      setState(() {});
                    }),
                PopupMenuItem(
                  child: const Text('Z-A sırala'),
                  onTap: () {
                    isOk = true;
                    setState(() {});
                  },
                ),
                const PopupMenuItem(child: Text('En yüksek fiyat')),
                const PopupMenuItem(child: Text('En yeni')),
              ];
            },
          );
  }
}