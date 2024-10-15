import 'package:flutter/material.dart';

import '../../../features/0_auth/auth_presentation/view/login_page.dart';
import '../../../features/1_dashboard/3_dashboard_presentation/view/dashboard_page.dart';
import '../enum/auth_enums.dart';

extension NavigateExtension on AuthStatus {
  Widget get firstView {
    switch (this) {
      case AuthStatus.authenticated:
        return const DashBoardPage();
      case AuthStatus.guest:
        return const LoginPage();
      case AuthStatus.unknown:

        /// MARK: It can be IntroView.
        break;
      case AuthStatus.loading:
      // TODO: Handle this case.
    }
    return const LoginPage();
  }
}
