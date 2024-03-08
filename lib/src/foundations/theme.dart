import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/utils/properties.dart';
import 'package:tlt_design/src/foundations/text_styles.dart';

class TltTheme {
  TltTheme._privateTheme();
  static final TltTheme _tltTheme = TltTheme._privateTheme();
  static TltTheme get instance => _tltTheme;

  Color primaryColor = TltColors.blue[500];

  Color primaryButtonHoverColor = TltColors.blue[700];
  Color primaryButtonSplashColor = TltColors.blue[500];
  Color primaryButtonHighlightColor = TltColors.blue[700];
  Color primaryButtonBorderColor = TltColors.transparent;
  Color primaryButtonTextColor = TltColors.gray[25];

  Color secondaryColor = TltColors.blue[50];

  Color secondaryButtonHoverColor = TltColors.blue[100];
  Color secondaryButtonSplashColor = TltColors.blue[100];
  Color secondaryButtonHighlightColor = TltColors.blue[100];
  Color secondaryButtonBorderColor = TltColors.transparent;
  Color secondaryButtonTextColor = TltColors.blue[700];

  Color outlineButtonColor = TltColors.transparent;
  Color outlineButtonHoverColor = TltColors.gray[50];
  Color outlineButtonSplashColor = TltColors.gray[100];
  Color outlineButtonHighlightColor = TltColors.gray[100];
  Color outlineButtonBorderColor = TltColors.gray[700];
  Color outlineButtonTextColor = TltColors.gray[700];

  TextStyle heading1 = TltStyles.heading1;
  TextStyle heading2 = TltStyles.heading2;
  TextStyle heading3 = TltStyles.heading3;
  TextStyle heading4 = TltStyles.heading4;
  TextStyle heading5 = TltStyles.heading5;
  TextStyle heading6 = TltStyles.heading6;
  TextStyle subheading1 = TltStyles.subheading1;
  TextStyle subheading2 = TltStyles.subheading2;
  TextStyle lead1 = TltStyles.lead1;
  TextStyle lead2 = TltStyles.lead2;
  TextStyle body1 = TltStyles.body1;
  TextStyle body2 = TltStyles.body2;
  TextStyle labelXL = TltStyles.labelXL;
  TextStyle labelL = TltStyles.labelL;
  TextStyle labelM = TltStyles.labelM;
  TextStyle labelS = TltStyles.labelS;
  TextStyle labelXS = TltStyles.labelXS;

  TltButtonType buttonType = TltButtonType.primary;
  TltSize buttonSize = TltSize.md;
  double? buttonHeight;
  EdgeInsetsGeometry? buttonPadding;
  BorderRadius buttonBorderRadius = const BorderRadius.all(Radius.circular(8));
  EdgeInsetsGeometry buttonMargin = const EdgeInsets.all(0);

  Color checkboxFillColor = TltColors.blue[25];
  Color checkboxIconColor = TltColors.blue[600];
  Color checkboxActiveBorderColor = TltColors.blue[500];
  Color checkboxInactiveBorderColor = TltColors.gray[300];
  Color checkboxSplashColor = TltColors.blue[50];
  double checkboxBorderRadius = 6;
  double checkboxSize = 20;

  double blurAmount = 5;
  Color blurColor = TltColors.white;
  BorderRadius blurBorderRadius = BorderRadius.zero;
  double blurColorOpacity = 0.5;
  AlignmentGeometry blurOverlayAlignment = Alignment.center;
  Clip blurClipBehavior = Clip.hardEdge;

  double sliderTrackHeight = 8;
  Color sliderActiveTrackColor = TltColors.blue[500];
  Color sliderInactiveTrackColor = TltColors.gray[200];
  double? sliderThumbSize;
  Color sliderThumbColor = TltColors.white;
  double sliderThumbElevation = 2;
  double sliderOverlayRadius = 0;
  TltSliderIndicatorMode sliderValueIndicatorMode =
      TltSliderIndicatorMode.tooltip;
  Color sliderValueIndicatorColor = TltColors.white;
  TextStyle sliderValueIndicatorTextStyle = TltStyles.labelS;

