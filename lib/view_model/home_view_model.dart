import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:random_pass_generator/enum/strings_enum.dart';
import 'package:random_pass_generator/view/home_view.dart';

abstract class HomeViewModel extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    lenghtController = TextEditingController();
    changeLoading();
    fetchPassword();
    changeLoading();
  }

  late final TextEditingController lenghtController;
  //?num=true&char=true&caps=true&len=18
  String baseUrl = 'https://passwordinator.onrender.com/';

  String password = '';
  bool number = false;
  bool specialChar = false;
  bool upperCase = false;
  int lenght = 12;
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }

  void changeNumber() {
    setState(() {
      number = !number;
    });
  }

  void changeSpecialChar() {
    setState(() {
      specialChar = !specialChar;
    });
  }

  void changeUpperCase() {
    setState(() {
      upperCase = !upperCase;
    });
  }

  void sliderOnChanged(double value) {
    setState(() {
      lenght = value.toInt();
    });
  }

  /// GET METHOD
  Future<void> fetchPassword() async {
    String request = '';
    changeLoading();

    if (number && upperCase && specialChar) {
      request = '$baseUrl?num=true&caps=true&char=true&len=$lenght';
    } else if (number && upperCase) {
      request = '$baseUrl?num=true&caps=true&len=$lenght';
    } else if (number && specialChar) {
      request = '$baseUrl?num=true&char=true&len=$lenght';
    } else if (upperCase && specialChar) {
      request = '$baseUrl?caps=true&char=true&len=$lenght';
    } else if (number) {
      request = '$baseUrl?num=true&len=$lenght';
    } else if (upperCase) {
      request = '$baseUrl?caps=true&len=$lenght';
    } else if (specialChar) {
      request = '$baseUrl?char=true&len=$lenght';
    } else {
      request = '$baseUrl?len=$lenght';
    }

    var response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        password = jsonResponse['data'];
      });
    } else {
      setState(() {
        password = AppStrings.failedPass.value;
      });
    }
    changeLoading();
  }
}
