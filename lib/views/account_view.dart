import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:newsapp/widgets/profile_list_item.dart';
import '../constants.dart';


class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage: AssetImage('assets/ve.jpg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit.w * 1.5,
                      widthFactor: kSpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: Colors.white,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Text(
            'Babalola Gbogo',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 0.5),
          Text(
            'babalolagbogo@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit.w * 2),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

//    var themeSwitcher = ThemeSwitcher(
//      builder: (context) {
//        return AnimatedCrossFade(
//          duration: Duration(milliseconds: 200),
//          crossFadeState:
//          ThemeProvider.of(context).brightness == Brightness.dark
//              ? CrossFadeState.showFirst
//              : CrossFadeState.showSecond,
//          firstChild: GestureDetector(
//            onTap: () =>
//                ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
//            child: Icon(
//              LineAwesomeIcons.sun,
//              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//            ),
//          ),
//          secondChild: GestureDetector(
//            onTap: () =>
//                ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
//            child: Icon(
//              LineAwesomeIcons.moon,
//              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
//            ),
//          ),
//        );
//      },
//    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(width: kSpacingUnit.w * 3),
        Icon(
          LineAwesomeIcons.user,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        profileInfo,
//        themeSwitcher,
        SizedBox(width: kSpacingUnit.w * 3),
        SizedBox(width: kSpacingUnit.w * 3),
      ],
    );

//    return ThemeSwitchingArea(
//      child: Builder(
//        builder: (context) {
          return Scaffold(
            body: Column(
              children: <Widget>[
                SizedBox(height: kSpacingUnit.w * 2),
                header,
                SizedBox(height: kSpacingUnit.w * 2),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_shield,
                        text: 'Occupation: Tap to edit',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.city,
                        text: 'LGA: Tap to edit',
                      ),

                      ProfileListItem(
                        icon: LineAwesomeIcons.search_location,
                        text: 'Location: Tap to edit',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_plus,
                        text: 'Invite a Friend',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Help & Support',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
//        },
//      ),
//    );
  }
}
