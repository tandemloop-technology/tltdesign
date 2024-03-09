import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tlt_design/src/components/badge.dart';
import 'package:tlt_design/src/foundations/colors.dart';

import 'calendar_header_styles.dart';
// import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'calendar_simple_gesture_detector.dart';
import 'calendar_utils.dart';
import 'celandar_days_of_week_style.dart';
import 'tlt_calendar_base.dart';
import 'tlt_calendar_builder.dart';
import 'tlt_calendar_cell_content.dart';
import 'tlt_calendar_header.dart';
import 'tlt_calendar_style.dart';

/// Signature for `onDaySelected` callback. Contains the selected day and focused day.
typedef OnDaySelected = void Function(
    DateTime selectedDay, DateTime focusedDay);

/// Signature for `onRangeSelected` callback.
/// Contains start and end of the selected range, as well as currently focused day.
typedef OnRangeSelected = void Function(
    DateTime? start, DateTime? end, DateTime focusedDay);

/// Modes that range selection can operate in.
enum RangeSelectionMode { disabled, toggledOff, toggledOn, enforced }

/// Highly customizable, feature-packed Flutter calendar with gestures, animations and multiple formats.
class TltTableCalendar<T> extends StatefulWidget {
  /// Locale to format TltTableCalendar` dates with, for example: `'en_US'`.
  ///
  /// If nothing is provided, a default locale will be used.
  final dynamic locale;

  /// The start of the selected day range.
  final DateTime? rangeStartDay;

  /// The end of the selected day range.
  final DateTime? rangeEndDay;

  /// DateTime that determines which days are currently visible and focused.
  final DateTime focusedDay;

  /// The first active day of `TltTableCalendar`.
  /// Blocks swiping to days before it.
  ///
  /// Days before it will use `disabledStyle` and trigger `onDisabledDayTapped` callback.
  final DateTime firstDay;

  /// The last active day of `TltTableCalendar`.
  /// Blocks swiping to days after it.
  ///
  /// Days after it will use `disabledStyle` and trigger `onDisabledDayTapped` callback.
  final DateTime lastDay;

  /// DateTime that will be treated as today. Defaults to `DateTime.now()`.
  ///
  /// Overriding this property might be useful for testing.
  final DateTime? currentDay;

  /// List of days treated as weekend days.
  /// Use built-in `DateTime` weekday constants (e.g. `DateTime.monday`) instead of `int` literals (e.g. `1`).
  final List<int> weekendDays;

  /// Specifies `TltTableCalendar`'s current format.
  final CalendarFormat calendarFormat;

  /// `Map` of `CalendarFormat`s and `String` names associated with them.
  /// Those `CalendarFormat`s will be used by internal logic to manage displayed format.
  ///
  /// To ensure proper vertical swipe behavior, `CalendarFormat`s should be in descending order (i.e. from biggest to smallest).
  ///
  /// For example:
  /// ```dart
  /// availableCalendarFormats: const {
  ///   CalendarFormat.month: 'Month',
  ///   CalendarFormat.week: 'Week',
  /// }
  /// ```
  final Map<CalendarFormat, String> availableCalendarFormats;

  /// Determines the visibility of calendar header.
  final bool headerVisible;

  /// Determines the visibility of the row of days of the week.
  final bool daysOfWeekVisible;

  /// When set to true, tapping on an outside day in `CalendarFormat.month` format
  /// will jump to the calendar page of the tapped month.
  final bool pageJumpingEnabled;

  /// When set to true, updating the `focusedDay` will display a scrolling animation
  /// if the currently visible calendar page is changed.
  final bool pageAnimationEnabled;

  /// When set to true, `CalendarFormat.month` will always display six weeks,
  /// even if the content would fit in less.
  final bool sixWeekMonthsEnforced;

  /// When set to true, `TltTableCalendar` will fill available height.
  final bool shouldFillViewport;

  /// Whether to display week numbers on calendar.
  final bool weekNumbersVisible;

  /// Used for setting the height of `TltTableCalendar`'s rows.
  final double rowHeight;

  /// Used for setting the height of `TltTableCalendar`'s days of week row.
  final double daysOfWeekHeight;

