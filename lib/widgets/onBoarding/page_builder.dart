
import 'package:incidents/controller/onboarder_controller.dart';
import 'package:incidents/core/constant/color.dart';
import 'package:incidents/data/datasource/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBuilder extends GetView<OnboarderControllerImp> {
  const PageBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
                    itemCount: onBoardingData.length,
                  itemBuilder: (context,index)=>Column(
                    children: [
                      SizedBox(height: 80),
                      Text(onBoardingData[index].title.toString(),
                      style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 60),
                      Image.asset(onBoardingData[index].imageUrl,width: 200,),
                      SizedBox(height: 80),
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        child: Text(onBoardingData[index].body,textAlign: TextAlign.center,
                        style: TextStyle(color: AppColor.grey),))
                    ],
                  ),
                   )
                ;
  }
}