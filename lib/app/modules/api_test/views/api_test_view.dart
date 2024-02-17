import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/api_test_controller.dart';

class ApiTestView extends GetView<ApiTestController> {
  const ApiTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ApiTestView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              onPressed: controller.onLoginTest,
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: controller.onLoginOut,
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: controller.onUser,
              child: Text(
                'User',
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextButton(
              onPressed: controller.onOrganizations,
              child: Text(
                'Organizations',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