  /// Specifies the duration of size animation that takes place whenever `calendarFormat` is changed.
  final Duration formatAnimationDuration;

  /// Specifies the curve of size animation that takes place whenever `calendarFormat` is changed.
  final Curve formatAnimationCurve;

  /// Specifies the duration of scrolling animation that takes place whenever the visible calendar page is changed.
  final Duration pageAnimationDuration;

  /// Specifies the curve of scrolling animation that takes place whenever the visible calendar page is changed.
  final Curve pageAnimationCurve;

  /// `TltTableCalendar` will start weeks with provided day.
  ///
  /// Use `StartingDayOfWeek.monday` for Monday - Sunday week format.
  /// Use `StartingDayOfWeek.sunday` for Sunday - Saturday week format.
  final StartingDayOfWeek startingDayOfWeek;

  /// `HitTestBehavior` for every day cell inside `TltTableCalendar`.
  final HitTestBehavior dayHitTestBehavior;

  /// Specifies swipe gestures available to TltTableCalendar`.
  /// If `AvailableGestures.none` is used, the calendar will only be interactive via buttons.
  final AvailableGestures availableGestures;

  /// Configuration for vertical swipe detector.
  final SimpleSwipeConfig simpleSwipeConfig;

  /// Style for `TltTableCalendar`'s header.
  final TltHeaderStyle headerStyle;

  /// Style for days of week displayed between `TltTableCalendar`'s header and content.
  final TltDaysOfWeekStyle daysOfWeekStyle;

  /// Style for `TltTableCalendar`'s content.
  final TltCalendarStyle calendarStyle;

  /// Set of custom builders for `TltTableCalendar` to work with.
  /// Use those to fully tailor the UI.
  final TltCalendarBuilders<T> calendarBuilders;

  /// Current mode of range selection.
  ///
  /// * `RangeSelectionMode.disabled` - range selection is always off.
  /// * `RangeSelectionMode.toggledOff` - range selection is currently off, can be toggled by longpressing a day cell.
  /// * `RangeSelectionMode.toggledOn` - range selection is currently on, can be toggled by longpressing a day cell.
  /// * `RangeSelectionMode.enforced` - range selection is always on.
  final RangeSelectionMode rangeSelectionMode;

  /// Function that assigns a list of events to a specified day.
  final List<T> Function(DateTime day)? eventLoader;

  /// Function deciding whether given day should be enabled or not.
  /// If `false` is returned, this day will be disabled.
  final bool Function(DateTime day)? enabledDayPredicate;

  /// Function deciding whether given day should be marked as selected.
  final bool Function(DateTime day)? selectedDayPredicate;

  /// Function deciding whether given day is treated as a holiday.
  final bool Function(DateTime day)? holidayPredicate;

  /// Called whenever a day range gets selected.
  final OnRangeSelected? onRangeSelected;

  /// Called whenever any day gets tapped.
  final OnDaySelected? onDaySelected;

  /// Called whenever any day gets long pressed.
  final OnDaySelected? onDayLongPressed;

  /// Called whenever any disabled day gets tapped.
  final void Function(DateTime day)? onDisabledDayTapped;

  /// Called whenever any disabled day gets long pressed.
  final void Function(DateTime day)? onDisabledDayLongPressed;

  /// Called whenever header gets tapped.
  final void Function(DateTime focusedDay)? onHeaderTapped;

  /// Called whenever header gets long pressed.
  final void Function(DateTime focusedDay)? onHeaderLongPressed;

  /// Called whenever currently visible calendar page is changed.
  final void Function(DateTime focusedDay)? onPageChanged;

  /// Called whenever `calendarFormat` is changed.
  final void Function(CalendarFormat format)? onFormatChanged;

  /// Called when the calendar is created. Exposes its PageController.
  final void Function(PageController pageController)? onCalendarCreated;

  /// Called when the calendar cancel button is pressed
  final void Function()? onTapCancel;

  /// Called when the calendar cancel button is pressed
  final void Function()? onTapApply;

