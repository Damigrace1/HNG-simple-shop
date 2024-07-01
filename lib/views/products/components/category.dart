import 'package:flutter/Material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({
    super.key,
    this.backgroundColor,
    this.imageColor = Colors.deepOrange,
    this.textColor = Colors.deepOrange,
    required this.title,
    required this.icon,
    required this.isSelected,
  });

  final backgroundColor;
  final Color imageColor;
  final Color textColor;
  final String title;
  final IconData icon;
  final bool isSelected;

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: 36,
        decoration: BoxDecoration(
            color: widget.isSelected ? widget.backgroundColor??Colors.deepOrange[50] : Colors.grey[100],
            borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Row(
            children: [
              Icon(widget.icon, size: 20, color: widget.isSelected ? widget.imageColor : Colors.grey,),
              SizedBox(
                width: 4,
              ),
              Text(
                widget.title,
                style: TextStyle(color: widget.isSelected ? widget.imageColor : Colors.grey,),
              )
            ],
          ),
        ),
      ),
    );
  }
}