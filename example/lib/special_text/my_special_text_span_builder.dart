import 'package:example/special_text/at_text.dart';
import 'package:example/special_text/dollar_text.dart';
import 'package:example/special_text/emoji_text.dart';
import 'package:example/special_text/image_text.dart';
import 'package:extended_text_library/extended_text_library.dart';
import 'package:flutter/material.dart';

class MySpecialTextSpanBuilder extends SpecialTextSpanBuilder {
  /// whether show background for @somebody
  final TextEditingController controller;
  final bool showAtBackground;
  MySpecialTextSpanBuilder({this.showAtBackground: false, this.controller});

  @override
  TextSpan build(String data, {TextStyle textStyle, onTap}) {
    TextSpan result = super.build(data, textStyle: textStyle, onTap: onTap);
    return result;
  }

  @override
  SpecialText createSpecialText(String flag,
      {TextStyle textStyle, SpecialTextGestureTapCallback onTap, int index}) {
    if (flag == null || flag == "") return null;

    ///index is end index of start flag, so text start index should be index-(flag.length-1)
    if (isStart(flag, AtText.flag)) {
      return AtText(
        textStyle,
        onTap,
        start: index - (AtText.flag.length - 1),
        showAtBackground: showAtBackground,
      );
    } else if (isStart(flag, EmojiText.flag)) {
      return EmojiText(textStyle,
          start: index - (EmojiText.flag.length - 1), controller: controller);
    } else if (isStart(flag, DollarText.flag)) {
      return DollarText(
        textStyle,
        onTap,
        start: index - (DollarText.flag.length - 1),
      );
    } else if (isStart(flag, ImageText.flag)) {
      return ImageText(textStyle,
          start: index - (ImageText.flag.length - 1), onTap: onTap);
    }
    return null;
  }
}

class SpecialTextStyle {
  TextRange textRange;
}
