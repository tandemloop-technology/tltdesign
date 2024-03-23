import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tlt_design/src/components/space.dart';
import 'package:tlt_design/src/foundations/colors.dart';
import 'package:tlt_design/src/foundations/text_styles.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:tlt_design/src/foundations/theme.dart';
import 'package:tlt_design/src/utils/properties.dart';

export 'package:flutter/services.dart' show SmartQuotesType, SmartDashesType;

class TltTextField extends StatelessWidget {
  static final TltTheme _theme = TltTheme.instance;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TltInputDecoration? decoration;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool readOnly;
  final bool? showCursor;
  final bool autofocus;
  final bool obscureText;
  final String obscuringCharacter;
  final bool autoCorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;
  final AppPrivateCommandCallback? onAppPrivateCommand;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ui.BoxHeightStyle selectionHeightStyle;
  final ui.BoxWidthStyle selectionWidthStyle;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final DragStartBehavior dragStartBehavior;
  final VoidCallback? onTap;
  final MouseCursor? mouseCursor;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final ScrollController? scrollController;
  final Iterable<String>? autofillHints;
  final Clip clipBehavior;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;

  TltTextField({
    Key? key,
    this.decoration,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    TextStyle? style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.autoCorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
  })  : style = style ?? _theme.inputStyle,
        super(key: key);

  TltTextField.textArea({
    Key? key,
    this.decoration,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.multiline,
    this.textInputAction = TextInputAction.newline,
    this.textCapitalization = TextCapitalization.none,
    TextStyle? style,
    this.strutStyle,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly = false,
    this.showCursor,
    this.autofocus = false,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.autoCorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    required this.maxLines,
    required this.minLines,
    this.expands = false,
    this.maxLength,
    this.maxLengthEnforcement,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onAppPrivateCommand,
    this.inputFormatters,
    this.enabled,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.selectionHeightStyle = ui.BoxHeightStyle.tight,
    this.selectionWidthStyle = ui.BoxWidthStyle.tight,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.selectionControls,
    this.dragStartBehavior = DragStartBehavior.start,
    this.onTap,
    this.mouseCursor,
    this.buildCounter,
    this.scrollPhysics,
    this.scrollController,
    this.autofillHints,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.contextMenuBuilder,
  })  : style = style ?? _theme.inputStyle,
        super(key: key);

