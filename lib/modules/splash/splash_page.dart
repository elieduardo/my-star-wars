import 'package:flutter/material.dart';
import 'package:my_star_wars/core/app_colors.dart';
import 'package:my_star_wars/core/app_images.dart';
import 'package:my_star_wars/core/app_text.dart';
import 'package:my_star_wars/core/app_text_styles.dart';
import 'package:my_star_wars/modules/home/home_page.dart';
import 'package:my_star_wars/shared/app_controller.dart';
import 'package:my_star_wars/shared/app_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = AppController();

  @override
  void initState() {
    controller.initAppController();
    controller.stateNotifier.addListener(() {
      setState(() {
        _isLoaded(context: context, controller: controller);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.logo),
          SizedBox(
            height: 100,
          ),
          controller.state == AppState.error
              ? Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Text(
                      AppText.errorText,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleRegularYellow,
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: AppColors.yellow,
                  ),
                )
        ],
      ),
    );
  }
}

_isLoaded({required BuildContext context, required AppController controller}) {
  if (controller.state == AppState.sucess) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          appController: controller,
        ),
      ),
    );
  }
}
