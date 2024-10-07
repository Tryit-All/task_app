import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TugasController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement TugasController

  late AnimationController _controller;
  late TabController tabController;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(_handleTabSelection);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void _handleTabSelection() async {
    // Handle perubahan tab di sini
    switch (tabController.index) {
      case 0:
        // loadProses();
        break;
      case 1:
        // loadDikirim();
        break;
      case 2:
        // loadDiterima();
        break;
      // case 3:
      //   loadBelumbayar();
      //   break;
    }
  }
}