  _getEffectiveDecoration() {
    TltInputDecoration localDecoration = (decoration ?? TltInputDecoration());

    TltInputDecoration effectiveDecoration = TltInputDecoration().copyWith(
      addOnBefore: localDecoration.addOnBefore,
      addOnAfter: localDecoration.addOnAfter,
      addOnBeforeDecoration: localDecoration.addOnBeforeDecoration,
      addOnAfterDecoration: localDecoration.addOnAfterDecoration,
      relativeAddOnHeight: localDecoration.relativeAddOnHeight,
      // icon: _localDecoration.icon,
      // iconColor: _localDecoration.iconColor,
      // label: _localDecoration.label,
      // labelText: _localDecoration.labelText,
      // labelStyle: _localDecoration.labelStyle,
      // floatingLabelStyle: _localDecoration.floatingLabelStyle,
      helperText: localDecoration.helperText,
      helperStyle: localDecoration.helperStyle,
      helperMaxLines: localDecoration.helperMaxLines,
      hintText: localDecoration.hintText,
      hintStyle: localDecoration.hintStyle,
      hintTextDirection: localDecoration.hintTextDirection,
      hintMaxLines: localDecoration.hintMaxLines,
      errorText: localDecoration.errorText,
      errorStyle: localDecoration.errorStyle,
      errorMaxLines: localDecoration.errorMaxLines,
      // floatingLabelBehavior:
      //     _localDecoration.floatingLabelBehavior ?? FloatingLabelBehavior.auto,
      // floatingLabelAlignment: _localDecoration.floatingLabelAlignment ??
      //     FloatingLabelAlignment.center,
      // isCollapsed: _localDecoration.isCollapsed,
      // isDense: _localDecoration.isDense,
      contentPadding: localDecoration.contentPadding,
      prefixIcon: localDecoration.prefixIcon,
      // prefix: _localDecoration.prefix,
      // prefixText: _localDecoration.prefixText,
      // prefixStyle: _localDecoration.prefixStyle,
      // prefixIconColor: _localDecoration.prefixIconColor,
      prefixIconConstraints: localDecoration.prefixIconConstraints,
      suffixIcon: localDecoration.suffixIcon,
      // suffix: _localDecoration.suffix,
      // suffixText: _localDecoration.suffixText,
      // suffixStyle: _localDecoration.suffixStyle,
      // suffixIconColor: _localDecoration.suffixIconColor,
      suffixIconConstraints: localDecoration.suffixIconConstraints,
      counter: localDecoration.counter,
      counterText: localDecoration.counterText,
      counterStyle: localDecoration.counterStyle,
      filled: localDecoration.filled,
      fillColor: localDecoration.fillColor,
      focusColor: localDecoration.focusColor,
      hoverColor: localDecoration.hoverColor,
      errorBorder: localDecoration.errorBorder,
      focusedBorder: localDecoration.focusedBorder,
      focusedErrorBorder: localDecoration.focusedErrorBorder,
      disabledBorder: localDecoration.disabledBorder,
      enabledBorder: localDecoration.enabledBorder,
      border: localDecoration.border,
      enabled: enabled,
      semanticCounterText: localDecoration.semanticCounterText,
      // alignLabelWithHint: _localDecoration.alignLabelWithHint,
      constraints: localDecoration.constraints,
    );

    if (decoration?.addOnBefore != null && decoration?.addOnAfter != null) {
      return effectiveDecoration.copyWith(
        border: OutlineInputBorder(
          borderSide: effectiveDecoration.border!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.enabledBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.errorBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedErrorBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.disabledBorder!.borderSide,
          borderRadius: BorderRadius.zero,
        ),
      );
    } else if (decoration?.addOnBefore != null &&
        decoration?.addOnAfter == null) {
      return effectiveDecoration.copyWith(
        border: OutlineInputBorder(
          borderSide: effectiveDecoration.border!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.enabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.errorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedErrorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.disabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.zero,
            right: Radius.circular(8),
          ),
        ),
      );
    } else if (decoration?.addOnBefore == null &&
        decoration?.addOnAfter != null) {
      return effectiveDecoration.copyWith(
        border: OutlineInputBorder(
          borderSide: effectiveDecoration.border!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.enabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.errorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.focusedErrorBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: effectiveDecoration.disabledBorder!.borderSide,
          borderRadius: const BorderRadius.horizontal(
            left: Radius.circular(8),
            right: Radius.zero,
          ),
        ),
      );
    }
    return effectiveDecoration;
  }

  BoxBorder? _setAddOnBorder(BoxBorder? border, bool isAddOnBefore) {
    return border != null
        ? Border(
            bottom: BorderSide(
                color: border.bottom.color,
                width: border.bottom.width,
                style: border.bottom.style),
            left: isAddOnBefore
                ? BorderSide(
                    color: border.top.color,
                    width: border.top.width,
                    style: border.top.style)
                : BorderSide.none,
            right: !isAddOnBefore
                ? BorderSide(
                    color: border.bottom.color,
                    width: border.bottom.width,
                    style: border.bottom.style)
                : BorderSide.none,
            top: BorderSide(
                color: border.top.color,
                width: border.top.width,
                style: border.top.style),
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    final Widget? label;

    if (decoration?.label != null || decoration?.labelText != null) {
      label = decoration?.label ??
          Text(decoration!.labelText!,
              style: decoration?.labelStyle ?? TltStyles.lead2);
    } else {
      label = null;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) label,
        const TltYSpace(8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (decoration?.addOnBefore != null)
              _addOnBuilder(
                isAddOnBefore: true,
                child: decoration!.addOnBefore!,
                decoration: decoration?.addOnBeforeDecoration,
                defaultBorderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
            Expanded(
              child: TextField(
                contextMenuBuilder: contextMenuBuilder,
                controller: controller,
                focusNode: focusNode,
                decoration: _getEffectiveDecoration(),
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                textCapitalization: textCapitalization,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                readOnly: readOnly,
                showCursor: showCursor,
                autofocus: autofocus,
                obscureText: obscureText,
                obscuringCharacter: obscuringCharacter,
                autocorrect: autoCorrect,
                smartDashesType: smartDashesType,
                smartQuotesType: smartQuotesType,
                enableSuggestions: enableSuggestions,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                maxLengthEnforcement: maxLengthEnforcement,
                onChanged: onChanged,
                onEditingComplete: onEditingComplete,
                onSubmitted: onSubmitted,
                onAppPrivateCommand: onAppPrivateCommand,
                inputFormatters: inputFormatters,
                enabled: enabled,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                selectionHeightStyle: selectionHeightStyle,
                selectionWidthStyle: selectionWidthStyle,
                keyboardAppearance: keyboardAppearance,
                scrollPadding: scrollPadding,
                enableInteractiveSelection: enableInteractiveSelection,
                selectionControls: selectionControls,
                dragStartBehavior: dragStartBehavior,
                onTap: onTap,
                mouseCursor: mouseCursor,
                buildCounter: buildCounter,
                scrollPhysics: scrollPhysics,
                scrollController: scrollController,
                autofillHints: autofillHints,
                clipBehavior: clipBehavior,
                restorationId: restorationId,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
              ),
            ),
            if (decoration?.addOnAfter != null)
              _addOnBuilder(
                isAddOnBefore: false,
                child: decoration!.addOnAfter!,
                decoration: decoration?.addOnAfterDecoration,
                defaultBorderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Container _addOnBuilder({
    required Widget child,
    required TltAddOnDecoration? decoration,
    required BorderRadius defaultBorderRadius,
    required bool isAddOnBefore,
  }) {
    return Container(
      alignment: Alignment.center,
      padding: decoration?.padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: decoration?.fillColor ?? TltColors.white,
        border: _setAddOnBorder(decoration?.border, isAddOnBefore),
        borderRadius: decoration?.borderRadius ?? defaultBorderRadius,
      ),
      height: this.decoration?.relativeAddOnHeight,
      child: child,
      // constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
    );
  }
}

class TltTextFormField extends FormField<String> {
  TltTextFormField({
    Key? key,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    TltInputDecoration? decoration,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    Widget Function(BuildContext, EditableTextState)? contextMenuBuilder,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autoCorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    int? maxLines = 1,
    int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    String? restorationId,
    bool enableIMEPersonalizedLearning = true,
  })  : assert(initialValue == null || controller == null),
        //  assert(textAlign != null),
        //  assert(autofocus != null),
        //  assert(readOnly != null),
        assert(obscuringCharacter.length == 1),
        //  assert(obscureText != null),
        //  assert(autoCorrect != null),
        //  assert(enableSuggestions != null),
        //  assert(maxLengthEnforced != null),
        // assert(
        //   maxLengthEnforced || maxLengthEnforcement == null,
        //   'maxLengthEnforced is deprecated, use only maxLengthEnforcement',
        // ),
        //  assert(scrollPadding != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        //  assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        //  assert(enableInteractiveSelection != null),
        //  assert(enableIMEPersonalizedLearning != null),
        super(
          key: key,
          restorationId: restorationId,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<String> field) {
            final _TltTextFormFieldState state =
                field as _TltTextFormFieldState;
            final TltInputDecoration effectiveDecoration =
                (decoration ?? TltInputDecoration());
            //  .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: TltTextField(
                restorationId: restorationId,
                controller: state._effectiveController,
                focusNode: focusNode,
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                contextMenuBuilder: contextMenuBuilder,
                readOnly: readOnly,
                showCursor: showCursor,
                obscuringCharacter: obscuringCharacter,
                obscureText: obscureText,
                autoCorrect: autoCorrect,
                smartDashesType: smartDashesType ??
                    (obscureText
                        ? SmartDashesType.disabled
                        : SmartDashesType.enabled),
                smartQuotesType: smartQuotesType ??
                    (obscureText
                        ? SmartQuotesType.disabled
                        : SmartQuotesType.enabled),
                enableSuggestions: enableSuggestions,
                //  maxLengthEnforced: maxLengthEnforced,
                maxLengthEnforcement: maxLengthEnforcement,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChangedHandler,
                onTap: onTap,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled ?? decoration?.enabled ?? true,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                scrollPadding: scrollPadding,
                scrollPhysics: scrollPhysics,
                keyboardAppearance: keyboardAppearance,
                enableInteractiveSelection: enableInteractiveSelection,
                selectionControls: selectionControls,
                buildCounter: buildCounter,
                autofillHints: autofillHints,
                scrollController: scrollController,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
              ),
            );
          },
        );

  TltTextFormField.textArea({
    Key? key,
    this.controller,
    String? initialValue,
    FocusNode? focusNode,
    TltInputDecoration? decoration,
    TextInputType? keyboardType,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction = TextInputAction.newline,
    TextStyle? style,
    StrutStyle? strutStyle,
    TextDirection? textDirection,
    TextAlign textAlign = TextAlign.start,
    TextAlignVertical? textAlignVertical,
    bool autofocus = false,
    bool readOnly = false,
    Widget Function(BuildContext, EditableTextState)? contextMenuBuilder,
    bool? showCursor,
    String obscuringCharacter = '•',
    bool obscureText = false,
    bool autoCorrect = true,
    SmartDashesType? smartDashesType,
    SmartQuotesType? smartQuotesType,
    bool enableSuggestions = true,
    MaxLengthEnforcement? maxLengthEnforcement,
    required int? maxLines,
    required int? minLines,
    bool expands = false,
    int? maxLength,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onTap,
    VoidCallback? onEditingComplete,
    ValueChanged<String>? onFieldSubmitted,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool? enabled,
    double cursorWidth = 2.0,
    double? cursorHeight,
    Radius? cursorRadius,
    Color? cursorColor,
    Brightness? keyboardAppearance,
    EdgeInsets scrollPadding = const EdgeInsets.all(20.0),
    bool enableInteractiveSelection = true,
    TextSelectionControls? selectionControls,
    InputCounterWidgetBuilder? buildCounter,
    ScrollPhysics? scrollPhysics,
    Iterable<String>? autofillHints,
    AutovalidateMode? autovalidateMode,
    ScrollController? scrollController,
    String? restorationId,
    bool enableIMEPersonalizedLearning = true,
  })  : assert(initialValue == null || controller == null),
        //  assert(textAlign != null),
        //  assert(autofocus != null),
        //  assert(readOnly != null),
        assert(obscuringCharacter.length == 1),
        //  assert(obscureText != null),
        //  assert(autoCorrect != null),
        //  assert(enableSuggestions != null),
        //  assert(maxLengthEnforced != null),
        // assert(
        //   maxLengthEnforced || maxLengthEnforcement == null,
        //   'maxLengthEnforced is deprecated, use only maxLengthEnforcement',
        // ),
        //  assert(scrollPadding != null),
        assert(maxLines == null || maxLines > 0),
        assert(minLines == null || minLines > 0),
        assert(
          (maxLines == null) || (minLines == null) || (maxLines >= minLines),
          "minLines can't be greater than maxLines",
        ),
        //  assert(expands != null),
        assert(
          !expands || (maxLines == null && minLines == null),
          'minLines and maxLines must be null when expands is true.',
        ),
        assert(!obscureText || maxLines == 1,
            'Obscured fields cannot be multiline.'),
        assert(maxLength == null ||
            maxLength == TextField.noMaxLength ||
            maxLength > 0),
        //  assert(enableInteractiveSelection != null),
        //  assert(enableIMEPersonalizedLearning != null),
        super(
          key: key,
          restorationId: restorationId,
          initialValue:
              controller != null ? controller.text : (initialValue ?? ''),
          onSaved: onSaved,
          validator: validator,
          enabled: enabled ?? decoration?.enabled ?? true,
          autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
          builder: (FormFieldState<String> field) {
            final _TltTextFormFieldState state =
                field as _TltTextFormFieldState;
            final TltInputDecoration effectiveDecoration =
                (decoration ?? TltInputDecoration());
            //  .applyDefaults(Theme.of(field.context).inputDecorationTheme);
            void onChangedHandler(String value) {
              field.didChange(value);
              if (onChanged != null) {
                onChanged(value);
              }
            }

            return UnmanagedRestorationScope(
              bucket: field.bucket,
              child: TltTextField.textArea(
                restorationId: restorationId,
                controller: state._effectiveController,
                focusNode: focusNode,
                decoration:
                    effectiveDecoration.copyWith(errorText: field.errorText),
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: style,
                strutStyle: strutStyle,
                textAlign: textAlign,
                textAlignVertical: textAlignVertical,
                textDirection: textDirection,
                textCapitalization: textCapitalization,
                autofocus: autofocus,
                contextMenuBuilder: contextMenuBuilder,
                readOnly: readOnly,
                showCursor: showCursor,
                obscuringCharacter: obscuringCharacter,
                obscureText: obscureText,
                autoCorrect: autoCorrect,
                smartDashesType: smartDashesType ??
                    (obscureText
                        ? SmartDashesType.disabled
                        : SmartDashesType.enabled),
                smartQuotesType: smartQuotesType ??
                    (obscureText
                        ? SmartQuotesType.disabled
                        : SmartQuotesType.enabled),
                enableSuggestions: enableSuggestions,
                //  maxLengthEnforced: maxLengthEnforced,
                maxLengthEnforcement: maxLengthEnforcement,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                maxLength: maxLength,
                onChanged: onChangedHandler,
                onTap: onTap,
                onEditingComplete: onEditingComplete,
                onSubmitted: onFieldSubmitted,
                inputFormatters: inputFormatters,
                enabled: enabled ?? decoration?.enabled ?? true,
                cursorWidth: cursorWidth,
                cursorHeight: cursorHeight,
                cursorRadius: cursorRadius,
                cursorColor: cursorColor,
                scrollPadding: scrollPadding,
                scrollPhysics: scrollPhysics,
                keyboardAppearance: keyboardAppearance,
                enableInteractiveSelection: enableInteractiveSelection,
                selectionControls: selectionControls,
                buildCounter: buildCounter,
                autofillHints: autofillHints,
                scrollController: scrollController,
                enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
              ),
            );
          },
        );

  /// Controls the text being edited.
  ///
  /// If null, this widget will create its own [TextEditingController] and
  /// initialize its [TextEditingController.text] with [initialValue].
  final TextEditingController? controller;

  @override
  FormFieldState<String> createState() => _TltTextFormFieldState();
}

