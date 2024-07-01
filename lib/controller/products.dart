import '../models/product.dart';

List<Product> products = [];

class ProductController {

  static loadProducts(){

    List<String> images = [
      'assets/images/products/foam.png',
    'assets/images/products/d-table.png',
    'assets/images/products/hand-sculpture.jpg',
      'assets/images/products/mini-bar.png',
      'assets/images/products/sofa.jpg',
      'assets/images/products/vase.jpg'
    ];

    List<String> prices = ['23,000','96,000','34,000','76,000','423,000','96,000'];
    List<String> descriptions = ['190X75X10CM [75 x 30 x 4"] [6ft x 2.5ft x 4inches] '
        'Royal Amarya-Poly Cotton Fabric - Fully Quilted Mattress, Single Layer  ( S.L)'
        ' foam Mattress addresses comfort while sleeping',
    'The Charles Eames Chair is a timeless classic that will never go out of fashion.'
        ' Our replica design is a commemoration of the original and mirrors its style,'
        ' quality and beauty. Molded to the shape of the body, this replica design is available '
        'in white plastic. The unique Eiffel tower wood legs are constructed from durable wood material.'
        ' Like the original,'
        ' our plastic version displays round markings on the seat. '
        'This is a natural result of the legs meeting the material.',
    'Nothing says great job like an OK hand! Love this decorative accessory to put in a bookcase or on your desk. '
        'Even better give this gift to someone that is doing an amazing job at work or someone who you are proud of.',
      'Mini Bar and Table\nComes assembled\nSize: (H55cm : W45cm : D45cm : Shelf H29cm :'
          ' open W77cm)\nAvailable colour options: Wenge, walnut, birch,  black.',
      'Smooth angled arms, rounded seats and button-back cushions combine to create the ultimate in relaxed'
          ' cool.\n\nComes with foam-filled seat cushions for a beautiful look that bounces back - '
          'with no need to plump- Or choose our Contour Comfort Dual Layer Memory Foam cushions which '
          'respond to your body\'s contours to provide the ultimate comfort and support Shown with optional '
          'scatter cushions, available at extra cost Comes with two free bolster cushions',
      'Our vases are suitable for balconies, living rooms, bedrooms, office ，bathrooms, study rooms, dining rooms, bars, kitchens, cafes, weddings, etc. You can place various flowers, such as roses, lilies, tulips, various fake flowers, dried flowers or hydroponic plants. Not only beautiful flowers but also other exquisite works are exhibited. Alternatively, you can use it alone as a decoration. It has excellent features. '
    ];

    List<String> names = ['Royal Amarya-Poly Cotton Fabric - 15 Density foam - Side Quilted Mattress',
    'Charles Eames Dining Table and Chair',
      'Silver Ceramic OK Hand Sculpture',
      'Mini Bar and Table',
      'Zinc Right Hand Sectional Sofa',
      'Nordic ceramics Gold White Vase'
    ];

    products = List.generate(6, (index) =>
    Product(
      quantity: 0,
      name: names[index],
      image: images[index],
      desc: descriptions[index],
      unitPrice: prices[index]
    ));
    return;
  }
}