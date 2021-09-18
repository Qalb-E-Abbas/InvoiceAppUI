import 'package:flutter/material.dart';
import 'package:invoiceapp/Widget/Box3.dart';
import 'package:invoiceapp/Widget/Ibox4.dart';
import 'package:invoiceapp/Widget/button.dart';
import 'package:invoiceapp/Widget/discountbox.dart';
import 'package:invoiceapp/constant.dart';
class EditInvoicePage extends StatefulWidget {
  const EditInvoicePage({Key? key}) : super(key: key);

  @override
  _EditInvoicePageState createState() => _EditInvoicePageState();
}

class _EditInvoicePageState extends State<EditInvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 33,
        backgroundColor: Colors.white,
        child: FloatingActionButton(

          onPressed: (){},
          backgroundColor: AppColors.primeryColor,
          child: Icon(Icons.send,color: Colors.white,),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey[300],
          child: Column(
            children: [
              Ibox3(
                text:"INV001",
                  ClientName:"Business info",
                  date:"06/09/2021",
              ),
              SizedBox(
                height: 10,
              ),
              Ibox4(
                text: "To: Client",
              ),
              SizedBox(
                height: 10,
              ),
              Ibox5(Itemtext: "Add Item Detail", total:"400", price: "0*200", price2: "0*200"),
              SizedBox(
                height: 10,
              ),
              DiscountBox(
                discountPrice: 'Discount Amount',
                disPrice: "Total: 400",
                taxPrice: "Text",
                tPrice1: "0*200",
                totalPrice: "Total",
                totlPrice1: "0*200",
                paymentPrice: "Payment",
                payPrice1: "0*200",

              ),
              Button(
                pressed: (){},
                text: "Add Photos & Description ",
                textcolor:AppColors.primeryColor ,
                colors: Colors.white,
                bordercolor: AppColors.primeryColor,
              ),
              SizedBox(
                height: 10,
              ),
              Ibox6(
                text: "Payment instruction",
                Client: "Notes",
                text2: "Add Signature",

              ),
              Button(
                pressed: (){},
                text: "Mark Pad",
                textcolor: Colors.white,
                colors: AppColors.primeryColor,
                bordercolor: AppColors.primeryColor,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
