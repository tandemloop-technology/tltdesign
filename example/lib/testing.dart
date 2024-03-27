import 'package:flutter/material.dart';
import 'package:tlt_design/tlt_design.dart';

class TestingUi extends StatelessWidget {
  const TestingUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TltPagination(currentPage: 1, totalPages: 5, onTap: [
        () {},
        () {},
        () {},
        () {},
        () {},
      ]),
    );
  }
}
