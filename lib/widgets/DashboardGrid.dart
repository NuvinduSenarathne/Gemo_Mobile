import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';

class DashboardGrid extends StatelessWidget {
  DashboardGrid({super.key});

  final List<String> categories = const [
    'Color Detection',
    'Cut Prediction',
    'Recommendation',
    'Price Prediction'
  ];
  final List<String> myRoute = [
    "/colorDetection",
    "/cutPrediction",
    "/recommendation",
    "/pricePrediction",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          return ElevatedButton(
            onPressed: () {
              // print('Clicked ' + categories[index]);
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(myRoute[index]);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.dashboardGridButtonColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6)),
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                categories[index],
                style:
                    const TextStyle(color: AppColors.whiteColor, fontSize: 14),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.whiteColor,
              ),
            ),
          );
        },
        shrinkWrap: true,
        itemCount: categories.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3,
            crossAxisSpacing: 6,
            mainAxisSpacing: 5,
            crossAxisCount: 2),
      ),
    );
  }
}
