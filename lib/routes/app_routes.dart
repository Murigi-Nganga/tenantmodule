import 'package:tenantmodule/screens/explore_screen.dart';
import 'package:tenantmodule/screens/feedback_screen.dart';
import 'package:tenantmodule/screens/home_screen.dart';
import 'package:tenantmodule/screens/invoices_screen.dart';
import 'package:tenantmodule/screens/profile_screen.dart';

import '../screens/auth/log_in_screen.dart';
import '../screens/onboarding/onboarding_details_screen.dart';
import '../screens/onboarding/onboarding_explore_screen.dart';
import '../screens/onboarding/onborading_home_screen.dart';

var appRoutes = {
        OnboardingHomeScreen.routeName: (context) => const OnboardingHomeScreen(),
        OnboardingExploreScreen.routeName: (context) => const OnboardingExploreScreen(),
        OnboardingDetailsScreen.routeName: (context) => const OnboardingDetailsScreen(),
        LogInScreen.routeName: (context) => const LogInScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        ExploreScreen.routeName: (context) => const ExploreScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        InvoicesScreen.routeName: (context) => const InvoicesScreen(),
        FeedbackScreen.routeName: (context) => const FeedbackScreen(),
};