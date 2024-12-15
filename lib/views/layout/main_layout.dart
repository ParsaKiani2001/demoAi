import 'package:ai_preview/provider/screen_provider.dart';
import 'package:ai_preview/views/layout/car_layout.dart';
import 'package:ai_preview/views/layout/plate_layout.dart';
import 'package:ai_preview/views/layout/tyre_layout.dart';
import 'package:ai_preview/views/widgets/item_selecter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  Widget getController(BuildContext context) {
    int selected = context.read<ScreenProvider>().selectedScreen;
    if (selected == 1) return PlateLayout();
    if (selected == 2) return CarLayout();
    if (selected == 3) return TyreLayout();
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ScreenProvider>().initialize();
    return Consumer<ScreenProvider>(builder: (context, value, child) {
      return value.selectedScreen == 0
          ? SizedBox(
              height: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          value.selectedScreen = 1;
                          value.setState();
                        },
                        child: const Text("پلاک خوانی")),
                    Container(
                      height: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          value.selectedScreen = 2;
                          value.setState();
                        },
                        child: const Text("مدل خوانی")),
                    Container(
                      height: 50,
                    ),
                    TextButton(
                        onPressed: () {
                          value.selectedScreen = 3;
                          value.setState();
                        },
                        child: const Text("پایش کیفیت تایر"))
                  ],
                ),
              ))
          : Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      if (value.selectedScreen == 1) ...{
                        Container(
                            padding: const EdgeInsets.only(left: 5, right: 3),
                            child: ListView.builder(
                                itemCount: value.plateModelData.length,
                                itemBuilder: (context, index) {
                                  return ItemSelecter(
                                    data: value.plateModelData[index].dataMain!,
                                    name: value.plateModelData[index].name!,
                                    onClick: () {
                                      value.selectedPlate =
                                          value.plateModelData[index];
                                      value.showResultPlate = false;
                                      value.setState();
                                      //value.showPlate();
                                    },
                                  );
                                }))
                      },
                      if (value.selectedScreen == 3) ...{
                        Container(
                            padding: const EdgeInsets.only(left: 5, right: 3),
                            child: ListView.builder(
                                itemCount: value.tyreModelData.length,
                                itemBuilder: (context, index) {
                                  return ItemSelecter(
                                    data: value.tyreModelData[index].dataMain!,
                                    name: value.tyreModelData[index].name!,
                                    onClick: () {
                                      value.selectedTyre =
                                          value.tyreModelData[index];
                                      value.showResultTyre = false;
                                      value.setState();
                                      //value.showPlate();
                                    },
                                  );
                                }))
                      },
                      if (value.selectedScreen == 2) ...{
                        Container(
                            padding: const EdgeInsets.only(left: 5, right: 3),
                            child: ListView.builder(
                                itemCount: value.carModelData.length,
                                itemBuilder: (context, index) {
                                  return ItemSelecter(
                                    data: value.carModelData[index].dataMain!,
                                    name: value.carModelData[index].name!,
                                    onClick: () {
                                      value.selectedCar =
                                          value.carModelData[index];
                                      value.showResultCar = false;
                                      value.setState();
                                      //value.showPlate();
                                    },
                                  );
                                }))
                      }
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: getController(context),
                )
              ],
            );
    });
  }
}
