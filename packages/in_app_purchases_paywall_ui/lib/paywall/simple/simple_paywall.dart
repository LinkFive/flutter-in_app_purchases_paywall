import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/name_and_url.dart';

class SimplePayWall extends StatefulWidget {
  final ThemeData theme;
  final String? appBarTitle;
  final String? title;
  final String? subTitle;
  final NameAndUrl? tosData;
  final NameAndUrl? ppData;
  final Widget? headerContainer;
  final List<IconAndText>? bulletPoints;
  final String? restoreText;
  final Function? onRestoreTap;

  SimplePayWall(
      {required this.theme,
      this.appBarTitle,
      this.title,
      this.subTitle,
      this.tosData,
      this.ppData,
      this.headerContainer,
      this.bulletPoints,
      this.restoreText,
      this.onRestoreTap});

  @override
  State<StatefulWidget> createState() => _SimplePayWallState();
}

class _SimplePayWallState extends State<SimplePayWall> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: widget.theme.appBarTheme.backgroundColor,
        appBar: AppBar(
          brightness: widget.theme.brightness,
          iconTheme: IconThemeData(
            color: widget.theme.iconTheme.color,
          ),
          backgroundColor: widget.theme.backgroundColor,
          title: Text(widget.appBarTitle ?? "Premium"),
          elevation: 0.0,
          actions: [],
        ),
        body: GlowingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            color: Colors.red,
            child: ListView(children: <Widget>[
              widget.headerContainer ?? Container(),
              Padding(
                padding: EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
                child: Text(
                  widget.title ?? "Go Premium",
                  style: widget.theme.textTheme.headline5,
                ),
              ),
              ..._premiumContent,
              Container(
                padding: EdgeInsets.all(8),
              ),
              _LegalRow(widget.tosData, widget.ppData)
            ])));
  }

  List<Widget> get _premiumContent {
    List<Widget> elements = [];

    // add SubTitle
    if (widget.subTitle != null) {
      elements.add(Container(
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Text(widget.subTitle!, style: widget.theme.textTheme.bodyText2)));
    }

    elements.addAll(widget.bulletPoints
            ?.map<Widget>((bulletPoint) => Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    children: [
                      Icon(
                        bulletPoint.icon,
                        size: 24,
                        color: widget.theme.iconTheme.color,
                      ),
                      Padding(
                        child: Text(
                          bulletPoint.text,
                          maxLines: 2,
                          style: widget.theme.textTheme.bodyText1,
                        ),
                        padding: EdgeInsets.all(16),
                      ),
                    ],
                  ),
                ))
            .toList(growable: false) ??
        []);

    // PremiumPriceBoxes(),
    elements.add(MaterialButton(
      child: Text(
        widget.restoreText ?? "Restore purchase",
        style: TextStyle(color: widget.theme.primaryColor),
      ),
      onPressed: () {
        if(widget.onRestoreTap != null) {
          widget.onRestoreTap!();
        }
      },
    ));
    return elements;
  }
}

class _LegalRow extends StatelessWidget {
  final ChromeSafariBrowser browser = new ChromeSafariBrowser();
  final NameAndUrl? tosData;
  final NameAndUrl? ppData;

  _LegalRow(this.tosData, this.ppData);

  _onTapTos() async {
    await browser.open(
        url: Uri.parse(tosData!.url),
        options: ChromeSafariBrowserClassOptions(
            android: AndroidChromeCustomTabsOptions(addDefaultShareMenuItem: false),
            ios: IOSSafariOptions(barCollapsingEnabled: true)));
  }

  Widget get tosItem => tosData == null
      ? Container()
      : GestureDetector(
          onTap: _onTapTos,
          child: Text(
            tosData?.name ?? "Terms of Service",
            style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue, fontSize: 12),
          ),
        );

  Widget get ppItem => ppData == null
      ? Container()
      : GestureDetector(
          onTap: _onTapTos,
          child: Text(
            ppData?.name ?? "Privacy Policy",
            style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue, fontSize: 12),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: tosItem,
        ),
        Container(
          padding: EdgeInsets.only(left: 2, right: 2),
          child: ppItem,
        )
      ],
    );
  }
}
