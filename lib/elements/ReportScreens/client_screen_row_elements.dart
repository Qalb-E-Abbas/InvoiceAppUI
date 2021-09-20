// import 'package:flutter/material.dart';
// import 'package:invoiceapp/common/dynamicFont.dart';
// import 'package:invoiceapp/common/vertical_height.dart';
//
//
// class ClientScreenRow extends StatelessWidget {
//
//   String yearText;
//   String invoiceText;
//   String paidText;
//
//
//   ClientScreenRow({required this.yearText, required this.invoiceText, required this.paidText});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height*0.97,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(3),
//         color: Colors.white,
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//
//                 DynamicFontSize(label: '2021', fontSize: 14,fontWeight: FontWeight.w700 ),
//
//                 DynamicFontSize(label: 'Invoice', fontSize: 14,fontWeight: FontWeight.w700 ),
//
//                 DynamicFontSize(label: 'Paid', fontSize: 14,fontWeight: FontWeight.w700 )
//
//               ],
//             ),
//             VerticalHeight(
//               height: 20,
//             ),
//
//
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(yearText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
//                 Container(
//                   width: MediaQuery.of(context).size.height*0.2,
//
//
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       //Text(clientText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
//                       Text(invoiceText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
//                       Text(paidText,style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w700),),
//
//                     ],
//                   ),
//                 )
//               ],
//             ),
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
