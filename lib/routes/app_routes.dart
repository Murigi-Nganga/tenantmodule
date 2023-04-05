import '../screens/auth/verification_screen.dart';
import '../screens/invoice_details_screen.dart';
import '../screens/property_details_screen.dart';
import '../screens/property_owner_profile_screen.dart';
import '../screens/receipt_details_screen.dart';
import '../screens/receipts_screen.dart';
import '../screens/explore_screen.dart';
import '../screens/feedback_screen.dart';
import '../screens/home_screen.dart';
import '../screens/invoice_payment_screen.dart';
import '../screens/invoices_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/onboarding/onboarding_details_screen.dart';
import '../screens/onboarding/onboarding_explore_screen.dart';
import '../screens/onboarding/onboarding_home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/adhoc_payments_screen.dart';

var appRoutes = {
    OnboardingHomeScreen.routeName: (context) => const OnboardingHomeScreen(),
    OnboardingExploreScreen.routeName: (context) => const OnboardingExploreScreen(),
    OnboardingDetailsScreen.routeName: (context) => const OnboardingDetailsScreen(),
    LoginScreen.routeName: (context) => const LoginScreen(),
    VerificationScreen.routeName: (context) => const VerificationScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    ExploreScreen.routeName: (context) => const ExploreScreen(),
    ProfileScreen.routeName: (context) => const ProfileScreen(),
    InvoicesScreen.routeName: (context) => const InvoicesScreen(),
    FeedbackScreen.routeName: (context) => const FeedbackScreen(),
    AdhocPaymentsScreen.routeName: (context) => const AdhocPaymentsScreen(),
    PropertyDetailsScreen.routeName: (context) => const PropertyDetailsScreen(),
    PropertyOwnerProfileScreen.routeName: (context) => const PropertyOwnerProfileScreen(),
    ReceiptsScreen.routeName: (context) => const ReceiptsScreen(),
    ReceiptDetailsScreen.routeName: (context) => const ReceiptDetailsScreen(),
    InvoiceDetailsScreen.routeName: (context) => const InvoiceDetailsScreen(),
    InvoicePaymentScreen.routeName: (context) => const InvoicePaymentScreen(),
};