  /// Creates a `TltTableCalendar` widget.
  TltTableCalendar({
    Key? key,
    required DateTime focusedDay,
    required DateTime firstDay,
    required DateTime lastDay,
    DateTime? currentDay,
    this.locale,
    this.rangeStartDay,
    this.rangeEndDay,
    this.weekendDays = const [DateTime.saturday, DateTime.sunday],
    this.calendarFormat = CalendarFormat.month,
    this.availableCalendarFormats = const {
      CalendarFormat.month: 'Month',
      CalendarFormat.twoWeeks: '2 weeks',
      CalendarFormat.week: 'Week',
    },
    this.headerVisible = true,
    this.daysOfWeekVisible = true,
    this.pageJumpingEnabled = false,
    this.pageAnimationEnabled = true,
    this.sixWeekMonthsEnforced = false,
    this.shouldFillViewport = false,
    this.weekNumbersVisible = false,
    this.rowHeight = 52.0,
    this.daysOfWeekHeight = 24,
    this.formatAnimationDuration = const Duration(milliseconds: 200),
    this.formatAnimationCurve = Curves.linear,
    this.pageAnimationDuration = const Duration(milliseconds: 300),
    this.pageAnimationCurve = Curves.easeOut,
    this.startingDayOfWeek = StartingDayOfWeek.sunday,
    this.dayHitTestBehavior = HitTestBehavior.opaque,
    this.availableGestures = AvailableGestures.all,
    this.simpleSwipeConfig = const SimpleSwipeConfig(
      verticalThreshold: 25.0,
      swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
    ),
    this.headerStyle = const TltHeaderStyle(),
    this.daysOfWeekStyle = const TltDaysOfWeekStyle(),
    this.calendarStyle = const TltCalendarStyle(),
    this.calendarBuilders = const TltCalendarBuilders(),
    this.rangeSelectionMode = RangeSelectionMode.toggledOff,
    this.eventLoader,
    this.enabledDayPredicate,
    this.selectedDayPredicate,
    this.holidayPredicate,
    this.onRangeSelected,
    this.onDaySelected,
    this.onDayLongPressed,
    this.onDisabledDayTapped,
    this.onDisabledDayLongPressed,
    this.onHeaderTapped,
    this.onHeaderLongPressed,
    this.onPageChanged,
    this.onFormatChanged,
    this.onCalendarCreated,
    this.onTapCancel,
    this.onTapApply,
  })  : assert(availableCalendarFormats.keys.contains(calendarFormat)),
        assert(availableCalendarFormats.length <= CalendarFormat.values.length),
        assert(weekendDays.isNotEmpty
            ? weekendDays.every(
                (day) => day >= DateTime.monday && day <= DateTime.sunday)
            : true),
        focusedDay = normalizeDateUtc(focusedDay),
        firstDay = normalizeDateUtc(firstDay),
        lastDay = normalizeDateUtc(lastDay),
        currentDay = currentDay ?? DateTime.now(),
        super(key: key);

  @override
  _TltTableCalendarState<T> createState() => _TltTableCalendarState<T>();
}

class _TltTableCalendarState<T> extends State<TltTableCalendar<T>> {
  late final PageController _pageController;
  late final ValueNotifier<DateTime> _focusedDay;
  late RangeSelectionMode _rangeSelectionMode;

