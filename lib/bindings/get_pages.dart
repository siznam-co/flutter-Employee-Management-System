import 'package:get/get.dart';
import 'package:management/Views/AdminScr/AdminScr.dart';
import 'package:management/Views/addEmpScr/addEmpScr.dart';
import 'package:management/Views/addOvertimeEmp/addOvertimeEmp.dart';
import 'package:management/Views/attendanceReport/attendanceReport.dart';
import 'package:management/Views/dashBoard/DashBoard.dart';
import 'package:management/Views/edit_dlt_emp/edit_dlt_emp.dart';
import 'package:management/Views/employeeScreen/employeeScreen.dart';
import 'package:management/Views/generateReports/generateReports.dart';
import 'package:management/Views/markAttendanceEmpList/markAttendanceEmpList.dart';
import 'package:management/Views/markAttendanceScreen/markAttendanceScreen.dart';
import 'package:management/Views/overtimrScr/overtimeScr.dart';
import 'package:management/Views/parameters/parameters.dart';
import 'package:management/Views/splashScreen/splashScreen.dart';
import 'package:management/Views/summaryReport/summaryReport.dart';

class GetPageList {
  static List<GetPage> pages = [
    GetPage(
      name: AddEmployeeView.routeName,
      page: () => AddEmployeeView(),
      binding: BindingsBuilder(
        () => Get.lazyPut(() => AddEmployeeView()),
      ),
    ),
    GetPage(
      name: OverTimeView.routeName,
      page: () => const OverTimeView(),
      binding: BindingsBuilder(() {
        /*Get.lazyPut(() => LoginController());
        Get.lazyPut(() => SocialController());*/
      }),
    ),
    GetPage(
      name: AdminScrView.routeName,
      page: () => const AdminScrView(),
      /*binding:
            BindingsBuilder(() => Get.lazyPut(() => EditProfileController()))*/
    ),
    GetPage(
      name: AttendanceReportScr.routeName,
      page: () => const AttendanceReportScr(),
      /*binding: BindingsBuilder(() => Get.lazyPut(() => ProfileController()))*/
    ),
    GetPage(
      name: DashBoardView.routeName,
      page: () => const DashBoardView(),
      /*binding:
            BindingsBuilder(() => Get.lazyPut(() => RegisterController()))*/
    ),
    GetPage(
      name: EditDeleteEmployee.routeName,
      page: () => EditDeleteEmployee(null, null),
      /*binding: BindingsBuilder(() {
          Get.lazyPut(() => MyCarsController());
          Get.lazyPut(() => InsuranceController());
          Get.lazyPut(() => ContractsController());
          Get.lazyPut(() => TrackController());
        })*/
    ),
    GetPage(
      name: EmployeeList.routeName,
      page: () => EmployeeList(),
      /*binding:
          BindingsBuilder(() => Get.lazyPut(() => TrackDetailsController())*/
    ),
    GetPage(
      name: GenerateReport.routeName,
      page: () => const GenerateReport(),
      //binding: BindingsBuilder(() => Get.lazyPut(() => CarDetailsController())),
    ),
    GetPage(
      name: MarkAttendanceList.routeName,
      page: () => MarkAttendanceList(),
      /*binding:
          BindingsBuilder(() => Get.lazyPut(() => ForgetPasswordController())),*/
    ),
    GetPage(
      name: MarkAttendanceEmp.routeName,
      page: () => MarkAttendanceEmp(null, null),
      /*binding:
          BindingsBuilder(() => Get.lazyPut(() => ResetPasswordController())),*/
    ),
    GetPage(
      name: OverTimeScr.routeName,
      page: () => OverTimeScr(),
      /*binding:
          BindingsBuilder(() => Get.lazyPut(() => ChangePasswordController())),*/
    ),
    GetPage(
      name: SetParametersScr.routeName,
      page: () => const SetParametersScr(),
      //binding: BindingsBuilder(() => Get.lazyPut(() => ContactUsController())),
    ),
    GetPage(
      name: SplashScreen.routeName,
      page: () => const SplashScreen(),
      /*binding:
          BindingsBuilder(() => Get.lazyPut(() => NotificationsController())),*/
    ),
    GetPage(
      name: SummaryReportScr.routeName,
      page: () => const SummaryReportScr(),
      /*binding:
          BindingsBuilder(() => Get.lazyPut(() => NotificationsController())),*/
    ),
  ];
}
