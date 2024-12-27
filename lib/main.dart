import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/app/services/local-storage.service.dart';
import 'package:transaction_app/presentation/components/custom_range_slider.widget.dart';
import 'package:transaction_app/presentation/controllers/splash/splash.binding.dart';
import 'package:transaction_app/presentation/routes/presentation_screen.route.dart';
import 'package:upgrader/upgrader.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();


  await Upgrader.clearSavedSettings();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Style.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ),
  );
  runApp(
    FutureBuilder(
      future: Future.wait([
        LocalStorageService.getInstance(),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ScreenUtilInit(
            designSize: const Size(375, 812),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              return RefreshConfiguration(
                footerBuilder: () => const ClassicFooter(
                  idleIcon: SizedBox(),
                  idleText: "",
                  noDataText: "",
                ),
                headerBuilder: () => const WaterDropMaterialHeader(
                  backgroundColor: Style.white,
                  color: Style.textGrey,
                ),
                child: GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Fast Transfer",
                  initialBinding: SplashBinding(),
                  initialRoute: PresentationScreenRoute.INITIAL,
                  getPages: PresentationScreenRoute.routes,
                  localizationsDelegates: const [
                    GlobalCupertinoLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('fr', 'FR'),
                  ],
                  locale: const Locale('fr'),
                  theme: ThemeData(
                    fontFamily: 'Cereal',
                    useMaterial3: false,
                    sliderTheme: SliderThemeData(
                      overlayShape: SliderComponentShape.noOverlay,
                      rangeThumbShape: CustomRoundRangeSliderThumbShapeWidget(
                        enabledThumbRadius: 12.r,
                      ),
                    ),
                  ),
                  themeMode: ThemeMode.light,
                ),
              );
            });
      },
    ),
  );
}