  DateTime? _firstSelectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = ValueNotifier(widget.focusedDay);
    _rangeSelectionMode = widget.rangeSelectionMode;
  }

  @override
  void didUpdateWidget(TltTableCalendar<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_focusedDay.value != widget.focusedDay) {
      _focusedDay.value = widget.focusedDay;
    }

    if (_rangeSelectionMode != widget.rangeSelectionMode) {
      _rangeSelectionMode = widget.rangeSelectionMode;
    }

    if (widget.rangeStartDay == null && widget.rangeEndDay == null) {
      _firstSelectedDay = null;
    }
  }

  @override
  void dispose() {
    _focusedDay.dispose();
    super.dispose();
  }

  bool get _isRangeSelectionToggleable =>
      _rangeSelectionMode == RangeSelectionMode.toggledOn ||
      _rangeSelectionMode == RangeSelectionMode.toggledOff;

  bool get _isRangeSelectionOn =>
      _rangeSelectionMode == RangeSelectionMode.toggledOn ||
      _rangeSelectionMode == RangeSelectionMode.enforced;

  bool get _shouldBlockOutsideDays =>
      !widget.calendarStyle.outsideDaysVisible &&
      widget.calendarFormat == CalendarFormat.month;

  void _swipeCalendarFormat(SwipeDirection direction) {
    if (widget.onFormatChanged != null) {
      final formats = widget.availableCalendarFormats.keys.toList();

      final isSwipeUp = direction == SwipeDirection.up;
      int id = formats.indexOf(widget.calendarFormat);

      // Order of CalendarFormats must be from biggest to smallest,
      // e.g.: [month, twoWeeks, week]
      if (isSwipeUp) {
        id = min(formats.length - 1, id + 1);
      } else {
        id = max(0, id - 1);
      }

      widget.onFormatChanged!(formats[id]);
    }
  }

  void _onDayTapped(DateTime day) {
    final isOutside = day.month != _focusedDay.value.month;
    if (isOutside && _shouldBlockOutsideDays) {
      return;
    }

    if (_isDayDisabled(day)) {
      return widget.onDisabledDayTapped?.call(day);
    }

    _updateFocusOnTap(day);

    if (_isRangeSelectionOn && widget.onRangeSelected != null) {
      if (_firstSelectedDay == null) {
        _firstSelectedDay = day;
        widget.onRangeSelected!(_firstSelectedDay, null, _focusedDay.value);
      } else {
        if (day.isAfter(_firstSelectedDay!)) {
          widget.onRangeSelected!(_firstSelectedDay, day, _focusedDay.value);
          _firstSelectedDay = null;
        } else if (day.isBefore(_firstSelectedDay!)) {
          widget.onRangeSelected!(day, _firstSelectedDay, _focusedDay.value);
          _firstSelectedDay = null;
        }
      }
    } else {
      widget.onDaySelected?.call(day, _focusedDay.value);
    }
  }

  void _onDayLongPressed(DateTime day) {
    final isOutside = day.month != _focusedDay.value.month;
    if (isOutside && _shouldBlockOutsideDays) {
      return;
    }

    if (_isDayDisabled(day)) {
      return widget.onDisabledDayLongPressed?.call(day);
    }

    if (widget.onDayLongPressed != null) {
      _updateFocusOnTap(day);
      return widget.onDayLongPressed!(day, _focusedDay.value);
    }

    if (widget.onRangeSelected != null) {
      if (_isRangeSelectionToggleable) {
        _updateFocusOnTap(day);
        _toggleRangeSelection();

        if (_isRangeSelectionOn) {
          _firstSelectedDay = day;
          widget.onRangeSelected!(_firstSelectedDay, null, _focusedDay.value);
        } else {
          _firstSelectedDay = null;
          widget.onDaySelected?.call(day, _focusedDay.value);
        }
      }
    }
  }

  void _updateFocusOnTap(DateTime day) {
    if (widget.pageJumpingEnabled) {
      _focusedDay.value = day;
      return;
    }

    if (widget.calendarFormat == CalendarFormat.month) {
      if (_isBeforeMonth(day, _focusedDay.value)) {
        _focusedDay.value = _firstDayOfMonth(_focusedDay.value);
      } else if (_isAfterMonth(day, _focusedDay.value)) {
        _focusedDay.value = _lastDayOfMonth(_focusedDay.value);
      } else {
        _focusedDay.value = day;
      }
    } else {
      _focusedDay.value = day;
    }
  }

  void _toggleRangeSelection() {
    if (_rangeSelectionMode == RangeSelectionMode.toggledOn) {
      _rangeSelectionMode = RangeSelectionMode.toggledOff;
    } else {
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    }
  }

  void _onLeftChevronTap() {
    _pageController.previousPage(
      duration: widget.pageAnimationDuration,
      curve: widget.pageAnimationCurve,
    );
  }

  void _onRightChevronTap() {
    _pageController.nextPage(
      duration: widget.pageAnimationDuration,
      curve: widget.pageAnimationCurve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.headerVisible)
            ValueListenableBuilder<DateTime>(
              valueListenable: _focusedDay,
              builder: (context, value, _) {
                return TltCalendarHeader(
                  headerTitleBuilder:
                      widget.calendarBuilders.headerTitleBuilder,
                  focusedMonth: value,
                  onLeftChevronTap: _onLeftChevronTap,
                  onRightChevronTap: _onRightChevronTap,
                  onHeaderTap: () => widget.onHeaderTapped?.call(value),
                  onHeaderLongPress: () =>
                      widget.onHeaderLongPressed?.call(value),
                  headerStyle: widget.headerStyle,
                  availableCalendarFormats: widget.availableCalendarFormats,
                  calendarFormat: widget.calendarFormat,
                  locale: widget.locale,
                  onFormatButtonTap: (format) {
                    assert(
                      widget.onFormatChanged != null,
                      'Using `FormatButton` without providing `onFormatChanged` will have no effect.',
                    );

                    widget.onFormatChanged?.call(format);
                  },
                );
              },
            ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TltBadge(
                backgroundColor: TltColors.gray[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                borderRadius: BorderRadius.circular(8),
                label: Text(
                  "Jan 6, 2022",
                  style: TextStyle(
                    color: TltColors.gray[300],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: 2,
                width: 12,
                color: TltColors.gray[700],
              ),
              TltBadge(
                backgroundColor: TltColors.gray[800],
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                borderRadius: BorderRadius.circular(8),
                label: Text(
                  "Jan 13, 2022",
                  style: TextStyle(
                    color: TltColors.gray[300],
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {},
                child: Text(
                  "Last week",
                  style: TextStyle(
                    color: TltColors.success[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Last month",
                  style: TextStyle(
                    color: TltColors.success[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  "Last year",
                  style: TextStyle(
                    color: TltColors.success[500],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Flexible(
            flex: widget.shouldFillViewport ? 1 : 0,
            child: TltTableCalendarBase(
              onCalendarCreated: (pageController) {
                _pageController = pageController;
                widget.onCalendarCreated?.call(pageController);
              },
              focusedDay: _focusedDay.value,
              calendarFormat: widget.calendarFormat,
              availableGestures: widget.availableGestures,
              firstDay: widget.firstDay,
              lastDay: widget.lastDay,
              startingDayOfWeek: widget.startingDayOfWeek,
              dowDecoration: widget.daysOfWeekStyle.decoration,
              rowDecoration: widget.calendarStyle.rowDecoration,
              tableBorder: widget.calendarStyle.tableBorder,
              tablePadding: widget.calendarStyle.tablePadding,
              dowVisible: widget.daysOfWeekVisible,
              dowHeight: widget.daysOfWeekHeight,
              rowHeight: widget.rowHeight,
              formatAnimationDuration: widget.formatAnimationDuration,
              formatAnimationCurve: widget.formatAnimationCurve,
              pageAnimationEnabled: widget.pageAnimationEnabled,
              pageAnimationDuration: widget.pageAnimationDuration,
              pageAnimationCurve: widget.pageAnimationCurve,
              availableCalendarFormats: widget.availableCalendarFormats,
              simpleSwipeConfig: widget.simpleSwipeConfig,
              sixWeekMonthsEnforced: widget.sixWeekMonthsEnforced,
              onVerticalSwipe: _swipeCalendarFormat,
              onPageChanged: (focusedDay) {
                _focusedDay.value = focusedDay;
                widget.onPageChanged?.call(focusedDay);
              },
              weekNumbersVisible: widget.weekNumbersVisible,
              weekNumberBuilder: (BuildContext context, DateTime day) {
                final weekNumber = _calculateWeekNumber(day);
                Widget? cell = widget.calendarBuilders.weekNumberBuilder
                    ?.call(context, weekNumber);

                cell ??= Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Center(
                    child: Text(
                      weekNumber.toString(),
                      style: widget.calendarStyle.weekNumberTextStyle,
                    ),
                  ),
                );

                return cell;
              },
              dowBuilder: (BuildContext context, DateTime day) {
                Widget? dowCell =
                    widget.calendarBuilders.dowBuilder?.call(context, day);

                if (dowCell == null) {
                  final weekdayString = (widget.daysOfWeekStyle.dowTextFormatter
                              ?.call(day, widget.locale) ??
                          DateFormat.E(widget.locale).format(day))
                      .substring(0, 2);

                  dowCell = Center(
                    child: ExcludeSemantics(
                      child: Text(
                        weekdayString,
                        style: TextStyle(
                            color: TltColors.gray[300],
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                    ),
                  );
                }

                return dowCell;
              },
              dayBuilder: (context, day, focusedMonth) {
                return GestureDetector(
                  behavior: widget.dayHitTestBehavior,
                  onTap: () => _onDayTapped(day),
                  onLongPress: () => _onDayLongPressed(day),
                  child: _buildCell(day, focusedMonth),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 1,
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Color.fromRGBO(242, 242, 242, 0),
                Color.fromRGBO(242, 242, 242, 1),
                Color.fromRGBO(242, 242, 242, 0),
              ],
            )),
          ),
          // Divider(
          //   height: 1,
          //   color: TltColors.gray[200],
          // ),
          const SizedBox(
            height: 24,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: widget.onTapCancel,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: TltColors.error[400])),
                      child: Text(
                        "Cancel",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TltColors.error[400],
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: InkWell(
                  onTap: widget.onTapApply,
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      decoration: BoxDecoration(
                        color: TltColors.blue[500],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Apply",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TltColors.gray[900],
                        ),
                      )),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCell(DateTime day, DateTime focusedDay) {
    final isOutside = day.month != focusedDay.month;

    if (isOutside && _shouldBlockOutsideDays) {
      return Container();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final shorterSide = constraints.maxHeight > constraints.maxWidth
            ? constraints.maxWidth
            : constraints.maxHeight;

        final children = <Widget>[];

        final isWithinRange = widget.rangeStartDay != null &&
            widget.rangeEndDay != null &&
            _isWithinRange(day, widget.rangeStartDay!, widget.rangeEndDay!);

        final isRangeStart = isSameDate(day, widget.rangeStartDay);
        final isRangeEnd = isSameDate(day, widget.rangeEndDay);

        Widget? rangeHighlight = widget.calendarBuilders.rangeHighlightBuilder
            ?.call(context, day, isWithinRange);

        if (rangeHighlight == null) {
          if (isWithinRange) {
            rangeHighlight = _isWeekend(day, weekendDays: widget.weekendDays)
                ? Center(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                        start: isRangeStart
                            ? constraints.maxWidth * 0.5
                            : day.weekday == DateTime.sunday
                                ? constraints.maxWidth * 0.5
                                : 0.0,
                        end: isRangeEnd
                            ? constraints.maxWidth * 0.5
                            : day.weekday == DateTime.saturday
                                ? constraints.maxWidth * 0.5
                                : 0.0,
                      ),
                      height: (shorterSide -
                              widget.calendarStyle.cellMargin.vertical) *
                          widget.calendarStyle.rangeHighlightScale,
                      color: widget.calendarStyle.rangeHighlightColor,
                    ),
                  )
                : Center(
                    child: Container(
                      margin: EdgeInsetsDirectional.only(
                        start: isRangeStart ? constraints.maxWidth * 0.5 : 0.0,
                        end: isRangeEnd ? constraints.maxWidth * 0.5 : 0.0,
                      ),
                      height: (shorterSide -
                              widget.calendarStyle.cellMargin.vertical) *
                          widget.calendarStyle.rangeHighlightScale,
                      color: widget.calendarStyle.rangeHighlightColor,
                    ),
                  );
          }
        }

        if (rangeHighlight != null) {
          children.add(rangeHighlight);
        }

        final isToday = isSameDate(day, widget.currentDay);
        final isDisabled = _isDayDisabled(day);
        final isWeekend = _isWeekend(day, weekendDays: widget.weekendDays);

        Widget content = TltCellContent(
          key: ValueKey('CellContent-${day.year}-${day.month}-${day.day}'),
          day: day,
          focusedDay: focusedDay,
          calendarStyle: widget.calendarStyle,
          calendarBuilders: widget.calendarBuilders,
          isTodayHighlighted: widget.calendarStyle.isTodayHighlighted,
          isToday: isToday,
          isSelected: widget.selectedDayPredicate?.call(day) ?? false,
          isRangeStart: isRangeStart,
          isRangeEnd: isRangeEnd,
          isWithinRange: isWithinRange,
          isOutside: isOutside,
          isDisabled: isDisabled,
          isWeekend: isWeekend,
          isHoliday: widget.holidayPredicate?.call(day) ?? false,
          locale: widget.locale,
        );

        children.add(content);

        if (!isDisabled) {
          final events = widget.eventLoader?.call(day) ?? [];
          Widget? markerWidget =
              widget.calendarBuilders.markerBuilder?.call(context, day, events);

          if (events.isNotEmpty && markerWidget == null) {
            final center = constraints.maxHeight / 2;

            final markerSize = widget.calendarStyle.markerSize ??
                (shorterSide - widget.calendarStyle.cellMargin.vertical) *
                    widget.calendarStyle.markerSizeScale;

            final markerAutoAlignmentTop = center +
                (shorterSide - widget.calendarStyle.cellMargin.vertical) / 2 -
                (markerSize * widget.calendarStyle.markersAnchor);

            markerWidget = PositionedDirectional(
              top: widget.calendarStyle.markersAutoAligned
                  ? markerAutoAlignmentTop
                  : widget.calendarStyle.markersOffset.top,
              bottom: widget.calendarStyle.markersAutoAligned
                  ? null
                  : widget.calendarStyle.markersOffset.bottom,
              start: widget.calendarStyle.markersAutoAligned
                  ? null
                  : widget.calendarStyle.markersOffset.start,
              end: widget.calendarStyle.markersAutoAligned
                  ? null
                  : widget.calendarStyle.markersOffset.end,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: events
                    .take(widget.calendarStyle.markersMaxCount)
                    .map((event) => _buildSingleMarker(day, event, markerSize))
                    .toList(),
              ),
            );
          }

          if (markerWidget != null) {
            children.add(markerWidget);
          }
        }

        return Stack(
          alignment: widget.calendarStyle.markersAlignment,
          clipBehavior: widget.calendarStyle.canMarkersOverflow
              ? Clip.none
              : Clip.hardEdge,
          children: children,
        );
      },
    );
  }

  Widget _buildSingleMarker(DateTime day, T event, double markerSize) {
    return widget.calendarBuilders.singleMarkerBuilder
            ?.call(context, day, event) ??
        Container(
          width: markerSize,
          height: markerSize,
          margin: widget.calendarStyle.markerMargin,
          decoration: widget.calendarStyle.markerDecoration,
        );
  }

  int _calculateWeekNumber(DateTime date) {
    final middleDay = date.add(const Duration(days: 3));
    final dayOfYear = _dayOfYear(middleDay);

    return 1 + ((dayOfYear - 1) / 7).floor();
  }

  int _dayOfYear(DateTime date) {
    return normalizeDateUtc(date)
            .difference(DateTime.utc(date.year, 1, 1))
            .inDays +
        1;
  }

  bool _isWithinRange(DateTime day, DateTime start, DateTime end) {
    if (isSameDate(day, start) || isSameDate(day, end)) {
      return true;
    }

    if (day.isAfter(start) && day.isBefore(end)) {
      return true;
    }

    return false;
  }

  bool _isDayDisabled(DateTime day) {
    return day.isBefore(widget.firstDay) ||
        day.isAfter(widget.lastDay) ||
        !_isDayAvailable(day);
  }

  bool _isDayAvailable(DateTime day) {
    return widget.enabledDayPredicate == null
        ? true
        : widget.enabledDayPredicate!(day);
  }

  DateTime _firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month, 1);
  }

  DateTime _lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1, 1)
        : DateTime.utc(month.year + 1, 1, 1);
    return date.subtract(const Duration(days: 1));
  }

  bool _isBeforeMonth(DateTime day, DateTime month) {
    if (day.year == month.year) {
      return day.month < month.month;
    } else {
      return day.isBefore(month);
    }
  }

  bool _isAfterMonth(DateTime day, DateTime month) {
    if (day.year == month.year) {
      return day.month > month.month;
    } else {
      return day.isAfter(month);
    }
  }

  bool _isWeekend(
    DateTime day, {
    List<int> weekendDays = const [DateTime.saturday, DateTime.sunday],
  }) {
    return weekendDays.contains(day.weekday);
  }
}
