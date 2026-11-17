import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_color.dart';
import '../../../../core/widget/custom_elevated_button.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.textLight,
              borderRadius: BorderRadius.circular(12),

            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 12
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Fresh looks for\n sensitive skin ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                      fontSize: 24,
                    ),),
                  SizedBox(height: 26,),
                  CustomButton(
                      borderRadius: 21,
                      width: 120,
                      text: "Shop Now",
                      textStyle:TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black
                      ),
                      onPressed: (){})
                ],
              ),
            ),
          ),
        ],
      ),
    ) ;
  }
}
