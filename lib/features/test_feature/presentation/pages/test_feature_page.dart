import 'package:flutter/material.dart';

class TestFeaturePage extends StatefulWidget {
  const TestFeaturePage({super.key});

  @override
  State<TestFeaturePage> createState() => _TestFeaturePagePageState();
}

class _TestFeaturePagePageState extends State<TestFeaturePage> {
  @override
  bool containPadding() => false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Center(child: Text("Hello World")),
    );
  }
}
