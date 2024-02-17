import 'package:get/get.dart';

import '../modules/api_test/bindings/api_test_binding.dart';
import '../modules/api_test/views/api_test_view.dart';
import '../modules/assignment/bindings/assignment_binding.dart';
import '../modules/assignment/views/assignment_view.dart';
import '../modules/assignment_details/bindings/assignment_details_binding.dart';
import '../modules/assignment_details/views/assignment_details_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/create_assignment/bindings/create_assignment_binding.dart';
import '../modules/create_assignment/views/create_assignment_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment_details/bindings/payment_details_binding.dart';
import '../modules/payment_details/views/payment_details_view.dart';
import '../modules/pre_login/bindings/pre_login_binding.dart';
import '../modules/pre_login/views/pre_login_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/show_pdf/bindings/show_pdf_binding.dart';
import '../modules/show_pdf/views/show_pdf_view.dart';
import '../modules/show_video/bindings/show_video_binding.dart';
import '../modules/show_video/views/show_video_view.dart';
import '../modules/show_video_online/bindings/show_video_online_binding.dart';
import '../modules/show_video_online/views/show_video_online_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/student_list/bindings/student_list_binding.dart';
import '../modules/student_list/views/student_list_view.dart';
import '../modules/take_attendance/bindings/take_attendance_binding.dart';
import '../modules/take_attendance/views/take_attendance_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRE_LOGIN,
      page: () => const PreLoginView(),
      binding: PreLoginBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT,
      page: () => const AssignmentView(),
      binding: AssignmentBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_LIST,
      page: () => const StudentListView(),
      binding: StudentListBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_DETAILS,
      page: () => const PaymentDetailsView(),
      binding: PaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ASSIGNMENT,
      page: () => const CreateAssignmentView(),
      binding: CreateAssignmentBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_PDF,
      page: () => const ShowPdfView(),
      binding: ShowPdfBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_VIDEO,
      page: () => const ShowVideoView(),
      binding: ShowVideoBinding(),
    ),
    GetPage(
      name: _Paths.API_TEST,
      page: () => const ApiTestView(),
      binding: ApiTestBinding(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT_DETAILS,
      page: () => const AssignmentDetailsView(),
      binding: AssignmentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SHOW_VIDEO_ONLINE,
      page: () => const ShowVideoOnlineView(),
      binding: ShowVideoOnlineBinding(),
    ),
    GetPage(
      name: _Paths.TAKE_ATTENDANCE,
      page: () => const TakeAttendanceView(),
      binding: TakeAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
  ];
}
