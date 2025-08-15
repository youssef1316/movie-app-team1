import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/colors_manager.dart';

class RateWidget extends StatelessWidget {
  final String rate;
  const RateWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
      width: width * 0.16,
      height: height * 0.03,
      decoration: BoxDecoration(
        color: AppColors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(SvgsManager.rateSvg, width: width * 0.05),
          Text(rate, style: TextStyle(color: AppColors.orange,fontWeight: FontWeight.w600,fontSize: 16)),
        ],
      ),
    );
  }
}
