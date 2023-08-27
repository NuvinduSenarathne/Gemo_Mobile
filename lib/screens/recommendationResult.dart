import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/RecommendationTIle.dart';

class RecommendationResult extends StatefulWidget {
  const RecommendationResult({super.key});

  @override
  State<RecommendationResult> createState() => _RecommendationResultState();
}

class _RecommendationResultState extends State<RecommendationResult> {
  late String selectedCategory = 'Selected Category';
  late String selectedRequirement = 'Selected Requirement';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          title: const Text("Results"),
        ),
        body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
        child: SingleChildScrollView(
          child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Category',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(15, 8, 15, 15),
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Text(
                    selectedCategory,
                    style: const TextStyle(
                        color: AppColors.formFieldTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        decoration: TextDecoration.none),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                  child: const Text(
                    'Requirement',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.fromLTRB(15, 8, 15, 15),
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                      selectedRequirement,
                      style: const TextStyle(
                          color: AppColors.formFieldTextColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.none),
                    )),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  width: double.infinity,
                  height: double.tryParse('50'),
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Center(
                        child: const Text(
                          'Gemstone Recommendation',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                      )),
                ),
                RecommendationTile(
                  topic: "Ruby",
                  image: "https://df2sm3urulav.cloudfront.net/tenants/gr/uploads/content/4wmnqlctgu0f3c9a.jpg",
                  description: "Description about Ruby Description about Ruby Test Description about Ruby Description about Ruby TestDescription about Ruby Description about Ruby Test",
                ),
                RecommendationTile(
                  topic: "Blue Sapphire",
                  image: "https://punsirigems.com/cdn/shop/products/ILA4795_101_3000x3000.gif?v=1612151904",
                  description: "Description about Blue Sapphire Description about Blue Sapphire",
                ),
              ],
            ))));
  }
}
