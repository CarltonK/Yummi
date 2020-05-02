import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yummi/models/pizzaModel.dart';
import 'package:yummi/screens/orderDetail.dart';
import 'package:yummi/widgets/starRate.dart';

class PizzaDetail extends StatefulWidget {
  final PizzaModel model;

  PizzaDetail({this.model});
  @override
  _PizzaDetailState createState() => _PizzaDetailState();
}

class _PizzaDetailState extends State<PizzaDetail> {
  int _quantity = 1;
  double _totalPrice = 1;
  List<PizzaModel> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.orange,
          iconSize: 30,
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
                                        style:
                                            TextStyle(color: Colors.blue[700]),
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
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                    tag: widget.model.title,
                    child: Image(image: NetworkImage(widget.model.imageUrl))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.model.title,
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarDisplay(
                            value: widget.model.rating.toInt(),
                          ),
                          Text(
                            '${widget.model.price.toInt().toString()} KES',
                            style: TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.model.description,
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: MediaQuery.of(context).size.height * 0.2,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: Colors.black),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _quantity--;
                          _totalPrice = _quantity * (widget.model.price);
                        });
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '$_quantity',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          _quantity++;
                          _totalPrice = _quantity * (widget.model.price);
                          widget.model.quantity = _quantity;
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  _quantity == 1
                      ? '${widget.model.price.toInt().toString()} KES'
                      : '$_totalPrice KES',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    if (_items.contains(widget.model)) {
                      _items.remove(widget.model);
                    } else {
                      _items.add(widget.model);
                    }
                  });
                },
                padding: EdgeInsets.all(12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: _items.contains(widget.model)
                    ? Colors.green
                    : Colors.orange,
                elevation: 10,
                child: Text(
                  _items.contains(widget.model)
                      ? 'Added to cart'
                      : 'Add to Cart',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
