import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tlt_design/src/foundations/colors.dart';

import 'calendar_header_styles.dart';
import 'calendar_utils.dart';
import 'tlt_custom_icon_button.dart';

class TltCalendarHeader extends StatelessWidget {
  final dynamic locale;
  final DateTime focusedMonth;
  final CalendarFormat calendarFormat;
  final TltHeaderStyle headerStyle;
  final VoidCallback onLeftChevronTap;
  final VoidCallback onRightChevronTap;
  final VoidCallback onHeaderTap;
  final VoidCallback onHeaderLongPress;
  final ValueChanged<CalendarFormat> onFormatButtonTap;
  final Map<CalendarFormat, String> availableCalendarFormats;
  final DayBuilder? headerTitleBuilder;

  const TltCalendarHeader({
    Key? key,
    this.locale,
    required this.focusedMonth,
    required this.calendarFormat,
    required this.headerStyle,
    required this.onLeftChevronTap,
    required this.onRightChevronTap,
    required this.onHeaderTap,
    required this.onHeaderLongPress,
    required this.onFormatButtonTap,
    required this.availableCalendarFormats,
    this.headerTitleBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = headerStyle.titleTextFormatter?.call(focusedMonth, locale) ??
        DateFormat.yMMMM(locale).format(focusedMonth);

    return Container(
      decoration: headerStyle.decoration,
      margin: headerStyle.headerMargin,
      padding: headerStyle.headerPadding,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (headerStyle.leftChevronVisible)
            TltCustomIconButton(
              icon: headerStyle.leftChevronIcon,
              onTap: onLeftChevronTap,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.only(left: 14),
            ),
          headerTitleBuilder?.call(context, focusedMonth) ??
              GestureDetector(
                onTap: onHeaderTap,
                onLongPress: onHeaderLongPress,
                child: Text(
                  text,
                  style: TextStyle(
                    color: TltColors.gray[100],
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                  textAlign: headerStyle.titleCentered
                      ? TextAlign.center
                      : TextAlign.start,
                ),
              ),
          // if (headerStyle.formatButtonVisible &&
          //     availableCalendarFormats.length > 1)
          //   Padding(
          //     padding: const EdgeInsets.only(left: 8.0),
          //     child: TltFormatButton(
          //       onTap: onFormatButtonTap,
          //       availableCalendarFormats: availableCalendarFormats,
          //       calendarFormat: calendarFormat,
          //       decoration: headerStyle.formatButtonDecoration,
          //       padding: headerStyle.formatButtonPadding,
          //       textStyle: headerStyle.formatButtonTextStyle,
          //       showsNextFormat: headerStyle.formatButtonShowsNext,
          //     ),
          //   ),
          if (headerStyle.rightChevronVisible)
            TltCustomIconButton(
              icon: headerStyle.rightChevronIcon,
              onTap: onRightChevronTap,
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.only(right: 14),
            ),
        ],
      ),
    );
  }
}
