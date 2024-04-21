import 'package:get/get.dart';
import 'package:ride_talk/ui/pages/chat_module/chat_video_page.dart';
import 'package:ride_talk/ui/pages/pages.dart';

class AppRoutes {

  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () =>   SplashPage()),
    GetPage(name: '/intro-page', page: () =>    IntroPage()),
    GetPage(name: '/login', page: () =>    LoginPage()),

    GetPage(name: '/sign-up', page: () =>    SignUpPage()),
    GetPage(name: '/forgot-pass', page: () =>    ForgotPassPage()),
    GetPage(name: '/gender-page', page: () =>    GenderSelectionPage()),
    GetPage(name: '/check-email', page: () =>    CheckEmailPage()),
    GetPage(name: '/mobile-verify', page: () =>    MobileVerificationPage()),
    GetPage(name: '/otp-verify', page: () =>    OtpVerificationPage()),
    GetPage(name: '/enable-location', page: () =>    EnableLocationPage()),

    GetPage(name: '/dashboard', page: () => DashboardPage()),
    GetPage(name: '/search-result', page: () => SearchResultPage()),
    GetPage(name: '/date-page', page: () =>    DateSelectionPage()),
    GetPage(name: '/seat-selection-page', page: () =>    SeatSelectionPage()),
    GetPage(name: '/share-ride', page: () =>    ShareRidePage()),
    GetPage(name: '/promo-code', page: () =>    PromoCodePage()),
    GetPage(name: '/ride-details', page: () =>    RideDetails()),
    GetPage(name: '/notification', page: () =>    NotificationPage()),
    GetPage(name: '/favorite', page: () =>    FavoritePage()),

    GetPage(name: '/profile', page: () =>    ProfilePage()),
    GetPage(name: '/edit-profile', page: () =>    EditProfilePage()),
    GetPage(name: '/profile-setting', page: () =>    ProfileSettingsPage()),
    GetPage(name: '/refer-page', page: () =>    ReferPage()),
    GetPage(name: '/order-confirm', page: () =>    OrderConfirmPage()),
    GetPage(name: '/terms-page', page: () =>    TermsPage()),
    GetPage(name: '/ride-rating-page', page: () =>    RideRatingPage()),

    GetPage(name: '/booking-success', page: () =>    BookingSuccessPage()),
    GetPage(name: '/driver-profile', page: () =>    DriverProfile()),

    GetPage(name: '/chat', page: () =>    ChatListPage()),
    GetPage(name: '/chat-details', page: () =>    ChatDetailsPage()),
    GetPage(name: '/chat-video', page: () =>    ChatVideoPage()),
    GetPage(name: '/wallet', page: () =>    WalletPage()),
    GetPage(name: '/payment', page: () =>    PaymentPage()),
  ];
}
