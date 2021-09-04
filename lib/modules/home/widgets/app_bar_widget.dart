import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/core/app_images.dart';
import 'package:my_star_wars/modules/home/home_state.dart';
import 'package:my_star_wars/shared/widgets/button_widget.dart';

import '../home_controller.dart';
import 'user_icon.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget({required HomeController controller})
      : super(
          preferredSize: Size.fromHeight(176),
          child: Container(
            color: AppColors.darkBlue,
            padding: EdgeInsets.only(top: 24, left: 24, right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Image.asset(
                    AppImages.logo,
                    width: 109,
                    height: 47,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ButtonWidget(
                      label: "Site Oficial",
                      onPressed: () {
                        controller.state == HomeState.webView
                            ? controller.state = HomeState.home
                            : controller.state = HomeState.webView;
                      },
                    ),
                    GestureDetector(
                      child: UserIcon(),
                      onTap: () {
                        controller.state == HomeState.userPersonalization
                            ? controller.state = HomeState.home
                            : controller.state = HomeState.userPersonalization;
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
}
