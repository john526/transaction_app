import 'package:flutter/widgets.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:transaction_app/app/config/constants/app.constant.dart';
import 'package:transaction_app/app/config/theme/style.theme.dart';
import 'package:transaction_app/presentation/components/swiper/custom_pagination_builder.swiper.dart';

class SwiperComponent extends StatelessWidget {
  const SwiperComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final SwiperController _swiperController = SwiperController();
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35.0),
      child: Swiper(
        autoplay: true,
        autoplayDelay: 3000,
        controller: _swiperController,
        itemBuilder: (BuildContext context, int index) {
          final swiperData = SWIPERDATA[index];
          return Column(
            children: [
              Container(
                width: 300.w,
                height: size.height > 700 ? 450.h :  300.h,
                decoration: BoxDecoration(
                    //color: Style.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(
                  swiperData['image'],
                ),
              ),
              40.verticalSpace,
              Text(
                swiperData['title'],
                style: Style.interBold(size: 40.sp, color: Style.black),
              ),
            ],
          );
        },
        itemCount: 3,
        pagination: SwiperPagination(builder: CustomPaginationSwiperBuilder()),
        control: const SwiperControl(
          size: 0,
        ),
      ),
    );
  }
}
