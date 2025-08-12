import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:harpa_crista_app/extensions/context_extensions.dart';
import 'package:harpa_crista_app/models/hino_model.dart';
import 'package:harpa_crista_app/pages/hymn/hymn_page.dart';
import 'package:harpa_crista_app/widgets/appbar/default_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, dynamic>? dados;
  List<HinoModel> hinos = [];

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Future<void> carregarDados() async {
    String jsonString = await rootBundle.loadString(
      'assets/json/harpa_crista_640_hinos.json',
    );
    setState(() {
      dados = json.decode(jsonString);
    });

    for (var element in dados!.entries) {
      hinos.add(HinoModel.fromJson(element.value));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(title: 'Harpa Cristã'),
      body:
          dados == null
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Pesquisar hino',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) {
                        setState(() {
                          hinos =
                              dados!.entries
                                  .map((e) => HinoModel.fromJson(e.value))
                                  .where(
                                    (hino) => hino.hino.toLowerCase().contains(
                                      value.toLowerCase(),
                                    ),
                                  )
                                  .toList();
                        });
                      },
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: AlwaysScrollableScrollPhysics(),
                        controller: ScrollController(),
                        itemCount: hinos.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context.goPush(HymnPage(hymn: hinos[index]));
                            },
                            child: Card(
                              child: ListTile(title: Text(hinos[index].hino)),
                            ),
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
