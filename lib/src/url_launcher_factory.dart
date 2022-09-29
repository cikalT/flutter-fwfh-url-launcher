import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// A mixin that can launch A tag via `url_launcher` plugin.
mixin UrlLauncherFactory on WidgetFactory {
  @override
  Future<bool> onTapUrl(String url) async {
    final result = await super.onTapUrl(url);
    if (result) {
      return result;
    }

    // final ok = await canLaunch(url);
    // if (!ok) {
    //   return false;
    // }

    //   Fluttertoast.showToast(
    //       msg:
    //           "Terjadi kesalahan, silahkan cek ulang izin Buka secara default aplikasi lalu coba lagi",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Colors.purple[900],
    //       textColor: Colors.white,
    //       fontSize: 16.0);
    // print("hax");
    //     return launch(url);
    try {
      await launch(url);
      return true;
    } catch (e) {
      Fluttertoast.showToast(
          msg:
              "Terjadi kesalahan, silahkan cek ulang izin Buka secara default aplikasi lalu coba lagi",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.purple[900],
          textColor: Colors.white,
          fontSize: 16.0);
          return false;
    }
  }
}
