import 'package:flutter/material.dart';
import 'package:invoiceapp/Views/previewinVoice.dart';
import 'package:invoiceapp/common/custom_appBar.dart';
import 'package:invoiceapp/configurations/AppColors.dart';

import 'editinvoicescreen.dart';

class EditPreviewInvoiceTabs extends StatefulWidget {
  const EditPreviewInvoiceTabs({Key? key}) : super(key: key);

  @override
  _EditPreviewInvoiceTabsState createState() => _EditPreviewInvoiceTabsState();
}

class _EditPreviewInvoiceTabsState extends State<EditPreviewInvoiceTabs>
    with SingleTickerProviderStateMixin {



  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        floatingActionButton: CircleAvatar(
          radius: 33,
          backgroundColor: Colors.white,
          child: FloatingActionButton(

            onPressed: (){},
            backgroundColor: AppColors.primaryColor,
            child: Icon(Icons.send,color: Colors.white,),
          ),
        ),

      body: Column(
        children: [
          CustomAppBar(text: "Invoice", isClient: true),

          SizedBox(height: 20,),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (color and border radius)
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    10
                ),
                color: Colors.green,
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  text: 'Edit Invoice',
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  text: 'Preview invoice',
                ),

              ],
            ),
          ),

          Container(
            height: MediaQuery.of(context).size.height * 0.67,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
              )
            ),
            child: TabBarView(
              controller: _tabController,
              children: [
                EditInvoicePage(),
                PreviewInvoiceScreen(),
              ],
            ),
          ),

        ],
      )
    );
  }
}

