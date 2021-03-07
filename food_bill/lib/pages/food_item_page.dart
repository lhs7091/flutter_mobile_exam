import 'package:flutter/material.dart';
import 'package:food_bill/data/list_data.dart';

class FoodItemPage extends StatefulWidget {
  @override
  _FoodItemPageState createState() => _FoodItemPageState();
}

class _FoodItemPageState extends State<FoodItemPage> {
  int _panCount = 0;
  int _soupCount = 0;
  @override
  Widget build(BuildContext context) {
    List dishes = ListData().dishes;
    return Stack(
      children: [
        Positioned(
          top: 24,
          right: 8,
          left: 64,
          child: Container(
            height: MediaQuery.of(context).size.height / 1.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Colors Teste',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '1901 Thornridge Cir, Chilo, USA',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 8.0),
                //Main Dish 2 menu
                Container(
                  height: MediaQuery.of(context).size.height / 4.5,
                  width: double.infinity,
                  child: buildMainDishRowWidget(),
                ),
                // Menu List View
                Container(
                  height: MediaQuery.of(context).size.height / 2.3,
                  child: ListView.builder(
                      itemCount: dishes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dishes[index]['menu'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  SizedBox(height: 4.0),
                                  Text(
                                    "\$${dishes[index]['price']} each",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 48,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.remove),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
        // shopping list
        Positioned(
          bottom: 16,
          left: 16,
          right: 16,
          child: SizedBox(
            height: 64,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                    ),
                    Text(
                      '7 Items added',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16.0,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '\$55',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(width: 7),
                    Container(
                      height: 42,
                      width: 42,
                      child: Center(
                        child: Icon(Icons.arrow_right),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(7),
                      ),
                    ),
                    SizedBox(width: 7),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget buildMainDishRowWidget() {
    return Row(
      children: [
        buildMainDish(
            'https://cdn.pixabay.com/photo/2018/01/22/16/34/pancake-3099330__480.jpg',
            'Pancakes',
            8,
            _panCount),
        SizedBox(width: 16.0),
        buildMainDish(
            'https://cdn.pixabay.com/photo/2021/02/27/10/07/goulash-6054131__480.jpg',
            'Soup',
            7,
            _soupCount),
      ],
    );
  }

  Widget buildMainDish(
      String pictureUrl, String menuName, int price, int _count) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                image: DecorationImage(
                  image: NetworkImage(pictureUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(36),
                      ),
                      // Count set on Main two dishes
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _count + 1 > 10 ? _count = 10 : _count++;
                              setState(() {
                                'Pancakes' == menuName
                                    ? _panCount = _count
                                    : _soupCount = _count;
                              });
                            },
                          ),
                          Text(
                            '$_count',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              _count - 1 < 0 ? _count = 0 : _count--;
                              setState(() {
                                'Pancakes' == menuName
                                    ? _panCount = _count
                                    : _soupCount = _count;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    right: 10,
                    bottom: 16,
                    top: 30,
                  ),
                  Positioned(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.6),
                      foregroundColor: Colors.white,
                      child: Center(
                        child: Text('\$$price'),
                      ),
                    ),
                    left: 16,
                    bottom: 16,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Text(
                menuName,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
