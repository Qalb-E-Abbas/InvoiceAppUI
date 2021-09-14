import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/ContainBox.dart';

class OutStandingScreen extends StatefulWidget {
  const OutStandingScreen({Key? key}) : super(key: key);

  @override
  _OutStandingScreenState createState() => _OutStandingScreenState();
}

class _OutStandingScreenState extends State<OutStandingScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 8,
                    itemBuilder: (BuildContext context,int index){
                      return ContainerBox(
                        ClientName: "ClientName",
                        icon: Icons.edit,
                        text: "INV001",
                        price: "23 ",
                      );
                    }
                ),
              ),
            ],
          )
      ),
    );
  }
}

