import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yummi/models/pizzaModel.dart';

class OrderDetail extends StatefulWidget {
  final List<PizzaModel> items;
  OrderDetail(this.items);
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  Widget _singleCartItem(PizzaModel map) {
    return ListTile(
      title: Text(map.title),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: Colors.blue[900],
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 5,
          ),
          Text('Quantity: ${map.quantity}'),
          Text(_currency == 'dollars'
              ? 'Price: \$ ${map.price * map.quantity} '
              : 'Price: \€ ${((map.price * 0.9) * map.quantity).toStringAsFixed(2)}')
        ],
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.remove,
          color: Colors.red,
        ),
        onPressed: () {
          setState(() {
            widget.items.remove(map);
          });
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      widget.items.forEach((element) {
        double _priceEach = (element.quantity * element.price);
        totalPrice = totalPrice + _priceEach;
        print(totalPrice);
      });
    });
  }

  String _name;
  String _email;
  String _state;
  String _city;
  String _town;

  String _currency = 'dollars';
  double totalPrice = 10;

  final focusEmail = FocusNode();
  final focusCity = FocusNode();
  final focusTown = FocusNode();

  void _handleSubmittedName(String value) {
    _name = value.trim();
    print(_name);
    FocusScope.of(context).requestFocus(focusEmail);
  }

  void _handleSubmittedEmail(String value) {
    _email = value.trim();
    print(_email);
    FocusScope.of(context).unfocus();
  }

  void _handleSubmittedState(String value) {
    _state = value.trim();
    print(_state);
    FocusScope.of(context).requestFocus(focusCity);
  }

  void _handleSubmittedCity(String value) {
    _city = value.trim();
    print(_city);
    FocusScope.of(context).requestFocus(focusTown);
  }

  void _handleSubmittedTown(String value) {
    _town = value.trim();
    print(_town);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.orange,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          _currency == 'dollars'
              ? IconButton(
                  icon: Icon(
                    Icons.monetization_on,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() {
                      _currency = 'euro';
                    });
                  },
                )
              : IconButton(
                  icon: Icon(
                    Icons.money_off,
                    color: Colors.orange,
                  ),
                  onPressed: () {
                    setState(() {
                      _currency = 'dollars';
                    });
                  },
                )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: widget.items.length >= 1
              ? Column(
                  children: [
                    Container(
                      height: 200,
                      child: ListView(
                        children: widget.items.map((map) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.orange, width: 0.5),
                                borderRadius: BorderRadius.circular(8)),
                            child: _singleCartItem(map),
                          );
                        }).toList(),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.orange, width: 0.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: ExpansionTile(
                        title: Text(
                          'Contact Details',
                          style: TextStyle(color: Colors.black),
                        ),
                        children: [
                          Form(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Name'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a name';
                                    }
                                    return null;
                                  },
                                  autovalidate: true,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: _handleSubmittedName,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Email'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide an email';
                                    }
                                    return null;
                                  },
                                  autovalidate: true,
                                  focusNode: focusEmail,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: _handleSubmittedEmail,
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.orange, width: 0.5),
                          borderRadius: BorderRadius.circular(8)),
                      child: ExpansionTile(
                        title: Text(
                          'Delivery Address',
                          style: TextStyle(color: Colors.black),
                        ),
                        subtitle: Text(_currency == 'dollars'
                            ? 'Delivery Cost: \$ 10'
                            : 'Delivery Cost: \€ 9'),
                        children: [
                          Form(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'State / Region'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a region';
                                    }
                                    return null;
                                  },
                                  autovalidate: true,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: _handleSubmittedState,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'City'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a city';
                                    }
                                    return null;
                                  },
                                  autovalidate: true,
                                  focusNode: focusCity,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: _handleSubmittedCity,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Town'),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please provide a town';
                                    }
                                    return null;
                                  },
                                  autovalidate: true,
                                  focusNode: focusTown,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: _handleSubmittedTown,
                                ),
                              ],
                            ),
                          ))
                        ],
                      ),
                    )
                  ],
                )
              : Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(Icons.remove_shopping_cart),
                        SizedBox(height: 10),
                        Text('Your cart is empty')
                      ],
                    ),
                  ),
                ),
        ),
      ),
      bottomSheet: widget.items.length >= 1
          ? Container(
              height: MediaQuery.of(context).size.height * 0.2,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.black),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Price',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      Text(
                        _currency == 'dollars'
                            ? '\$ ${totalPrice.toStringAsFixed(2)}'
                            : '\€ ${(totalPrice * 0.9).toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        if (_name == null ||
                            _email == null ||
                            _state == null ||
                            _city == null ||
                            _town == null) {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text(
                                    'One or more fields is missing',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  actions: [
                                    FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          'OK',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 18),
                                        ))
                                  ],
                                );
                              });
                        } else {
                          showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return CupertinoAlertDialog(
                                  title: Text(
                                    _currency == 'dollars'
                                        ? 'Order will be delivered to $_name of $_city in $_town. Please pay \$ ${totalPrice.toStringAsFixed(2)}'
                                        : 'Order will be delivered to $_name of $_city in $_town. Please pay \€ ${totalPrice.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  actions: [
                                    FlatButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text(
                                          'COMPLETE',
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 18),
                                        ))
                                  ],
                                );
                              });
                        }
                      },
                      padding: EdgeInsets.all(12),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.orange,
                      elevation: 10,
                      child: Text(
                        'PROCEED',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
            )
          : Container(
              height: 0,
              width: 0,
            ),
    );
  }
}
