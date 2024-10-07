// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:carbon_icons/carbon_icons.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math' as math;

import 'package:get/get.dart';
import 'package:task_app/app/data/colors.dart';

import '../controllers/new_recurring_task_controller.dart';

class NewRecurringTaskView extends GetView<NewRecurringTaskController> {
  NewRecurringTaskView({Key? key}) : super(key: key);
  final NewRecurringTaskController controller =
      Get.put(NewRecurringTaskController());
  @override
  Widget build(BuildContext context) {
    final query = MediaQuery.of(context);
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;

    return MediaQuery(
      data: query.copyWith(
        textScaleFactor: query.textScaleFactor.clamp(1.0, 1.15),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(Icons.arrow_back, color: Colors.black)),
                    SizedBox(width: 8),
                    Text(
                      "Tugas Baru",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: textScaleFactor <= 1.15 ? 24 : 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                child: GestureDetector(
                  onTap: () {
                    // Get.to(AllTeamView());
                  },
                  child: Text(
                    "Selesai",
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                    color: Colors.white,
                    width: double.infinity,
                    child: TextFormField(
                      // controller: login.emailAddressTextController,
                      // focusNode: login.emailAddressFocusNode,
                      autofocus: false,
                      autofillHints: [AutofillHints.email],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        labelText: 'Nama Tugas',
                        labelStyle: TextStyle(
                            fontSize: textScaleFactor <= 1.15 ? 15 : 13),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).errorColor,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(17),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tolong isikan nama tugas';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          autofocus: false,
                          autofillHints: [AutofillHints.email],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                            labelText: 'Deskripsi (Optional)',
                            labelStyle: TextStyle(
                                fontSize: textScaleFactor <= 1.15 ? 15 : 13),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).errorColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Theme.of(context).errorColor,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(17),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          style: Theme.of(context).textTheme.bodyText1,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(Icons.add_box_rounded,
                                  color: AppColors.primaryColor),
                              SizedBox(width: 10),
                              Text(
                                "Tambahkan sub-tugas",
                                style: TextStyle(
                                  fontSize: textScaleFactor <= 1.15 ? 13 : 10,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              textAlign: TextAlign.start,
                              "Frekuensi Pengerjaan",
                              style: TextStyle(
                                  fontSize: textScaleFactor <= 1.15 ? 16 : 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor),
                            ),
                            Obx(
                              () => RadioListTile<int>(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                title: const Text('Tiap hari'),
                                value: 0,
                                groupValue: controller.selectedValue.value,
                                onChanged: (value) {
                                  controller.setSelectedValue(value!);
                                },
                              ),
                            ),
                            Obx(
                              () => RadioListTile<int>(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                title:
                                    const Text('Hari tertentu dalam seminggu'),
                                value: 1,
                                groupValue: controller.selectedValue.value,
                                onChanged: (value) {
                                  controller.setSelectedValue(value!);
                                },
                              ),
                            ),
                            Obx(() => controller.selectedValue.value == 1
                                ? Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Obx(
                                      () => GridView.count(
                                        padding: EdgeInsets.zero,
                                        crossAxisCount:
                                            3, // Jumlah kolom dalam satu baris
                                        shrinkWrap:
                                            true, // Tambahkan ini agar GridView menyesuaikan tinggi dengan isinya
                                        physics: NeverScrollableScrollPhysics(),
                                        mainAxisSpacing:
                                            0.0, // Mengatur jarak antar baris
                                        crossAxisSpacing:
                                            4.0, // Nonaktifkan scroll di dalam GridView
                                        children:
                                            controller.days.keys.map((day) {
                                          return CheckboxListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              day,
                                              style: TextStyle(
                                                fontSize:
                                                    textScaleFactor <= 1.15
                                                        ? 12
                                                        : 10,
                                              ),
                                            ),
                                            value: controller.days[day]?.value,
                                            onChanged: (value) {
                                              controller.toggleDay(day);
                                            },
                                            controlAffinity:
                                                ListTileControlAffinity.leading,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )
                                : Container()),
                            Obx(
                              () => RadioListTile<int>(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                title: const Text(
                                    'Tanggal tertentu dalam sebulan'),
                                value: 2,
                                groupValue: controller.selectedValue.value,
                                onChanged: (value) {
                                  controller.setSelectedValue(value!);
                                },
                              ),
                            ),
                            Obx(
                              () => controller.selectedValue.value == 2
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 5, 13, 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.trinaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Tanggal",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                width: 40,
                                                child: TextFormField(
                                                  initialValue: null,
                                                  onChanged: (text) {
                                                    // Fungsi untuk memproses teks yang dimasukkan
                                                    // home.loadWisataAll(text);
                                                  },
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    hintText: "",
                                                    border:
                                                        UnderlineInputBorder(),
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[500],
                                                      fontFamily: 'Mulish',
                                                    ),
                                                  ),
                                                  onFieldSubmitted: (value) {
                                                    // Fungsi untuk memproses input setelah pengguna menekan Enter
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text("tiap bulan"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                            ),
                            Obx(
                              () => RadioListTile<int>(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                title: const Text(
                                    'Tanggal tertentu dalam setahun'),
                                value: 3,
                                groupValue: controller.selectedValue.value,
                                onChanged: (value) {
                                  controller.setSelectedValue(value!);
                                },
                              ),
                            ),
                            Obx(
                              () => controller.selectedValue.value == 3
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 5, 13, 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.trinaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Tanggal",
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              SizedBox(width: 10),
                                              Container(
                                                width: 40,
                                                child: TextFormField(
                                                  initialValue: null,
                                                  onChanged: (text) {
                                                    // Fungsi untuk memproses teks yang dimasukkan
                                                    // home.loadWisataAll(text);
                                                  },
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    hintText: "",
                                                    border:
                                                        UnderlineInputBorder(),
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[500],
                                                      fontFamily: 'Mulish',
                                                    ),
                                                  ),
                                                  onFieldSubmitted: (value) {
                                                    // Fungsi untuk memproses input setelah pengguna menekan Enter
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text("tiap tahun"),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 5, 5, 5),
                                          decoration: BoxDecoration(
                                              color: AppColors.primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Icon(
                                            Icons.calendar_month,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
                                  : Container(),
                            ),
                            Obx(
                              () => RadioListTile<int>(
                                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                title: const Text('Berulang'),
                                value: 4,
                                groupValue: controller.selectedValue.value,
                                onChanged: (value) {
                                  controller.setSelectedValue(value!);
                                },
                              ),
                            ),
                            Obx(
                              () => controller.selectedValue.value == 4
                                  ? Center(
                                      child: IntrinsicWidth(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              13, 8, 13, 8),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.trinaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 50,
                                                child: TextFormField(
                                                  initialValue: null,
                                                  onChanged: (text) {
                                                    // Fungsi untuk memproses teks yang dimasukkan
                                                    // home.loadWisataAll(text);
                                                  },
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    hintText: "Aktivasi",
                                                    border:
                                                        UnderlineInputBorder(),
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[500],
                                                      fontFamily: 'Mulish',
                                                    ),
                                                  ),
                                                  onFieldSubmitted: (value) {
                                                    // Fungsi untuk memproses input setelah pengguna menekan Enter
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text("hari "),
                                              Text("x "),
                                              Container(
                                                width: 50,
                                                child: TextFormField(
                                                  initialValue: null,
                                                  onChanged: (text) {
                                                    // Fungsi untuk memproses teks yang dimasukkan
                                                    // home.loadWisataAll(text);
                                                  },
                                                  decoration:
                                                      InputDecoration.collapsed(
                                                    hintText: "Istirahat",
                                                    border:
                                                        UnderlineInputBorder(),
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[500],
                                                      fontFamily: 'Mulish',
                                                    ),
                                                  ),
                                                  onFieldSubmitted: (value) {
                                                    // Fungsi untuk memproses input setelah pengguna menekan Enter
                                                  },
                                                ),
                                              ),
                                              SizedBox(width: 10),
                                              Text("hari"),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  color: AppColors.primaryColor),
                              SizedBox(width: 10),
                              Text(
                                "Tanggal Mulai",
                                style: TextStyle(
                                  fontSize: textScaleFactor <= 1.15 ? 13 : 10,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.trinaryColor,
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: Text(
                                    "Hari ini",
                                    style: TextStyle(
                                        color: AppColors.primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  color: AppColors.primaryColor),
                              SizedBox(width: 10),
                              Text(
                                "Tanggal Selesai",
                                style: TextStyle(
                                  fontSize: textScaleFactor <= 1.15 ? 13 : 10,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              Obx(
                                () => CupertinoSwitch(
                                  value: controller.isSwitchOn.value
                                      ? false
                                      : controller.powerOn.value,
                                  onChanged: (value) =>
                                      controller.toggleSwitch(),
                                  activeColor: AppColors.primaryColor,
                                  trackColor: Color.fromARGB(44, 114, 110, 110),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Obx(
                          () => controller.powerOn.value == true
                              ? Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(70, 0, 70, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 5, 10, 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.trinaryColor,
                                          ),
                                          child: Text(
                                            "28/04/2024",
                                            style: TextStyle(
                                                color: AppColors.primaryColor),
                                          )),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 0, 20, 0),
                                          child: TextFormField(
                                            initialValue: null,
                                            onChanged: (text) {
                                              // Fungsi untuk memproses teks yang dimasukkan
                                              // home.loadWisataAll(text);
                                            },
                                            decoration:
                                                InputDecoration.collapsed(
                                              hintText: "",
                                              border: UnderlineInputBorder(),
                                              hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[500],
                                                fontFamily: 'Mulish',
                                              ),
                                            ),
                                            onFieldSubmitted: (value) {
                                              // Fungsi untuk memproses input setelah pengguna menekan Enter
                                            },
                                          ),
                                        ),
                                      ),
                                      Text("hari"),
                                    ],
                                  ),
                                )
                              : Container(),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(CupertinoIcons.bell,
                                  color: AppColors.primaryColor),
                              SizedBox(width: 10),
                              Text(
                                "Pengikut",
                                style: TextStyle(
                                  fontSize: textScaleFactor <= 1.15 ? 13 : 10,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.trinaryColor,
                                child: Text(
                                  "0",
                                  style:
                                      TextStyle(color: AppColors.primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        GestureDetector(
                          onTap: () {
                            _showQuantityDialog(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.flag,
                                    color: AppColors.primaryColor),
                                SizedBox(width: 10),
                                Text(
                                  "Prioritas",
                                  style: TextStyle(
                                    fontSize: textScaleFactor <= 1.15 ? 13 : 10,
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.trinaryColor,
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 20, 5),
                                      child: Obx(
                                        () => Text(
                                          controller.selectProritas.value == 0
                                              ? "Defauld"
                                              : controller.selectProritas.value
                                                  .toString(),
                                          style: TextStyle(
                                              color: AppColors.primaryColor),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Icon(Icons.task, color: AppColors.primaryColor),
                              SizedBox(width: 10),
                              Text(
                                "Tunda Tugas",
                                style: TextStyle(
                                  fontSize: textScaleFactor <= 1.15 ? 13 : 10,
                                  color: Colors.black,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.check_circle,
                                color: AppColors.primaryColor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Tambah Anggota",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: textScaleFactor <= 1.15 ? 18 : 16),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showQuantityDialog(
    BuildContext context,
  ) {
    double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final controller = Get.find<NewRecurringTaskController>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          title: Text(
            "Tentukan Prioritas",
            style: TextStyle(
                fontSize: textScaleFactor <= 1.15 ? 18 : 16,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
              ),
              Obx(() => Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFEAE7FF),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: controller.decrement,
                          ),
                          Text(
                            controller.prioritas.string,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: controller.increment,
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  'Prioritas tertinggi akan diletakkan paling atas dalam list',
                  style: TextStyle(
                    fontSize: textScaleFactor <= 1.15 ? 14 : 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.updatePrioritas();
                      Get.back();
                    },
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}