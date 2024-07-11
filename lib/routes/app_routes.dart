import 'package:football_app/features/authentication/views/login/login.dart';
import 'package:football_app/features/authentication/views/onBoarding/onBoarding.dart';
import 'package:football_app/features/authentication/views/password_config/forgetPassword.dart';
import 'package:football_app/features/authentication/views/signup/signup.dart';
import 'package:football_app/features/authentication/views/signup/verfiy_Email.dart';
import 'package:football_app/features/personalization/addresses/addresses.dart';
import 'package:football_app/features/personalization/profile/profile.dart';
import 'package:football_app/features/personalization/settings/settings.dart';
import 'package:football_app/features/pitch/views/cart/cart.dart';
import 'package:football_app/features/pitch/views/checkout/checkout.dart';
import 'package:football_app/features/pitch/views/home/home.dart';
import 'package:football_app/features/pitch/views/orders/orders.dart';
import 'package:football_app/features/pitch/views/pitchReviews/pitchReviews.dart';
import 'package:football_app/features/pitch/views/pitches/pitches.dart';
import 'package:football_app/features/pitch/views/wishList/wishList.dart';
import 'package:football_app/routes/routes.dart';
import 'package:get/get.dart';

class TAppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const Pitches()),
    GetPage(name: TRoutes.favoriates, page: () => const Wishlist()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const PitchReviews()),
    GetPage(name: TRoutes.order, page: () => const OrdersScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const AddressesScreen()),
    GetPage(name: TRoutes.signUp, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verfiyEmail, page: () => const VerfiyEmail()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const Forgetpassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoarding()),
  ];
}