class _TltTextFormFieldState extends FormFieldState<String> {
  RestorableTextEditingController? _controller;

  TextEditingController get _effectiveController =>
      widget.controller ?? _controller!.value;

  @override
  TltTextFormField get widget => super.widget as TltTextFormField;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    super.restoreState(oldBucket, initialRestore);
    if (_controller != null) {
      _registerController();
    }
    // Make sure to update the internal [FormFieldState] value to sync up with
    // text editing controller value.
    setValue(_effectiveController.text);
  }

  void _registerController() {
    assert(_controller != null);
    registerForRestoration(_controller!, 'controller');
  }

  void _createLocalController([TextEditingValue? value]) {
    assert(_controller == null);
    _controller = value == null
        ? RestorableTextEditingController()
        : RestorableTextEditingController.fromValue(value);
    if (!restorePending) {
      _registerController();
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _createLocalController(widget.initialValue != null
          ? TextEditingValue(text: widget.initialValue!)
          : null);
    } else {
      widget.controller!.addListener(_handleControllerChanged);
    }
  }

  @override
  void didUpdateWidget(TltTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_handleControllerChanged);
      widget.controller?.addListener(_handleControllerChanged);

      if (oldWidget.controller != null && widget.controller == null) {
        _createLocalController(oldWidget.controller!.value);
      }

      if (widget.controller != null) {
        setValue(widget.controller!.text);
        if (oldWidget.controller == null) {
          unregisterFromRestoration(_controller!);
          _controller!.dispose();
          _controller = null;
        }
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_handleControllerChanged);
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didChange(String? value) {
    super.didChange(value);

    if (_effectiveController.text != value) {
      _effectiveController.text = value ?? '';
    }
  }

  @override
  void reset() {
    // setState will be called in the superclass, so even though state is being
    // manipulated, no setState call is needed here.
    _effectiveController.text = widget.initialValue ?? '';
    super.reset();
  }

  void _handleControllerChanged() {
    // Suppress changes that originated from within this class.
    //
    // In the case where a controller has been passed in to this widget, we
    // register this change listener. In these cases, we'll also receive change
    // notifications for changes originating from within this class -- for
    // example, the reset() method. In such cases, the FormField value will
    // already have been set.
    if (_effectiveController.text != value) {
      didChange(_effectiveController.text);
    }
  }
}
