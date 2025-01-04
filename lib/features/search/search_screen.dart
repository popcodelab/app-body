import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Add your widget tree here
      child: const Center(
        child: Text(
          'Search Widget',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}