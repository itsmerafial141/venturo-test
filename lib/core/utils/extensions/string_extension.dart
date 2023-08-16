// ignore_for_file: unnecessary_this
import 'dart:convert';

extension StringExtension on String {
  int get toInt => int.parse(this);

  String get toFlag {
    String flag = this.toUpperCase().replaceAllMapped(
          RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0)),
        );
    return flag;
  }

  String get getDecodeUrl => utf8.fuse(base64).decode(this);
  String get getNameFile {
    return this.split('/').last.replaceAll(RegExp('\''), '');
  }
}
