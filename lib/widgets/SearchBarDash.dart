import 'package:flutter/material.dart';
import 'package:gemo_app/constants/colors.dart';

class SearchBarDash extends StatelessWidget {
  final Function(String) onSearch;

  const SearchBarDash({
    // required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
  
    return Container(
      child: TextField(
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        filled: true,
        fillColor:  AppColors.searchFeildColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: IconButton(
          icon: Icon(Icons.search,color: Colors.white,),
          onPressed: () {
            // controller.clear();
          },
        ),
        prefixIcon: IconButton(
          icon: Icon(Icons.close,color: Colors.white,),
          onPressed: () {
            // controller.clear();
          },
        ),
      ),
      onChanged: onSearch,
    ),
    );
  }
}