import 'package:flutter/material.dart';
import 'package:flutter_qureos/routes/routes_names.dart';
import 'package:flutter_qureos/utils/AssetConfig.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        10,
        (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, form1);
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                        top: index == 0 ? 8.0 : 8.0,
                        bottom: index == 0 ? 8.0 : 8.0),
                    decoration: BoxDecoration(
                        // color: Color(0xffE4F9E8),
                        borderRadius: BorderRadius.circular(15)),
                    child: index == 0
                        ? Image.asset(AssetConfig.kFirstProduct, height: 50, width: 50,)
                        : Image.asset(AssetConfig.kAllProducts, height: 50, width: 50,)
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    index == 0
                        ? "All Products"
                        : "products name",
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
