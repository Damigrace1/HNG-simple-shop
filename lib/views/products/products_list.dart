import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/controller/products.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/views/products/components/category.dart';
import 'package:untitled2/views/products/components/product_card.dart';
import '../../models/category.dart';
import 'components/search_field.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({Key? key}) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  loadProducts() async {
    if (products.isEmpty) {
      await ProductController.loadProducts();
      setState(() {});
    }
  }

  List<CategoryModel> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    loadProducts();
    categories = List.generate(
        4,
        (index) => CategoryModel(
            name: categoryNames[index], icon: categoryIcons[index],
            id: index));
    super.initState();

  }

  List<String> categoryNames = ['Designs', 'Food', 'Electronics', 'Toys'];
  List<IconData> categoryIcons = [
    Icons.design_services,
    Icons.food_bank,
    Icons.radio,
    Icons.toys
  ];

  int selectedIndex = 10;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchField(),
            SizedBox(height: 24),
            SizedBox(
              height: 40,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {

                  return InkWell(
                    splashColor: Colors.transparent,
                    onTap: (){
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: CategorySection(
                        title: categories[index].name,
                        icon: categories[index].icon,
                        isSelected: selectedIndex == categories[index].id),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 6,);
              },
              ),
            ),
            SizedBox(height: 24),
            Text(
              'For You',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 24),
            Expanded(
                child: products.isEmpty
                    ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
                    : GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (MediaQuery.of(context)
                          .size
                          .width /
                          MediaQuery.of(context).size.height) +
                          0.1),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductCard(product: products[index]..quantity = 1);
                  },
                ))
          ],
        ),
      ),
    );
  }
}



