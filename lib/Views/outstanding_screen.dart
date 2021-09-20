import 'package:flutter/material.dart';
import 'package:invoiceapp/elements/Outstanding%20Screen/outstandingscreen_container.dart';

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
          color: Colors.grey[300],
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.59,
                child: ListView.separated(
                  separatorBuilder: (ctx, index) => Container(height: 10,),
                    scrollDirection: Axis.vertical,
                    itemCount: 5,
                    itemBuilder: (BuildContext context,int index){
                      return Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: OutstaningScreenContainer(
                          ClientName: "ClientName",
                          icon: Icons.edit,
                          text: "INV001",
                          price: "23 ",
                        ),
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

