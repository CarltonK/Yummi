import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:yummi/screens/pizzas.dart';

class Welcome extends StatelessWidget {
  Widget _textBuilder(String content, Color color) {
    return Text(
      content,
      style: TextStyle(
          color: color,
          fontSize: 30,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: Stack(
            children: [
              Image(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1571175351968-be8b8b5da866?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80'),
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
              LayoutBuilder(builder: (context, constraints) {
                return Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _textBuilder('GET', Colors.white),
                      SizedBox(height: 10),
                      _textBuilder('THE FASTEST', Colors.white),
                      SizedBox(height: 10),
                      _textBuilder('DELIVERY', Colors.white),
                      SizedBox(
                        height: 40,
                      ),
                      _textBuilder(
                          'Order Pizza and Get', Colors.yellowAccent[400]),
                      SizedBox(
                        height: 10,
                      ),
                      _textBuilder('Delivery in Fastest Time in Town',
                          Colors.yellowAccent[400]),
                    ],
                  ),
                );
              }),
              Positioned(
                bottom: 40,
                left: 40,
                right: 40,
                child: Center(
                  child: Container(
                    child: MaterialButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return new Pizzas();
                          },
                        ),
                      ),
                      splashColor: Colors.white,
                      elevation: 20,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          letterSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
