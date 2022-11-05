import 'package:flutter/material.dart';
import 'package:sparkapp/constants/app_colors.dart';
import 'package:sparkapp/constants/app_text.dart';
import 'package:sparkapp/ui/views/home_page/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Signed As:",
                  style: boldTextStyle.copyWith(color: mainColor, fontSize: 18),
                ),
                Text(
                  viewModel.user.email ?? "",
                  style: boldTextStyle.copyWith(color: mainColor),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () => viewModel.onSubmit(),
                  child: Text(
                    "Sign Out",
                    style: mediumTextStyle.copyWith(color: backgroundColor),
                  ),
                )
              ],
            ),
          )),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
