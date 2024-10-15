import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:oriens_eam/features/0_auth/auth_presentation/view/login_page.dart';
import 'package:oriens_eam/features/0_auth/auth_presentation/view/url_page.dart';
import 'package:oriens_eam/features/5_more/presentation/view/more_page.dart';
import 'package:oriens_eam/features/7_assets/presentation/view/assets_page.dart';

import '../../features/0_auth/auth_presentation/view/forget_page.dart';
import '../../features/12_workorder_task/presentation/view/tasks_page.dart';
import '../../features/13_parts/presentation/view/parts_page.dart';
import '../../features/1_dashboard/3_dashboard_presentation/view/dashboard_page.dart';
import '../../features/1_dashboard/3_dashboard_presentation/widgets/scaffold_with_navigation_bar.dart';
import '../../features/2_workorder/3_wo_presentation/view/dashboard_wo_page.dart';
import '../../features/2_workorder/3_wo_presentation/view/workorder_calender_page.dart';
import '../../features/2_workorder/presentation/view/workorder_page.dart';
import '../../features/4_service_request/service_request_presentation/view/request_page.dart';
import '../../features/8_location/presentation/view/location_page.dart';

/////////////////////////////////////////////////////////////
/// GO ROUTER CONFIG - FOR NESTED NAVIGATION
/////////////////////////////////////////////////////////////

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellNavigatorWorkOrderKey =
    GlobalKey<NavigatorState>(debugLabel: 'workorder');
final _shellNavigatorAddKey = GlobalKey<NavigatorState>(debugLabel: 'add');
final _shellNavigatorRequestsKey =
    GlobalKey<NavigatorState>(debugLabel: 'requests');
final _shellNavigatorMoreKey = GlobalKey<NavigatorState>(debugLabel: 'more');

final goRouter = GoRouter(
  // Initial navigation change by S
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    /////////////////////////// LOGIN PAGE \\\\\\\\\\\\\\\\\\\\\\\\\\
    GoRoute(
      path: '/URl',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: UrlPage(),
      ),
    ),

    GoRoute(
      path: '/',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: LoginPage(),
      ),
    ),
    /////////////////////////// TASKS PAGE \\\\\\\\\\\\\\\\\\\\\\\\\\
    GoRoute(
      path: '/tasks',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: TasksPage(),
      ),
    ),

    GoRoute(
      path: '/forgot-password',
      pageBuilder: (context, state) =>  NoTransitionPage(
        child: ForgotPasswordPage(),
      ),
    ),
    /////////////////////////// BOTTOM NAVIGATION \\\\\\\\\\\\\\\\\\\\\\\\\\
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        /////////////////////////// DASHBOARD/HOME \\\\\\\\\\\\\\\\\\\\\\\\\\
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              path: '/home',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DashBoardPage(),
              ),
              routes: [
                GoRoute(
                  path: 'workorder',
                  builder: (context, state) => const DashboardWorkOrdersPage(
                    workOrders: [],
                    title: "",
                  ),
                ),
                GoRoute(
                  path: 'calender',
                  builder: (context, state) => const WorkOrderCalenderPage(),
                ),
              ],
            ),
          ],
        ),

        /////////////////////////// WORK ORDER \\\\\\\\\\\\\\\\\\\\\\\\\\
        StatefulShellBranch(
          navigatorKey: _shellNavigatorWorkOrderKey,
          routes: [
            GoRoute(
              path: '/workorder',
              pageBuilder: (context, state) => NoTransitionPage(
                child: WorkOrdersPage(),
              ),
              routes: [
                GoRoute(
                  path: 'calender',
                  builder: (context, state) => const WorkOrderCalenderPage(),
                ),
              ],
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const WorkorderDetailsPage(workOrder: ),
              //   ),
              // ],
            ),
          ],
        ),
        // StatefulShellBranch(
        //   navigatorKey: _shellNavigatorAddKey,
        //   routes: [
        //     // Shopping Cart
        //     GoRoute(
        //       path: '/add',
        //       pageBuilder: (context, state) => const NoTransitionPage(
        //         child: AddPage(),
        //       ),
        //       // routes: [
        //       //   GoRoute(
        //       //     path: 'details',
        //       //     builder: (context, state) => const WorkorderDetailsPage(workOrder: ),
        //       //   ),
        //       // ],
        //     ),
        //   ],
        // ),

        /////////////////////////// REQUEST \\\\\\\\\\\\\\\\\\\\\\\\\\
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRequestsKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/requests',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ServiceRequestPage(),
              ),
              // routes: [
              //   GoRoute(
              //     path: 'details',
              //     builder: (context, state) => const WorkorderDetailsPage(workOrder: ),
              //   ),
              // ],
            ),
          ],
        ),

        /////////////////////////// MORE \\\\\\\\\\\\\\\\\\\\\\\\\\
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMoreKey,
          routes: [
            // Shopping Cart
            GoRoute(
              path: '/more',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: MorePage(),
              ),
              routes: [
                GoRoute(
                  path: 'asset',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: AssetsPage()),
                ),
                GoRoute(
                  path: 'location',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: LocationPage()),
                ),
                GoRoute(
                  path: 'parts',
                  pageBuilder: (context, state) =>
                      const NoTransitionPage(child: PartsPage()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