  TltSize avatarSize = TltSize.md;
  Color avatarBackgroundColor = TltColors.blue[25];
  Color avatarFocusColor = TltColors.blue[100];
  // Widget avatarChild = const Icon(TltIcons.user, color: TltColors.blue);   //TODO
  Color avatarForegroundColor = TltColors.black;
  Color avatarIndicatorColor = TltColors.success;
  double avatarIndicatorSize = 20;

  Color badgeBackgroundColor = TltColors.blue[50];
  Color badgeCheckMarkColor = TltColors.white;
  double badgeCheckMarkSize = 8;
  double badgeContentSpacing = 6;
  EdgeInsets badgePadding =
      const EdgeInsets.symmetric(horizontal: 9, vertical: 5);
  Color badgeSelectedColor = TltColors.blue;
  String badgeSuffixTooltip = "suffix on tap";

  double relativeAddOnHeight = 46;

  double dropdownMenuItemHeight = 44;
  double dropdownButtonHeight = 44;
  Color dropdownSelectedItemColor = TltColors.blue[500];
  EdgeInsets dropdownPadding = const EdgeInsets.symmetric(horizontal: 14);

  BoxDecoration dropdownButtonDecoration = const BoxDecoration(
    color: TltColors.white,
    boxShadow: [
      BoxShadow(
        color: Color(0x0B101828),
        blurRadius: 6,
        offset: Offset(0, 4),
        spreadRadius: -2,
      ),
      BoxShadow(
        color: Color(0x18101828),
        blurRadius: 16,
        offset: Offset(0, 12),
        spreadRadius: -4,
      )
    ],
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  Duration dropdownMenuDuration = const Duration(milliseconds: 300);
  TextStyle dropdownStyle =
      TltStyles.body1.copyWith(color: TltColors.gray[900]);

  TltAddOnDecoration defaultAddOnBeforeDecoration = TltAddOnDecoration(
    border: Border(
      bottom: BorderSide(
        color: TltColors.gray[300],
        width: 1.5,
      ),
      left: BorderSide(
        color: TltColors.gray[300],
        width: 1.5,
      ),
      top: BorderSide(
        color: TltColors.gray[300],
        width: 1.5,
      ),
    ),
  );
  TltAddOnDecoration defaultAddOnAfterDecoration = TltAddOnDecoration(
    border: Border(
      bottom: BorderSide(
        color: TltColors.gray[300],
        width: 1.5,
      ),
      right: BorderSide(
        color: TltColors.gray[300],
        width: 1.5,
      ),
      top: BorderSide(
        color: TltColors.gray[300],
        width: 1.5,
      ),
    ),
  );

  InputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: TltColors.gray[300],
      width: 1.5,
    ),
  );
  InputBorder inputEnabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: TltColors.gray[300],
      width: 1.5,
    ),
  );
  InputBorder inputFocusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: TltColors.blue[400],
      width: 2,
    ),
  );
  InputBorder inputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: TltColors.error[400],
      width: 1.5,
    ),
  );
  InputBorder inputFocusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: TltColors.error[400],
      width: 2,
    ),
  );
  InputBorder inputDisabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: TltColors.gray[200],
      width: 1.5,
    ),
  );

  TextStyle inputStyle = TltStyles.body1.copyWith(color: TltColors.gray[800]);
  TextStyle inputErrorStyle =
      TltStyles.body2.copyWith(color: TltColors.error[500]);
  TextStyle inputLabelStyle = TltStyles.lead2;
  TextStyle inputHelperStyle =
      TltStyles.body2.copyWith(color: TltColors.gray[500]);
  TextStyle inputHintStyle =
      TltStyles.body1.copyWith(color: TltColors.gray[500]);
  EdgeInsetsGeometry inputContentPadding = const EdgeInsets.symmetric(
    horizontal: 14,
    vertical: 15,
  );

  Color progressIndicatorBackgroundColor = TltColors.transparent;
  Color progressIndicatorActiveColor = TltColors.blue;
  Color progressIndicatorFillColor = TltColors.blue[50];
  Color progressIndicatorCenterTextColor = TltColors.gray[900];
  Color progressIndicatorCenterLabelColor = TltColors.gray[500];
  Color progressIndicatorTrailTextColor = TltColors.gray[700];
  Color progressIndicatorTooltipTextColor = TltColors.gray[700];
  double progressIndicatorValue = 0.00001;
  double progressIndicatorLineWidth = 5.0;
  double progressIndicatorLineHeight = 8.0;
  double progressIndicatorStartAngle = 0.0;
  double progressIndicatorRadius = 34.0;
  int progressIndicatorAnimationDuration = 1000;
  Curve progressIndicatorAnimationCurve = Curves.easeOut;
  CircularStrokeCap progressIndicatorCircularStrokeCap =
      CircularStrokeCap.round;
  TltProgressIndicatorTrailPosition progressIndicatorTrailPosition =
      TltProgressIndicatorTrailPosition.centerRight;
  double progressIndicatorTrailingLeftSpacing = 10.0;
  EdgeInsets progressIndicatorPadding = const EdgeInsets.all(0);
  TltVisibility progressIndicatorTooltipMode = TltVisibility.onInteraction;

  // BoxDecoration tooltipDecoration = BoxDecoration(
  //   color: TltColors.white,
  //   borderRadius: BorderRadius.circular(8),
  //   boxShadow: TltShadow.md(),
  // );
  // TltArrowPosition tooltipArrowPosition = TltArrowPosition.hide;
  TextStyle tooltipMessageTextStyle = TextStyle(
    color: TltColors.gray[500],
    fontSize: 12,
  );
  TextStyle tooltipTitleTextStyle = TextStyle(
      color: TltColors.gray[700], fontSize: 12, fontWeight: FontWeight.w500);
  double tooltipTitleMessageSpace = 5;

  double toggleWidth = 37;
  double toggleHeight = 13;
  double toggleThumbSize = 19;
  BorderRadius toggleBorderRadius = BorderRadius.circular(100);
  TextStyle toggleOnOffTextStyle = TextStyle(
    color: TltColors.gray[500],
    fontSize: 12,
  );
  Color toggleActiveColor = TltColors.success[400];
  Color toggleInActiveColor = TltColors.gray[100];
  Color toggleActiveThumbColor = TltColors.white;
  Color toggleInActiveThumbColor = TltColors.white;
  Color disabledToggleColor = TltColors.gray[100];
  Color toggleThumbColor = TltColors.white;
  Color disabledThumbColor = TltColors.gray[200];
  Color disabledContentColor = TltColors.gray[400];
  Color activeContentColor = TltColors.success[400];
  Color inActiveContentColor = TltColors.gray[400];
  String toggleActiveText = "On";
  String toggleInActiveText = "Off";
  TextStyle toggleActiveTextStyle = TextStyle(
    color: TltColors.success[400],
    fontSize: 6,
    fontWeight: FontWeight.w900,
  );
  TextStyle toggleInActiveTextStyle = TextStyle(
    color: TltColors.gray[400],
    fontSize: 6,
    fontWeight: FontWeight.w900,
  );
  Duration toggleAnimationDuration = const Duration(milliseconds: 300);
  DragStartBehavior dragStartBehavior = DragStartBehavior.start;
  // Color toggleInActiveTextColor = TltColors.blue;
  // Color toggleActiveTextColor = TltColors.blue;
  // Color toggleActiveTextColor = TltColors.blue;
  // Border toggleBorder = Border.all();
  // BorderRadius toggleThumbRadius = BorderRadius.circular(10);
  // Border toggleThumbBorder = Border.all();
  // EdgeInsets toggleThumbPadding = const EdgeInsets.all(0);

  Color breadCrumbDefaultColor = TltColors.gray[500];
  Color breadCrumbHoverColor = TltColors.gray[900];
  Color breadCrumbActiveColor = TltColors.blue[500];
  TltBreadCrumbSeparator breadCrumbSeparator = TltBreadCrumbSeparator.arrow;
  double breadCrumbSeparatorSize = 17;
  int breadCrumbNumberOfVisibleElements = 3;
  TextStyle breadCrumbTextStyle =
      const TextStyle(fontSize: 17, fontWeight: FontWeight.w500);
  EdgeInsets breadCrumbPadding = const EdgeInsets.all(10);
  EdgeInsets breadCrumbDropdownMenuItemPadding = const EdgeInsets.all(0);
  double breadCrumbDropdownMenuItemWidth = 100;
  Color? breadCrumbSelectedMenuItemColor;

  TltTabDecoration tabDecoration = TltTabDecoration.underline;
  Color tabActiveIndicatorColor = TltColors.blue[600];
  Color tabInactiveIndicatorColor = const Color(0xFFDDE1E6);
  Color tabSelectedColor = TltColors.blue[25];
  Color tabUnSelectedLabelColor = TltColors.gray[500];
  Color tabSelectedLabelColor = TltColors.blue[600];
  double tabElementWidth = 100;
  double tabElementHeight = 45;
  EdgeInsets tabsPadding = const EdgeInsets.all(12);
  Duration? tabsAnimationDuration;
  TextStyle tabsSelectedLabelStyle = const TextStyle(fontSize: 15);
  TextStyle tabsUnSelectedLabelStyle = const TextStyle(fontSize: 15);
  BorderRadius tabSplashBorderRadius = BorderRadius.circular(8);

  TltPaginationSize paginationSize = TltPaginationSize.expanded;
  BoxDecoration paginationInactivePageIndicatorMinimalDecoration =
      const BoxDecoration(
          // borderRadius: BorderRadius.all(Radius.circular(8)),
          );
  TltPageSkipType pageSkipType = TltPageSkipType.none;
  BoxDecoration paginationActivePageIndicatorMinimalDecoration = BoxDecoration(
    color: TltColors.blue[600],
    // borderRadius: const BorderRadius.all(Radius.circular(8)),
  );
  BoxDecoration paginationInactivePageIndicatorCardButtonDecoration =
      BoxDecoration(
    border: Border.all(color: TltColors.gray[300], width: 0.5),
    // border: BorderDirectional(
    //   bottom: BorderSide(color: TltColors.gray[300], width: 1),
    //   start: BorderSide(color: TltColors.gray[300], width: 1),
    //   top: BorderSide(color: TltColors.gray[300], width: 1),
    // ),
    color: TltColors.gray[25],
  );
  BoxDecoration paginationActivePageIndicatorCardButtonDecoration =
      BoxDecoration(
    border: Border.all(color: TltColors.gray[300], width: 0.5),
    // border: BorderDirectional(
    //   bottom: BorderSide(color: TltColors.gray[300], width: 1),
    //   start: BorderSide(color: TltColors.gray[300], width: 1),
    //   top: BorderSide(color: TltColors.gray[300], width: 1),
    // ),
    color: TltColors.gray[100],
  );
  BoxShape paginationIndicatorShape = BoxShape.rectangle;
  BorderRadius paginationIndicatorBorderRadius = BorderRadius.circular(8);
  TltPaginationType paginationType = TltPaginationType.minimal;
  Alignment paginationAlignment = Alignment.center;
  double paginationElementHeight = 40;
  double paginationElementWidth = 40;
  TextStyle paginationActiveLabelStyle = const TextStyle(
    fontWeight: FontWeight.w500,
  );
  TextStyle paginationInActiveLabelStyle =
      TextStyle(fontWeight: FontWeight.w500, color: TltColors.gray[400]);
  BoxDecoration paginationPreviousButtonDecoration = BoxDecoration(
    borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(8), topLeft: Radius.circular(8)),
    color: TltColors.gray[25],
    border: Border.all(
      color: TltColors.gray[300],
      width: 0.5,
    ),
  );
  BoxDecoration paginationNextButtonDecoration = BoxDecoration(
    borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(8), topRight: Radius.circular(8)),
    color: TltColors.gray[25],
    border: Border.all(
      color: TltColors.gray[300],
      width: 0.5,
    ),
  );
  BoxDecoration paginationNavigationButtonDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(8),
    color: TltColors.gray[25],
    border: Border.all(
      color: TltColors.gray[300],
      width: 0.5,
    ),
  );
  int paginationNumberOfVisibleElements = 6;
  // EdgeInsets paginationElementPadding = const EdgeInsets.all(10);
}
