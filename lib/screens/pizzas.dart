import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yummi/models/pizzaModel.dart';
import 'package:yummi/screens/orderDetail.dart';
import 'package:yummi/screens/pizzadetail.dart';
import 'package:yummi/widgets/starRate.dart';

class Pizzas extends StatefulWidget {
  @override
  _PizzasState createState() => _PizzasState();
}

class _PizzasState extends State<Pizzas> {
  PageController _pageController;
  int _pageSelected = 1;
  List<PizzaModel> _items = [];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _favoritesWheel(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
              height: Curves.easeInOut.transform(value) * double.maxFinite,
              width:
                  Curves.easeInOut.transform(value) * (0.9 * double.maxFinite),
              child: widget),
        );
      },
      child: GestureDetector(
          onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return new PizzaDetail(
                      model: pizzas[index],
                    );
                  },
                ),
              ),
          child: Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(20)),
            elevation: 2,
            child: Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Hero(
                        tag: pizzas[index].title,
                        child: Image(
                          height: double.maxFinite,
                          image: NetworkImage(pizzas[index].imageUrl),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            pizzas[index].title,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          StarDisplay(
                            value: pizzas[index].rating.toInt(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(pizzas[index].description),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${pizzas[index].price.toStringAsFixed(2)} \$',
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            color: _items.contains(pizzas[index])
                                ? Colors.green
                                : Colors.orange,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            onPressed: () {
                              setState(() {
                                if (_items.contains(pizzas[index])) {
                                  _items.remove(pizzas[index]);
                                } else {
                                  _items.add(pizzas[index]);
                                }
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _items.contains(pizzas[index])
                                    ? Icon(
                                        Icons.done,
                                        color: Colors.white,
                                      )
                                    : Icon(
                                        Icons.add_shopping_cart,
                                        color: Colors.white,
                                      ),
                                _items.contains(pizzas[index])
                                    ? Text(
                                        'Added to cart',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    : Text(
                                        'Add to cart',
                                        style: TextStyle(color: Colors.white),
                                      )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget _gridItem(PizzaModel map) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return new PizzaDetail(
              model: map,
            );
          },
        ),
      ),
      child: Container(
        width: double.maxFinite,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: Image(
                  image: NetworkImage(map.imageUrl),
                  height: 100,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              map.title,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: 5,
            ),
            StarDisplay(
              value: map.rating.toInt(),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '${map.price.toStringAsFixed(2)} \$',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Yummi',
            style: TextStyle(color: Colors.orange, fontSize: 30),
          ),
          centerTitle: true,
          actions: [
            Container(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.shopping_cart,
                      color: Colors.orange,
                      size: 36,
                    ),
                    onPressed: () {
                      _items.isNotEmpty
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => OrderDetail(_items),
                            ))
                          : showCupertinoModalPopup(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text('Your cart is empty'),
                                  actions: [
                                    FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                              color: Colors.blue[700]),
                                        ))
                                  ],
                                );
                              },
                            );
                    },
                  ),
                  _items.length > 0
                      ? Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            child: Text(
                              _items.length.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                    width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (value) {
                        setState(() {
                          _pageSelected = value;
                        });
                      },
                      itemCount: pizzas.length,
                      itemBuilder: (context, index) {
                        return _favoritesWheel(index);
                      },
                    )),
              ),
              Expanded(
                  flex: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Today Special',
                          style: TextStyle(fontSize: 30),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            padding: const EdgeInsets.all(5),
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            children:
                                pizzas.map((map) => _gridItem(map)).toList(),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
