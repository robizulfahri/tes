import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:neotelemetri_or11/Models/Second/api.dart';
import 'package:neotelemetri_or11/Models/Second/editProduk.dart';
import 'package:neotelemetri_or11/Models/Second/produkModel.dart';
import 'package:neotelemetri_or11/Models/Second/tambahProduk.dart';

class Second extends StatefulWidget {
  @override
  _SecondState createState() => _SecondState();
}

class _SecondState extends State<Second> {
  var loading = false;
  final list = new List<ProdukModel>();
  final GlobalKey<RefreshIndicatorState> _refresh =
  GlobalKey<RefreshIndicatorState>();
  Future<void> _lihatData() async {
    list.clear();
    setState(() {
      loading = true;
    });
    final response = await http.get(BaseUrl.lihatProduk);
    if (response.contentLength == 2) {
    } else {
      final data = jsonDecode(response.body);
      data.forEach((api) {
        final ab = new ProdukModel(
          api['id'],
          api['pertanyaan'],
          api['jawaban'],
          api['kategori'],
          api['idKategori'],
          api['pilihan1'],
          api['pilihan2'],
          api['pilihan3'],
          api['pilihan4'],
        );
        list.add(ab);
      });
      setState(() {
        loading = false;
      });
    }
  }

  dialogDelete(String id) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  "Are you sure want to delete this product?",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text("No")),
                    SizedBox(
                      width: 16.0,
                    ),
//                    InkWell(
//                        onTap: () {
//                          _delete(id);
//                        },
//                        child: Text("Yes")),
                  ],
                )
              ],
            ),
          );
        });
  }

//  _delete(String id) async {
//    final response =
//    await http.post(BaseUrl.deleteProduk, body: {"idProduk": id});
//    final data = jsonDecode(response.body);
//    int value = data['value'];
//    String pesan = data['message'];
//    if (value == 1) {
//      setState(() {
//        Navigator.pop(context);
//        _lihatData();
//      });
//    } else {
//      print(pesan);
//    }
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lihatData();
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {
//          Navigator.of(context).push(MaterialPageRoute(
//              builder: (context) => TambahProduk(_lihatData)));
//        },
//      ),
      body: RefreshIndicator(
        onRefresh: _lihatData,
        key: _refresh,
        child: loading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, i) {
            final x = list[i];
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          x.pertanyaan,
                          style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(x.jawaban),
                        Text(x.kategori),
                        Text(x.idKategori),
                        Text(x.id),
                      ],
                    ),
                  ),
//                  IconButton(
//                    onPressed: () {
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (context) =>
//                              EditProduk(x, _lihatData)));
//                    },
//                    icon: Icon(Icons.edit),
//                  ),
//                  IconButton(
//                    onPressed: () {
//                      dialogDelete(x.id);
//                    },
//                    icon: Icon(Icons.delete),
//                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}