import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui/models/colors.dart';

class SelectMotorcyclesPage extends StatefulWidget {
  const SelectMotorcyclesPage({super.key});

  @override
  State<SelectMotorcyclesPage> createState() => _SelectMotorcyclesPageState();
}

class _SelectMotorcyclesPageState extends State<SelectMotorcyclesPage> {
  List<String> bikes = [
    'Honda',
    'Yamaha',
    'Suzuki',
    'Kawasaki',
    'Harley-Davidson',
    'Ducati',
    'BMW Motorrad',
    'KTM',
    'Triumph',
    'Royal Enfield',
    'Bajaj',
    'Aprilia',
    'MV Agusta',
    'Husqvarna',
    'Indian Motorcycle',
    'Moto Guzzi',
    'Benelli',
    'Zero Motorcycles',
    'Kymco',
    'Piaggio',
  ];
  List<bool> indexBool = [];
  bool _customTileExpanded = false;
  Map<int, bool> selectedColor = {};

  List<Color> colorsList = MyColors.colorList;

  @override
  void initState() {
    for (int i = 0; i < colorsList.length; i++) {
      selectedColor.addAll({i: false});
    }
    log(selectedColor.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Motorbike",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: ListView.builder(
        itemCount: bikes.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width * 0.04, vertical: Get.height * 0.01),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                child: ExpansionTile(
                  title: Text(
                    bikes[index],
                  ),
                  children: [
                    Column(
                      children: [
                        Text("AB motors"),
                        Text('pick color'),
                        GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemCount: colorsList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width * 0.04,
                                  vertical: Get.height * 0.035),
                              child: GestureDetector(
                                onTap: () {
                                  log(selectedColor[index].toString());
                                  //make everything else false
                                  selectedColor
                                      .updateAll((key, value) => false);

                                  //change current selected color
                                  selectedColor[index] = true;
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1,
                                          color: selectedColor[index]!
                                              ? Colors.green
                                              : Colors.grey),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: 15,
                                        width: 15,
                                        decoration: BoxDecoration(
                                            border: Border.all(width: 1),
                                            shape: BoxShape.circle,
                                            color: colorsList[index]),
                                      ),
                                      Text("Teal")
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Pick this transporation"),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: colorsList[2]),
                        )
                      ],
                    )
                  ],
                  onExpansionChanged: (bool expanded) {},
                )),
          );
        },
      ),
    );
  }
}
