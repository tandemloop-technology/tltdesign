import 'package:flutter/material.dart';
import 'package:tlt_design/tlt_design.dart';

void main() {
  // changeTheme();
  runApp(const MyApp());
}

void changeTheme() {
  final TltTheme theme = TltTheme.instance;
  theme.primaryColor = Colors.red;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TLT Design Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TandemloopDesignSystem(),
    );
  }
}

GlobalKey<FormState> globalKey = GlobalKey<FormState>();
List<double> tltSliderValueList = [
  11,
  22,
];

class TandemloopDesignSystem extends StatelessWidget {
  const TandemloopDesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Tandemloop Design System',
          style: TltStyles.heading4.copyWith(
            color: TltColors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: TltColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Typography',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),

            const TltYSpace(8),
            Text(
              'heading1',
              style: TltStyles.heading1.copyWith(
                color: TltColors.black,
              ),
            ),
            Text(
              'heading2',
              style: TltStyles.heading2.copyWith(
                color: TltColors.black,
              ),
            ),
            Text(
              'heading3',
              style: TltStyles.heading3.copyWith(
                color: TltColors.black,
              ),
            ),
            Text(
              'heading4',
              style: TltStyles.heading4.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(10),
            Text(
              'heading5',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(10),
            Text(
              'heading6',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(18),
            Text(
              'subheading1',
              style: TltStyles.subheading1.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'subheading2',
              style: TltStyles.subheading2.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(18),
            Text(
              'lead1',
              style: TltStyles.lead1.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'lead2',
              style: TltStyles.lead2.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(18),
            Text(
              'body1',
              style: TltStyles.body1.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'body2',
              style: TltStyles.body2.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(18),
            Text(
              'labelXL',
              style: TltStyles.labelXL.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'labelL',
              style: TltStyles.labelL.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'labelM',
              style: TltStyles.labelM.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'labelS',
              style: TltStyles.labelS.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(5),
            Text(
              'labelXS',
              style: TltStyles.labelXS.copyWith(
                color: TltColors.black,
              ),
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Colors',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Text(
              'Primary',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueLight[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            /// blue gray
            Text(
              'Blue Gray',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.blueGray[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///gray
            Text(
              'Gray',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.gray[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///indigo
            Text(
              'Indigo',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.indigo[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///purple
            Text(
              'Purple',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.purple[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///pink
            Text(
              'Pink',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.pink[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///violet
            Text(
              'Violet',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.violet[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///orange
            Text(
              'Orange',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.orange[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///rose
            Text(
              'Rose',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.rose[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///error
            Text(
              'Error',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.error[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///warning
            Text(
              'Warning',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.warning[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(40),

            ///success
            Text(
              'Success',
              style: TltStyles.heading6.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(8),
            Wrap(
              spacing: 22,
              runSpacing: 30,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[900],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '900',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[800],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '800',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[700],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '700',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[600],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '600',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[500],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '500',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[400],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '400',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[300],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '300',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[200],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '200',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[100],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '100',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: TltColors.success[50],
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  height: 50,
                  width: 50,
                  child: Center(
                    child: Text(
                      '50',
                      style: TltStyles.labelM.copyWith(
                        color: TltColors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Avatars',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltAvatar.custom(
                  onTap: () {},
                  radius: 15,
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  radius: 20,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  radius: 25,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  radius: 30,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  radius: 35,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  radius: 40,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
              ],
            ),

            Row(
              children: [
                TltAvatar.custom(
                  showIndicator: true,
                  onTap: () {},
                  radius: 15,
                ),
                TltAvatar.custom(
                  showIndicator: true,
                  radius: 20,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  showIndicator: true,
                  radius: 25,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  showIndicator: true,
                  radius: 30,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  showIndicator: true,
                  radius: 35,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
                TltAvatar.custom(
                  // child: Image.network(
                  //     'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg'),
                  // backgroundImage: const NetworkImage(
                  //     'https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg'),
                  showIndicator: true,
                  radius: 40,
                  onTap: () {},
                  // child: Text('as'),
                  text: 'Praveen',
                ),
              ],
            ),

            Row(
              children: [
                TltAvatarGroup(avatarRadius: 24, avatarData: <AvatarData>[
                  AvatarData(
                    text: 'Gopinath',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Praveen kumar',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Suriya',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Hemath',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Shali',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Vishali',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Fahad',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Varun',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Sachin',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Mishal',
                    onTap: () {},
                  ),
                  AvatarData(
                    text: 'Anupriya',
                    onTap: () {},
                  ),
                ]),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Buttons',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltButton(
                  text: 'Button',
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                  buttonSize: TltSize.xs,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonSize: TltSize.sm,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonWidth: 100,
                  busy: true,
                  buttonSize: TltSize.md,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  buttonSize: TltSize.lg,
                  suffix: const Icon(
                    TltIcons.chevron_down,
                    color: TltColors.white,
                  ),
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  enabled: false,
                  buttonSize: TltSize.xl,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonSize: TltSize.xxl,
                  prefix: const Icon(
                    TltIcons.chevron_down,
                    color: TltColors.white,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            const TltYSpace(50),

            Row(
              children: [
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.secondary,
                  buttonSize: TltSize.xs,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.secondary,
                  buttonSize: TltSize.sm,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonWidth: 100,
                  busy: true,
                  buttonType: TltButtonType.secondary,
                  buttonSize: TltSize.md,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.secondary,
                  buttonSize: TltSize.lg,
                  suffix: Icon(
                    TltIcons.chevron_down,
                    color: TltColors.indigo[600],
                  ),
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  enabled: false,
                  buttonType: TltButtonType.secondary,
                  buttonSize: TltSize.xl,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  prefix: Icon(
                    TltIcons.chevron_down,
                    color: TltColors.indigo[600],
                  ),
                  buttonType: TltButtonType.secondary,
                  buttonSize: TltSize.xxl,
                  onTap: () {},
                ),
              ],
            ),
            const TltYSpace(50),
            Row(
              children: [
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.outline,
                  buttonSize: TltSize.xs,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.outline,
                  buttonSize: TltSize.sm,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  busy: true,
                  buttonWidth: 100,
                  buttonType: TltButtonType.outline,
                  buttonSize: TltSize.md,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.outline,
                  buttonSize: TltSize.lg,
                  suffix: const Icon(
                    TltIcons.chevron_down,
                    color: TltColors.black,
                  ),
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.outline,
                  buttonSize: TltSize.xl,
                  enabled: false,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.outline,
                  prefix: const Icon(
                    TltIcons.chevron_down,
                    color: TltColors.black,
                  ),
                  buttonSize: TltSize.xxl,
                  onTap: () {},
                ),
              ],
            ),
            const TltYSpace(50),
            Row(
              children: [
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.link,
                  buttonSize: TltSize.xs,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.link,
                  buttonSize: TltSize.sm,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  busy: true,
                  buttonWidth: 100,
                  buttonType: TltButtonType.link,
                  buttonSize: TltSize.md,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.link,
                  buttonSize: TltSize.lg,
                  suffix: Icon(
                    TltIcons.chevron_down,
                    color: TltColors.indigo[600],
                  ),
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  enabled: false,
                  buttonType: TltButtonType.link,
                  buttonSize: TltSize.xl,
                  onTap: () {},
                ),
                const TltXSpace(20),
                TltButton(
                  text: 'Button',
                  buttonType: TltButtonType.link,
                  prefix: Icon(
                    TltIcons.chevron_down,
                    color: TltColors.indigo[600],
                  ),
                  buttonSize: TltSize.xxl,
                  onTap: () {},
                ),
              ],
            ),

            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Badges',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltBadge(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  label: Text(
                    'Badge',
                    style: TltStyles.body1.copyWith(
                      color: TltColors.blue[500],
                    ),
                  ),
                ),
                const TltXSpace(20),
                TltBadge(
                  padding: const EdgeInsets.fromLTRB(6, 2, 8, 2),
                  prefix: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                        color: TltColors.orange,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  label: Center(
                    child: Text(
                      'Label',
                      style: TltStyles.body1.copyWith(
                        color: TltColors.blue[500],
                      ),
                    ),
                  ),
                ),
                const TltXSpace(20),
                TltBadge(
                  padding: const EdgeInsets.fromLTRB(6, 2, 8, 2),
                  prefix: Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                        color: TltColors.gray,
                        borderRadius: BorderRadius.circular(100)),
                  ),
                  label: Center(
                    child: Text(
                      'Label',
                      style: TltStyles.body1.copyWith(
                        color: TltColors.blue[500],
                      ),
                    ),
                  ),
                ),
                const TltXSpace(20),
                TltBadge(
                  padding: const EdgeInsets.fromLTRB(10, 2, 6, 2),
                  suffix: Icon(
                    Icons.close,
                    weight: 5,
                    size: 15,
                    color: TltColors.blue[500],
                  ),
                  label: Center(
                    child: Text(
                      'Label',
                      style: TltStyles.body1.copyWith(
                        color: TltColors.blue[500],
                      ),
                    ),
                  ),
                ),
                const TltXSpace(18),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'TextFormField',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Form(
              key: globalKey,
              child: Wrap(
                spacing: 10,
                children: [
                  SizedBox(
                    width: 300,
                    child: TltTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error text';
                        } else {
                          return null;
                        }
                      },
                      decoration: TltInputDecoration(
                          hintText: 'harsha@tandemloop.in',
                          labelText: 'Email',
                          helperText: 'Helper text',
                          suffixIcon: const Icon(Icons.question_mark_outlined),
                          prefixIcon: const Icon(Icons.mail_outline)),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TltTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error text';
                        } else {
                          return null;
                        }
                      },
                      decoration: TltInputDecoration(
                        hintText: '90000 00000',
                        labelText: 'Phone number',
                        helperText: 'Helper text',
                        suffixIcon: const Icon(Icons.question_mark_outlined),
                        prefixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TltXSpace(20),
                            Text('IND'),
                            Icon(Icons.arrow_drop_down_rounded),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TltTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error text';
                        } else {
                          return null;
                        }
                      },
                      decoration: TltInputDecoration(
                        hintText: '9000',
                        labelText: 'Sale amount',
                        helperText: 'Helper text',
                        prefixIcon: const Icon(Icons.currency_rupee),
                        suffixIcon: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.question_mark_outlined),
                            TltXSpace(4),
                            Text('IND'),
                            TltXSpace(4),
                            Icon(Icons.arrow_drop_down_rounded),
                            TltXSpace(20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TltTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error text';
                        } else {
                          return null;
                        }
                      },
                      decoration: TltInputDecoration(
                        hintText: 'www.tandemloop.in',
                        labelText: 'Email',
                        addOnBefore: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('https://'),
                        ),
                        suffixIcon: const Icon(Icons.question_mark_outlined),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TltTextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error text';
                        } else {
                          return null;
                        }
                      },
                      decoration: TltInputDecoration(
                        hintText: 'www.tandemloop',
                        labelText: 'Email',
                        addOnAfter: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text('.com'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    child: TltTextFormField.textArea(
                      maxLines: 4,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Error text';
                        } else {
                          return null;
                        }
                      },
                      decoration: TltInputDecoration(
                        hintText: 'Enter a description',
                        labelText: 'Description',
                      ),
                      minLines: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TltButton(
                      text: 'Validate',
                      onTap: () {
                        if (globalKey.currentState!.validate()) {}
                      },
                    ),
                  )
                ],
              ),
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Radio Button',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltRadio(
                  value: false,
                  groupValue: true,
                  onChanged: (value) {},
                ),
                const TltXSpace(20),
                TltRadio(
                  value: true,
                  groupValue: true,
                  onChanged: (value) {},
                ),
                const TltXSpace(20),
                TltRadio(
                  value: false,
                  fillColor: MaterialStatePropertyAll(TltColors.gray[200]),
                  groupValue: true,
                  onChanged: null,
                ),
                const TltXSpace(20),
                const TltRadio(
                  value: false,
                  // disableButton: true,
                  groupValue: false,
                  onChanged: null,
                ),
                const TltXSpace(20),
              ],
            ),

            const TltYSpace(18),

            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: TltRadioListTile(
                    title: const Text('Remember me'),
                    value: true,
                    groupValue: false,
                    onChanged: (value) {},
                  ),
                ),
                const TltXSpace(20),
                SizedBox(
                  width: 200,
                  child: TltRadioListTile(
                    title: const Text('Remember me'),
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ),
                const TltXSpace(20),
                SizedBox(
                  width: 200,
                  child: TltRadioListTile(
                    title: const Text('Remember me'),
                    value: true,
                    disableButton: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ),
                const TltXSpace(20),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Checkbox',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltCheckbox(
                  value: false,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
                TltCheckbox(
                  value: true,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
                TltCheckbox(
                  value: false,
                  enabled: false,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
                TltCheckbox(
                  enabled: false,
                  value: true,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
              ],
            ),
            const TltYSpace(25),
            Row(
              children: [
                TltCheckbox(
                  borderRadius: 100,
                  value: false,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
                TltCheckbox(
                  borderRadius: 100,
                  value: true,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
                TltCheckbox(
                  borderRadius: 100,
                  value: false,
                  enabled: false,
                  size: 25,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
                TltCheckbox(
                  borderRadius: 100,
                  enabled: false,
                  value: true,
                  size: 28,
                  onChanged: (value) {},
                ),
                const TltXSpace(30),
              ],
            ),
            const TltYSpace(20),
            Row(
              children: [
                SizedBox(
                  width: 200,
                  child: TltCheckboxTile(
                    title: "Remember me",
                    child: TltCheckbox(
                      // borderRadius: 100,
                      value: false,
                      size: 25,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const TltXSpace(20),
                SizedBox(
                  width: 200,
                  child: TltCheckboxTile(
                    title: "Remember me",
                    child: TltCheckbox(
                      borderRadius: 100,
                      value: false,
                      size: 25,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const TltXSpace(20),
                SizedBox(
                  width: 200,
                  child: TltCheckboxTile(
                    title: "Remember me",
                    child: TltCheckbox(
                      borderRadius: 100,
                      value: true,
                      size: 25,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const TltXSpace(20),
                SizedBox(
                  width: 200,
                  child: TltCheckboxTile(
                    title: "Remember me",
                    child: TltCheckbox(
                      // borderRadius: 100,
                      value: true,
                      size: 25,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Liner Progress indicator',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Wrap(
              spacing: 30,
              children: [
                SizedBox(
                  width: 250,
                  child: TltLinearProgressIndicator(
                    tooltipMode: TltVisibility.never,
                    value: 36,
                    animation: false,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TltLinearProgressIndicator(
                    tooltipMode: TltVisibility.never,
                    trailingPosition:
                        TltProgressIndicatorTrailPosition.bottomRight,
                    value: 20,
                    animation: false,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TltLinearProgressIndicator(
                    value: 40,
                    animation: false,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TltLinearProgressIndicator(
                    showTooltipAbove: false,
                    value: 40,
                    animation: false,
                  ),
                ),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Circle Progress indicator',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltCircularProgressIndicator(
                  animation: false,
                  value: 20,
                  width: 10,
                  radius: 40,
                ),
                const TltXSpace(30),
                TltCircularProgressIndicator(
                  animation: false,
                  centerLabel: 'Active user',
                  value: 40,
                  width: 15,
                  radius: 80,
                ),
                const TltXSpace(30),
                TltCircularProgressIndicator(
                  animation: false,
                  value: 60,
                  width: 20,
                  radius: 120,
                ),
                const TltXSpace(30),
              ],
            ),
            const TltYSpace(50),
            Row(
              children: [
                TltCircularProgressIndicator(
                  animation: false,
                  arcType: TltArcType.half,
                  value: 20,
                  width: 10,
                  radius: 40,
                ),
                const TltXSpace(30),
                TltCircularProgressIndicator(
                  arcType: TltArcType.half,
                  animation: false,
                  value: 40,
                  centerLabel: 'Active user',
                  width: 15,
                  radius: 80,
                ),
                const TltXSpace(30),
                TltCircularProgressIndicator(
                  arcType: TltArcType.half,
                  animation: false,
                  value: 60,
                  width: 20,
                  radius: 120,
                ),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Slider indicator',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Wrap(
              spacing: 30,
              children: [
                for (double value in tltSliderValueList)
                  StatefulBuilder(builder: (context, setState) {
                    return SizedBox(
                      width: 250,
                      child: TltSlider(
                        valueIndicatorMode: value < 20
                            ? TltSliderIndicatorMode.tooltip
                            : TltSliderIndicatorMode.textOnly,
                        onChanged: (newValue) {
                          setState(
                            () {
                              value = newValue;
                            },
                          );
                        },
                        value: value,
                      ),
                    );
                  }),
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Pagination',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            TltPagination(
              currentPage: 20,
              totalPages: 45,
              onTap: [
                for (int i = 0; i < 45; i++) () {},
              ],
            ),
            const TltYSpace(50),
            TltPagination(
              paginationType: TltPaginationType.cardButton,
              currentPage: 20,
              totalPages: 45,
              onTap: [
                for (int i = 0; i < 45; i++) () {},
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),
            const TltYSpace(19.5),
            Text(
              'Breadcrumbs',
              style: TltStyles.heading5.copyWith(
                color: TltColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const TltYSpace(18),
            Row(
              children: [
                TltBreadCrumb(
                  defaultColor: TltColors.error,
                  children: [
                    TltBreadCrumbElement(
                      content: 'A',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'B',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'C',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'D',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'E',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'F',
                      onTap: () {},
                    ),
                  ],
                ),
                const TltXSpace(50),
                TltBreadCrumb(
                  separator: TltBreadCrumbSeparator.slash,
                  children: [
                    TltBreadCrumbElement(
                      content: 'previous page',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'current page',
                      onTap: () {},
                    )
                  ],
                ),
                const TltXSpace(50),
                TltBreadCrumb(
                  separator: TltBreadCrumbSeparator.slash,
                  hoverUnderLine: true,
                  children: [
                    TltBreadCrumbElement(
                      content: 'previous page',
                      onTap: () {},
                    ),
                    TltBreadCrumbElement(
                      content: 'current page',
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
            const TltYSpace(19.5),
            const Divider(
              height: 1,
              color: TltColors.black,
            ),

            const TltYSpace(30),
          ],
        ),
      ),
    );
  }
}
