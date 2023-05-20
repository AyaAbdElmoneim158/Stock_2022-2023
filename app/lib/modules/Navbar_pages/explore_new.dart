import 'package:app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExploreNew extends StatelessWidget {
  const ExploreNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchBox(
            onChanged: (val) {},
          ),
          const ItemList(),
          const CategoryList()
        ],
      ),
    );
  }
}
