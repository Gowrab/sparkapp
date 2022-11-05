import 'package:sparkapp/ui/views/forget_password_page/forget_password_view.dart';
import 'package:sparkapp/ui/views/home_page/home_view.dart';
import 'package:sparkapp/ui/views/login_page/login_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../services/auth_service.dart';
import '../ui/views/registration_page/registration_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegistrationView),
    MaterialRoute(page: ForgetPasswordView),
    MaterialRoute(page: HomeView),
  ],
  dependencies: [

    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: NavigationService),

  ],
  logger: StackedLogger(),
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}