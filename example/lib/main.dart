import 'package:flutter/material.dart';
import 'package:tlt_design/tlt_design.dart';

void main() {
  changeTheme();
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const MyHomePage(title: 'TLT Design System Example'),
    );
  }
}

typedef DynamicMap<X> = Map<X, X>;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropDownValue = 'Item 4';
  List<String> dropdownItemsList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  List<bool> checkBoxList = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String radioGroupValue = '';
  List<String> radioActiveValue = [
    'Fahad',
    'gopi',
    'praveen',
    'sachin',
    'surya'
  ];
  DynamicMap<String> mapString = {'1234': '1234'};

  List<Color> colors = [
    TltColors.transparent,
    TltColors.blue,
    TltColors.error,
    TltColors.rose,
    TltColors.violet,
    TltColors.rose,
    TltColors.success,
  ];
  Color activeColors = TltColors.transparent;
  String radioValue = "1";
  double sliderValue = 2;
  bool switchValue = false;
  // int totalPageCount = 1000;
  TextEditingController textEditingController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  void changeColor() {
    activeColors = colors[colors.indexOf(activeColors) != colors.length - 1
        ? colors.indexOf(activeColors) + 1
        : 0];
    print(activeColors);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: TltColors.gray,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                    // child: Text('as'),
                    text: 'Praveen',
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
                  TltAvatar.custom(
                    showIndicator: true,
                    onTap: () {},
                    radius: 15,
                  ),
                  TltAvatar.custom(
                    showIndicator: true,
                    radius: 20,
                    onTap: () {},
                  ),
                  TltAvatar.custom(
                    showIndicator: true,
                    radius: 25,
                    onTap: () {},
                  ),
                  TltAvatar.custom(
                    showIndicator: true,
                    radius: 30,
                    onTap: () {},
                  ),
                  TltAvatar.custom(
                    showIndicator: true,
                    radius: 35,
                    onTap: () {},
                  ),
                  TltAvatar.custom(
                    showIndicator: true,
                    radius: 40,
                    onTap: () {},
                  ),
                ],
              ),
              const TltYSpace(20),
              TltAvatarGroup(avatarRadius: 24, avatarData: <AvatarData>[
                AvatarData(
                  text: 'Gopi nath',
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
                  text: 'Anupriya AirHostess',
                  onTap: () {},
                ),
              ]),
              const TltYSpace(20),
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
                    busy: true,
                    buttonSize: TltSize.md,
                    onTap: () {},
                  ),
                  const TltXSpace(20),
                  TltButton(
                    text: 'Button',
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    buttonSize: TltSize.lg,
                    suffix: const Icon(
                      TltIcons.home,
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
                    buttonType: TltButtonType.link,
                    buttonSize: TltSize.md,
                    onTap: () {},
                  ),
                  const TltXSpace(20),
                  TltButton(
                    text: 'Button',
                    buttonType: TltButtonType.link,
                    buttonSize: TltSize.lg,
                    suffix: const Icon(
                      TltIcons.align_center,
                      color: TltColors.black,
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
                    prefix: const Icon(
                      TltIcons.alert_circle,
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
                    suffix: const Icon(
                      TltIcons.align_center,
                      color: TltColors.black,
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
                    prefix: const Icon(
                      TltIcons.alert_circle,
                      color: TltColors.black,
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
                      TltIcons.align_center,
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
                      TltIcons.alert_circle,
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
                  TltBadge(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    label: const Text(
                      'Badge',
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
                    label: const Center(
                      child: Text(
                        'Badge',
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
                    label: const Center(
                      child: Text(
                        'Badge',
                      ),
                    ),
                  ),
                  const TltXSpace(20),
                  TltBadge(
                    padding: const EdgeInsets.fromLTRB(10, 2, 6, 2),
                    suffix: const Icon(Icons.close, size: 12),
                    label: const Center(
                      child: Text(
                        'Lable',
                      ),
                    ),
                  ),
                  const TltXSpace(20),
                ],
              ),
              const TltYSpace(50),
              Row(
                children: [
                  TltCheckbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    // focusColor: TltColors.blue,
                    value: false,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    value: null,
                    tristate: true,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    value: true,
                    borderRadius: 100,
                    activeBorderColor: TltColors.indigo,
                    iconColor: TltColors.white,
                    fillColor: TltColors.indigo,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    value: false,
                    borderRadius: 100,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    value: null,
                    borderRadius: 100,
                    activeBorderColor: TltColors.indigo,
                    iconColor: TltColors.white,
                    fillColor: TltColors.indigo,
                    tristate: true,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    value: true,
                    enabled: false,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    enabled: false,
                    value: false,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TltCheckbox(
                    enabled: false,
                    value: null,
                    tristate: true,
                    onChanged: (value) {},
                  ),
                ],
              ),
              const TltYSpace(50),
              Row(
                children: [
                  TltDropdownButton(
                    dropdownWidth: 200,
                    value: dropDownValue,
                    items: [
                      for (int i = 1; i < 10; i++)
                        DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: 'Item $i',
                          child: Text('Item $i'),
                        ),
                    ],
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  SizedBox(
                    width: 300,
                    child: TltDropdownButton(
                      customButton: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TltColors.gray[900],
                            ),
                          ),
                          child: const Center(child: Text('Drop Down Radio'))),
                      value: dropDownValue,
                      items: [
                        for (int i = 1; i < 10; i++)
                          DropdownMenuItem(
                            onTap: () {},
                            // alignment: AlignmentDirectional.centerStart,
                            value: 'Item $i',
                            child: SizedBox(
                              width: 200,
                              child: TlTRadioListTile(
                                selectedTileColor: TltColors.blue[100],
                                groupValue: true,
                                value: false,
                                title: Text(
                                  'Item $i',
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                    ),
                  ),
                  const TltXSpace(20),
                  SizedBox(
                    width: 300,
                    child: TltDropdownButton(
                      customButton: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: TltColors.gray[900],
                          ),
                        ),
                        child: const Center(
                          child: Text('Drop Down Check Box'),
                        ),
                      ),
                      value: dropDownValue,
                      items: [
                        for (int i = 1; i < 10; i++)
                          DropdownMenuItem(
                            onTap: () {},
                            value: 'Item $i',
                            child: SizedBox(
                              width: 200,
                              child: TltCheckboxTile(
                                selectedTileColor: TltColors.blue[100],
                                title: 'Item $i',
                                child: TltCheckbox(
                                  value: i == 4 ? true : false,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ),
                      ],
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              const TltYSpace(50),
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
                            suffixIcon:
                                const Icon(Icons.question_mark_outlined),
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
                    TltButton(
                      text: 'Validate',
                      onTap: () {
                        if (globalKey.currentState!.validate()) {}
                      },
                    )
                  ],
                ),
              ),
              const TltYSpace(50),

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
              const TltYSpace(50),
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
              const TltYSpace(50),
              Row(
                children: [
                  TlTRadio(
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TlTRadio(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TlTRadio(
                    value: false,
                    disableButton: true,
                    fillColor: MaterialStatePropertyAll(TltColors.gray[200]),
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TlTRadio(
                    value: false,
                    disableButton: true,
                    groupValue: false,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                ],
              ),
              const TltYSpace(50),
              Row(
                children: [
                  TlTRadio(
                    value: false,
                    groupValue: true,
                    size: 20,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TlTRadio(
                    value: true,
                    groupValue: true,
                    size: 20,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TlTRadio(
                    value: false,
                    disableButton: true,
                    fillColor: MaterialStatePropertyAll(TltColors.gray[200]),
                    groupValue: true,
                    size: 20,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                  TlTRadio(
                    value: false,
                    disableButton: true,
                    size: 20,
                    groupValue: false,
                    onChanged: (value) {},
                  ),
                  const TltXSpace(20),
                ],
              ),
              const TltYSpace(50),
              Row(
                children: [
                  SizedBox(
                    width: 200,
                    child: TlTRadioListTile(
                      title: const Text('Remember me'),
                      value: true,
                      groupValue: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const TltXSpace(20),
                  SizedBox(
                    width: 200,
                    child: TlTRadioListTile(
                      title: const Text('Remember me'),
                      value: true,
                      groupValue: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const TltXSpace(20),
                  SizedBox(
                    width: 200,
                    child: TlTRadioListTile(
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
              const TltYSpace(50),
              Row(
                children: [
                  SizedBox(
                    width: 300,
                    child: TlTRadioListTile(
                      subtitle: const Text('Save my details for next login'),
                      title: const Text('Remember me'),
                      value: true,
                      groupValue: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const TltXSpace(20),
                  SizedBox(
                    width: 300,
                    child: TlTRadioListTile(
                      subtitle: const Text('Save my details for next login'),
                      title: const Text('Remember me'),
                      value: true,
                      groupValue: true,
                      onChanged: (value) {},
                    ),
                  ),
                  const TltXSpace(20),
                  SizedBox(
                    width: 300,
                    child: TlTRadioListTile(
                      subtitle: const Text('Save my details for next login'),
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
              const TltYSpace(50),
              Row(
                children: [
                  SizedBox(
                      width: 200,
                      child: TltSlider(
                        value: 10,
                        onChanged: (value) {},
                      ))
                ],
              )
              // SizedBox(
              //   width: 300,
              //   child: TltTextFormField(
              //     autoCorrect: true,
              //     controller: textEditingController,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Field should not be empty';
              //       } else {
              //         return null;
              //       }
              //     },
              //     cursorColor: TltColors.pink,
              //     cursorHeight: 20,
              //     autovalidateMode: AutovalidateMode.onUserInteraction,
              //     onChanged: (value) {
              //       print('on changed');
              //     },
              //     maxLengthEnforcement: MaxLengthEnforcement.enforced,
              //     obscuringCharacter: '1',
              //     onEditingComplete: () {
              //       print('editing completed');
              //     },
              //     obscureText: true,
              //     maxLength: 10,
              //     cursorRadius: const Radius.circular(100),
              //     expands: false,
              //     autofillHints: const ['String'],
              //     autofocus: false,
              //     contextMenuBuilder: (context, editableTextState) {
              //       return const Text('context menu builder');
              //     },
              //     enableInteractiveSelection: true,
              //     decoration: TltInputDecoration(
              //         error: const Text('Error enter some text'),
              //         prefixIcon: const Icon(TltIconsNew.message),
              //         addOnAfterDecoration: TltAddOnDecoration(
              //           // borderRadius: BorderRadius.circular(20),
              //           border: Border.all(
              //             color: TltColors.purple,
              //             width: 1.5,
              //           ),
              //         ),
              //         // relativeAddOnHeight: 46.1,
              //         addOnBeforeDecoration: TltAddOnDecoration(
              //             border: Border.all(color: TltColors.error)),
              //         // border: const UnderlineInputBorder(
              //         //     borderSide: BorderSide(color: TltColors.orange)),
              //         // prefixIconColor: TltColors.error,
              //         // suffixIconColor: TltColors.blueLight,
              //         suffixIcon: const Icon(
              //           TltIconsNew.close_circle,
              //           color: TltColors.pink,
              //         ),
              //         addOnAfter: const Text('.com'),
              //         addOnBefore: const Text('https//:'),
              //         hintText: 'Enter the text',
              //         label: const Text('Text field'),
              //         helperText: 'If you enter wrong text, can\'t be changed'),
              //   ),
              // ),
              // StatefulBuilder(
              //   builder: (context, setState) {
              //     return TltButton(
              //       autofocus: false,
              //       // busy: true,
              //       margin: const EdgeInsets.all(20),
              //       onDoubleTap: () {
              //         setState(
              //           () {
              //             changeColor();
              //           },
              //         );
              //       },
              //       // padding: const EdgeInsets.symmetric(vertical: 13),
              //       prefix: const Icon(TltIcons.Cloud_off),
              //       suffix: const Icon(TltIcons.arrow_right),
              //       colors: TltColorDecoration(
              //           backgroundColor: activeColors,
              //           borderColor: TltColors.transparent,
              //           highlightColor: TltColors.transparent,
              //           hoverColor: TltColors.transparent,
              //           iconColor: TltColors.transparent,
              //           shadowColor: TltColors.transparent),
              //       buttonHeight: 60,
              //       buttonSize: TltSize.sm,
              //       buttonType: TltButtonType.outline,
              //       // buttonWidth: 100,
              //       borderRadius: BorderRadius.circular(100),
              //       text: 'click to verify the text field',
              //       onTap: () {
              //         if (globalKey.currentState!.validate()) {
              //           print('validated successfully');
              //         }
              //       },
              //     );
              //   },
              // ),
              // TltBadge(
              //   label: const Text(
              //     'Badge',
              //   ),
              //   suffixTooltip: 'Heart of World',
              //   padding: const EdgeInsets.symmetric(horizontal: 50),
              //   tooltip: 'This isBadge widget',
              //   shadow: [BoxShadow()],
              //   selectedShadow: [
              //     BoxShadow(
              //         blurRadius: 20,
              //         blurStyle: BlurStyle.normal,
              //         color: TltColors.error[500],
              //         spreadRadius: 6)
              //   ],
              //   suffixOnTap: () {
              //     print('suffix on tap triggered');
              //   },
              //   contentSpacing: 20,
              //   onTap: () {
              //     print('badge on tap triggered');
              //   },
              //   // prefix: const Icon(TltIcons.book_open),
              //   selected: true,
              //   // enabled: false,
              //   selectedColor: TltColors.orange[50],
              //   suffix: Container(
              //       decoration: BoxDecoration(color: TltColors.indigo),
              //       child: const Icon(TltIcons.Heart)),
              //   showCheckMark: false,
              //   checkMarkSize: 30,
              //   backgroundColor: TltColors.pink,
              //   borderRadius: BorderRadius.circular(04),
              //   checkMarkColor: TltColors.white,
              //   borderStyle: Border.all(color: TltColors.success),
              // ),
              // const Text(
              //   'You have pushed the button this many times:',
              // ),
              // // TltAvatar(
              // //   showIndicator: true,
              // //   indicatorColor: TltColors.error,
              // //   avatarSize: TltSize.xxl,
              // //   backgroundColor: TltColors.success[100],
              // //   child: const Text('SD'),
              // // ),
              // // TltAvatarGroup(
              // //   avatarRadius: 100,
              // //   avatarData: [
              // //     AvatarData(
              // //       text: 'Alfahad',
              // //       bgColor: TltColors.indigo,
              // //       onTap: () {},
              // //     ),
              // //     AvatarData(text: 'Siddiq Rahman', bgColor: TltColors.success),
              // //     AvatarData(text: 'Muzammil', bgColor: TltColors.pink),
              // //     AvatarData(text: 'Gopinath', bgColor: TltColors.warning),
              // //     AvatarData(text: 'Praveen', bgColor: TltColors.gray)
              // //   ],
              // // ),
              // Row(
              //   children: [
              //     for (int i = 0; i < checkBoxList.length; i++) ...[
              //       TltCheckbox(
              //         overlayColor: TltColors.rose,
              //         autoFocus: true,
              //         activeBorderColor: TltColors.pink[900],
              //         value: checkBoxList[i],
              //         inactiveBorderColor: TltColors.blueGray,
              //         splashRadius: 40,
              //         materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              //         focusColor: TltColors.black,
              //         fillColor: TltColors.violet,
              //         visualDensity: VisualDensity.compact,
              //         size: 30,
              //         borderRadius: 100,
              //         iconColor: TltColors.success,
              //         onChanged: (value) {
              //           setState(() {
              //             checkBoxList[i] = value!;
              //           });
              //         },
              //       ),
              //       const TltXSpace(15)
              //     ],
              //   ],
              // ),
              // const TltYSpace(10),
              // TltDropdownButton(
              //   // buttonHeight: 55,
              //   disabledHint: const Icon(TltIcons.slash),
              //   iconOnClick: const Icon(TltIcons.slash),
              //   itemHeight: 40,
              //   buttonPadding: const EdgeInsets.all(20),
              //   // itemPadding: EdgeInsets.symmetric(vertical: 30),
              //   // customButton: TltAvatar(),
              //   onMenuStateChange: (isOpen) {
              //     if (isOpen) {
              //       print('open');
              //     }
              //   },
              //   // itemPadding: EdgeInsets.all(20),
              //   scrollbarVisibility: TltVisibility.onInteraction,
              //   underline: const Divider(
              //     color: TltColors.black,
              //     height: 2,
              //   ),
              //   style: TextStyle(fontSize: 16),
              //   // dropdownPadding: EdgeInsets.all(22),
              //   // buttonPadding: const EdgeInsets.all(22),
              //   buttonWidth: 200,
              //   dropdownDecoration: BoxDecoration(
              //     // borderRadius: BorderRadius.circular(20),
              //     border: Border.all(
              //       color: TltColors.orange[300],
              //     ),
              //   ),
              //   enableFeedback: true,
              //   // customButton: Text('hi you'),
              //   hint: const Text("select any item"),
              //   autofocus: true,
              //   dropdownWidth: 300,
              //   dropdownMaxHeight: 150,
              //   icon: Icon(TltIconsNew.card_add),
              //   iconSize: 20,
              //   itemHoverColor: const Color.fromRGBO(253, 220, 171, 1),
              //   iconDisabledColor: TltColors.indigo,
              //   iconEnabledColor: TltColors.white,
              //   buttonDecoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(
              //       width: 2,
              //       color: TltColors.purple[300],
              //     ),
              //     color: TltColors.blue[100],
              //     // backgroundBlendMode: BlendMode.darken,
              //   ),
              //   alignment: Alignment.centerRight,
              //   value: dropDownValue,
              //   isExpanded: false,
              //   items: [
              //     for (int i = 0; i < 10; i++)
              //       DropdownMenuItem(
              //         value: "Item $i",
              //         onTap: () {},
              //         child: Text("Item $i"),
              //       ),
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       dropDownValue = value!;
              //     });
              //   },
              // ),
              // const TltYSpace(20),
              // Container(
              //   decoration: BoxDecoration(color: TltColors.violet[300]),
              //   child: TltCircularProgressIndicator(
              //     animationCurve: Curves.bounceInOut,
              //     activeColor: TltColors.error,
              //     value: 10,
              //     addAutomaticKeepAlive: false,
              //     centerChild: const Icon(TltIcons.Heart),
              //     centerTextStyle: TextStyle(fontSize: 10),
              //     circularStrokeCap: CircularStrokeCap.round,
              //     showCenter: false,
              //     width: 20,
              //     inActiveColor: TltColors.blue,
              //     radius: 70,
              //     centerLabel: 'Heart beat',
              //     startAngle: 20,
              //     reverse: true,
              //     arcType: TltArcType.half,
              //     centerLabelStyle: TltStyles.labelS,
              //     // animationDuration: 3,
              //     // animation: false,
              //   ),
              // ),
              // const TltYSpace(20),
              // Container(
              //   decoration: BoxDecoration(color: TltColors.violet[400]),
              //   child: TltLinearProgressIndicator(
              //     activeColor: TltColors.gray,
              //     // isRTL: true,
              //     // animation: false,
              //     value: 87,
              //     // tooltip: ,
              //     // tooltip: Text('87'),
              //     showTooltipAbove: false,
              //     tooltipMode: TltVisibility.always,
              //     trailing: Text('data'),
              //     trailingLeftSpacing: 60,
              //     width: 200,
              //     trailingPosition: TltProgressIndicatorTrailPosition.bottomRight,
              //     padding: EdgeInsets.all(30),
              //     tooltipTextStyle: TextStyle(fontSize: 36),
              //   ),
              // ),
              // TlTRadio(
              //   size: 30,
              //   value: 'qw',
              //   groupValue: 'qw',
              //   onChanged: (value) {},
              // ),
              // const TltYSpace(20),
              // TltCircularProgressIndicator(
              //   radius: 100,
              //   value: 20,
              //   arcType: TltArcType.half,
              //   width: 20,
              // ),
              // const TltYSpace(20),
              // StatefulBuilder(builder: (context, setState) {
              //   return TltSlider(
              //     value: sliderValue,
              //     onChanged: (value) {
              //       setState(
              //         () {
              //           sliderValue = value;
              //         },
              //       );
              //     },
              //   );
              // }),
              // const TltYSpace(20),
              // StatefulBuilder(builder: (context, setState) {
              //   return Row(
              //     children: [
              //       for (int i = 0; i < radioActiveValue.length; i++)
              //         Radio(
              //           // autofocus: true,
              //           focusColor: TltColors.error[300],
              //           activeColor: TltColors.pink[400],
              //           fillColor:
              //               const MaterialStatePropertyAll(TltColors.success),
              //           materialTapTargetSize: MaterialTapTargetSize.padded,
              //           mouseCursor: MaterialStateMouseCursor.clickable,
              //           // toggleable: radioGroupValue.isEmpty,
              //           splashRadius: 20,
              //           visualDensity: VisualDensity.compact,
              //           hoverColor: TltColors.violet[800],
              //           overlayColor: MaterialStatePropertyAll(TltColors.pink),
              //           value: radioActiveValue[i],
              //           groupValue: radioGroupValue,
              //           onChanged: (value) {
              //             setState(
              //               () {
              //                 radioGroupValue = value!;
              //               },
              //             );
              //           },
              //         )
              //     ],
              //   );
              // }),
              // const TltYSpace(20),
              // StatefulBuilder(builder: (context, setState) {
              //   return Column(
              //     children: [
              //       for (int i = 0; i < radioActiveValue.length; i++)
              //         TlTRadioListTile(
              //           activeColor: TltColors.error,
              //           disableButton: false,
              //           contentPadding: EdgeInsets.all(20),
              //           controlAffinity: ListTileControlAffinity.leading,
              //           value: radioActiveValue[i],
              //           selectedTileColor: TltColors.indigo,
              //           groupValue: radioGroupValue,
              //           selected: i == 0,
              //           tileColor: TltColors.blueLight,
              //           subtitle: const Text('data'),
              //           secondary: const Text('sec'),
              //           // isThreeLine: true,
              //           onChanged: (value) {
              //             setState(
              //               () {
              //                 radioGroupValue = value!;
              //               },
              //             );
              //           },
              //         ),
              //     ],
              //   );
              // }),
              // const TltYSpace(20),
              // StatefulBuilder(builder: (context, setState) {
              //   return Row(
              //     children: [
              //       for (int i = 0; i < checkBoxList.length; i++) ...[
              //         TltCheckbox(
              //           iconColor: TltColors.purple,
              //           size: 50,
              //           splashRadius: 20,
              //           activeBorderColor: TltColors.orange,
              //           borderRadius: 2,
              //           fillColor: TltColors.error[200],
              //           value: checkBoxList[i],
              //           onChanged: (value) {
              //             setState(
              //               () {
              //                 checkBoxList[i] = !checkBoxList[i];
              //               },
              //             );
              //           },
              //         ),
              //         const TltXSpace(30)
              //       ]
              //     ],
              //   );
              // }),
              // const TltYSpace(20),
              // DropdownButton(
              //   // buttonHeight: 55,
              //   // menuMaxHeight: 55,
              //   borderRadius: BorderRadius.circular(20),
              //   elevation: 4,
              //   disabledHint: const Icon(TltIcons.slash),
              //   padding: const EdgeInsets.all(22),
              //   // buttonWidth: 200,
              //   // dropdownDecoration: BoxDecoration(
              //   //   borderRadius: BorderRadius.circular(20),
              //   //   border: Border.all(
              //   //     color: TltColors.orange[300],
              //   //   ),
              //   // ),
              //   dropdownColor: TltColors.error[300],
              //   focusColor: TltColors.indigo[100],
              //   // itemHeight: 50,
              //   enableFeedback: true,
              //   menuMaxHeight: 300,
              //   // customButton: Text('hi you'),
              //   hint: const Text("select any item"),
              //   autofocus: true,
              //   // dropdownWidth: 300,
              //   // dropdownMaxHeight: 150,
              //   icon: Icon(TltIcons.Vector_Stroke_1),
              //   iconSize: 20,
              //   // itemHoverColor: TltColors.orange[200],
              //   iconDisabledColor: TltColors.indigo,
              //   iconEnabledColor: TltColors.error,
              //   // buttonDecoration: BoxDecoration(
              //   //   borderRadius: BorderRadius.circular(20),
              //   //   border: Border.all(
              //   //     width: 2,
              //   //     color: TltColors.purple[300],
              //   //   ),
              //   //   color: TltColors.blue[100],
              //   //   // backgroundBlendMode: BlendMode.darken,
              //   // ),
              //   // alignment: Alignment.centerRight,
              //   value: dropDownValue,
              //   isExpanded: false,
              //   // focusNode: FocusNode(),
              //   // isDense: true,
              //   items: [
              //     for (int i = 0; i < 10; i++)
              //       DropdownMenuItem(
              //         value: "Item $i",
              //         onTap: () {},
              //         child: Text("Item $i"),
              //       ),
              //   ],
              //   onChanged: (value) {
              //     setState(() {
              //       dropDownValue = value!;
              //     });
              //   },
              // ),
              // const TltYSpace(10),
              // const TltYSpace(10),
              // TltTextField(),
              // const TltYSpace(10),
              // // StatefulBuilder(builder: (context, setState) {
              // //   int totalPageCount = 0;
              // //   print('rebuilding');
              // //   setState(
              // //     () {
              // //       totalPageCount =
              // //           int.parse(totalPageTextEditingController.text);
              // //     },
              // //   );
              // //   print('total page count :$totalPageCount');
              // //   return TltPagination(
              // //     currentPage: 1,
              // //     nextButtonChild: Icon(TltIcons.chevrons_right),
              // //     activePageIndicatorDecoration:
              // //         BoxDecoration(borderRadius: BorderRadius.circular(100)),
              // //     // activeLabelStyle:
              // //     //     TextStyle(fontSize: 32, color: TltColors.gray[900]),
              // //     // activePageIndicatorDecoration: BoxDecoration(
              // //     //   // borderRadius: BorderRadius.circular(100),
              // //     //   shape: BoxShape.circle,
              // //     //   border: Border.all(width: 5, color: Colors.black),
              // //     //   // color: TltColors.indigo,
              // //     // ),
              // //     // selectedBgColor: TltColors.pink,
              // //     // unSelectedBgColor: TltColors.purple,
              // //     // previousButtonDecoration: BoxDecoration(color: TltColors.black),
              // //     // paginationAlignment: Alignment.topCenter,
              // //     // elementHeight: 50,
              // //     // elementWidth: 40,
              // //     // paginationSize: TltPaginationSize.compact,
              // //     // paginationType: TltPaginationType.cardButton,
              // //     // nextButtonDecoration: BoxDecoration(color: TltColors.blueLight),
              // //     // pageIndicatorShape: BoxShape.circle,
              // //     // navigationButtonDecoration: BoxDecoration(
              // //     //     // borderRadius: BorderRadius.circular(100),
              // //     //     color: TltColors.orange[100]),
              // //     // // indicatorBorderRadius: BorderRadius.circular(100),
              // //     // inactivePageIndicatorDecoration: BoxDecoration(
              // //     //   // borderRadius: BorderRadius.circular(100),
              // //     //   shape: BoxShape.circle,
              // //     //   border: Border.all(width: 5, color: Colors.black),
              // //     //   color: TltColors.gray[200],
              // //     // ),
              // //     // inActiveLabelStyle:
              // //     //     TextStyle(fontSize: 22, color: TltColors.gray[900]),
              // //     totalPages: totalPageCount,
              // //     onTap: [
              // //       for (int i = 1; i <= totalPageCount; i++) () {},
              // //     ],
              // //   );
              // // }),
              // const Text('Old widget'),
              // const TltYSpace(10),
              // TltPagination(
              //   paginationType: TltPaginationType.cardButton,
              //   currentPage: 7,
              //   totalPages: 10,
              //   onTap: [
              //     for (int i = 1; i <= 10; i++) () {},
              //   ],
              // ),
              // const TltYSpace(10),
              // const Text('New widget', overflow: TextOverflow.ellipsis),
              // // const TltYSpace(10),
              // // const Tooltip(
              // //   showDuration: Duration(seconds: 2),
              // //   // waitDuration: Duration(seconds: 1),
              // //   message: 'Next 5 pages',
              // //   // richMessage:
              // //   //     const TextSpan(text: 'Next 5 pages'),
              // //   child: Icon(
              // //     TltIcons.chevrons_right,
              // //     color: TltColors.gray,
              // //   ),
              // // ),
              // const TltYSpace(30),
              // TltCustomPagination(
              //   pageSkipType: TltPageSkipType.arrow,
              //   paginationType: TltPaginationType.minimal,
              //   currentPage: 99,
              //   totalPages: 100,
              //   onTap: [
              //     for (int i = 1; i <= 100; i++) () {},
              //   ],
              // ),
              // const TltYSpace(10),
              // TltLinearProgressIndicator(
              //   // animation: false,
              //   value: 60,
              //   activeColor: TltColors.pink,
              //   animation: true,
              //   addAutomaticKeepAlive: true,
              //   animationDuration: 5,
              //   ///duriation is whetejhere sec or milli sec??
              //   borderRadius: 100,
              //   height: 20,
              //   inActiveColor: TltColors.orange,
              //   isRTL: true,
              //   showTooltipAbove: false,
              //   tooltipMode: TltVisibility.onInteraction,
              //   tooltip: const Icon(TltIcons.airplay),
              //   // trailing: Text("HIjjjjjjjjjjjjjuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"),
              //   tooltipTextStyle: TextStyle(fontSize: 32),
              //   trailingPosition: TltProgressIndicatorTrailPosition.bottomRight,
              //   trailTextStyle: TextStyle(fontSize: 42),
              //   trailingLeftSpacing: 100,
              //   padding: const EdgeInsets.all(50),
              //   animationCurve: Curves.bounceIn,
              // ),
              // TltCircularProgressIndicator(
              //   animation: false,
              //   value: 60,
              // ),
              // SizedBox(
              //   height: 400,
              //   width: double.infinity,
              //   child: TltDataTable(
              //     columns: [
              //       for (int i = 0; i < 5; i++)
              //         DataColumn(
              //           label: Text('column$i'),
              //         ),
              //     ],
              //     rows: [
              //       for (int i = 0; i < 100; i++)
              //         DataRow(
              //           cells: [
              //             for (int x = 0; x < 5; x++)
              //               DataCell(
              //                 Text('row$i cell$x'),
              //               ),
              //           ],
              //         ),
              //     ],
              //   ),
              // ),
              // Row(
              //   children: [
              //     for (int i = 0; i < 10; i++)
              //       Radio(
              //         hoverColor: TltColors.error,
              //         overlayColor: MaterialStatePropertyAll(TltColors.blueLight),
              //         value: "Item ${i + 1}",
              //         groupValue: radioValue,
              //         onChanged: (value) {
              //           setState(() {
              //             radioValue = value!;
              //           });
              //         },
              //       ),
              //     TlTRadio(
              //       activeColor: TltColors.gray,
              //       autofocus: true,
              //       fillColor: MaterialStatePropertyAll(TltColors.blueLight),
              //       // overlayColor: MaterialStatePropertyAll(TltColors.violet),
              //       // focusColor: TltColors.success,
              //       hoverColor: TltColors.success,
              //       value: "Item ${2 + 1}",
              //       // mouseCursor: MouseCursor.defer,
              //       // splashRadius: 10,
              //       groupValue: radioValue,
              //       onChanged: (value) {
              //         setState(() {
              //           radioValue = value!;
              //         });
              //       },
              //     ),
              //   ],
              // ),
              // const TltYSpace(8),
              // TltSlider(
              //   activeTrackColor: TltColors.gray,
              //   thumbElevation: 8,
              //   divisions: 3,
              //   value: sliderValue,
              //   inactiveTrackColor: TltColors.purple,
              //   thumbSize: 33,
              //   label: 'Progress',
              //   thumbColor: TltColors.error,
              //   trackHeight: 40,
              //   valueIndicatorColor: TltColors.success,
              //   overlayRadius: 20,
              //   onChanged: (value) {
              //     setState(() {
              //       sliderValue = value;
              //     });
              //   },
              // ),
              // const TltYSpace(10),
              // TltSwitch(
              //   value: switchValue,
              //   onToggle: (value) {
              //     setState(() {
              //       switchValue = value;
              //     });
              //   },
              // ),
              // const TltYSpace(10),
              // TltTooltip(
              //   message: "heart icon",
              //   child: const Icon(TltIcons.Heart),
              // ),
              // const TltYSpace(10),
              // // TltBadge(
              // //   onTap: _incrementCounter,
              // //   label: const Text("add"),
              // //   prefix: const Icon(Icons.add),
              // // ),
              // // TltButton(text: 'add', onTap: _incrementCounter),
            ],
          ),
        ),
      ),
    );
  }
}
