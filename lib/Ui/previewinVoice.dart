import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoiceView extends StatefulWidget {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  _InvoiceViewState createState() => _InvoiceViewState();
}

class _InvoiceViewState extends State<InvoiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:  FloatingActionButton(
        elevation: 0.0,
        child: new Icon(Icons.send_sharp),
        backgroundColor: Colors.blue,
        onPressed: (){}
    ),
      body: _getUI(context),
    );
  }

  Widget _getUI(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/images.jpg'),
                            fit: BoxFit.cover)),
                    height: 50,
                    width: 80,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Business Name',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InvoiceFormWidget(
              text: 'invoice Form',
              style: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 15),
              text1: 'Invoice To',
              style1: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 10,
            ),
            InvoiceFormWidget(
              text: 'Phone',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: '+928300329302',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 5,
            ),
            InvoiceFormWidget(
              text: 'email',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: 'email@.com',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 5,
            ),
            InvoiceFormWidget(
              text: 'www.website.com',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              text1: 'Luram ipsum  To',
              style1: TextStyle(
                  color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SearchWidget('Racharge', 'Avjdf'),
                      SearchWidget('Date', '09/6/2021'),
                      SearchWidget('Due Date', '09/6/2021'),
                      SearchWidget('Balance Due', 'Ejujl'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  DescriptionWidget('Descreption', 'Rate', 'Qnt'),
                  SizedBox(
                    height: 15,
                  ),
                  DescriptionWidget('Luram Epsum', '500', '5'),
                  SizedBox(
                    height: 5,
                  ),
                  DescriptionWidget('', 'Discount', '20'),
                  SizedBox(
                    height: 5,
                  ),
                  DescriptionWidget('', 'Subtotal', '450'),
                  SizedBox(
                    height: 5,
                  ),
                  DescriptionWidget('', 'Tax', '34'),
                  SizedBox(
                    height: 5,
                  ),
                  DescriptionWidget('', 'Total', '450'),
                ],
              ),
            ),
            SizedBox(height: 88,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('PayPal Code'),
                  SizedBox(height: 8,),
                  Text('Bank Transfer'),
                  SizedBox(height: 8,),
                  Text('Bank Trancaction'),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Text('ThankYou for our Bussiness'),
            )

          ],
        ),
      ),
    );
  }
}

class InvoiceFormWidget extends StatelessWidget {
  String? text;
  String? text1;
  var style;
  var style1;

  InvoiceFormWidget({
    this.text,
    this.text1,
    this.style,
    this.style1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text!,
            style: style,
          ),
          Text(
            text1!,
            style: style,
          ),
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  String text;
  String text1;

  SearchWidget(this.text, this.text1);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        SizedBox(
          height: 20,
        ),
        Text(text1),
      ],
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  String text;
  String text1;
  String text2;

  DescriptionWidget(this.text, this.text1, this.text2);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(width: 120, child: Text(text)),
          Text(text1),
          Text(text2),
        ],
      ),
    );
  }
}
