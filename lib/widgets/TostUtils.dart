import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class utils {
  void tostmessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
//  SizedBox(
//                 height: 212,
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: productDetails.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var product = Product(
//                       brandname: productDetails[index]['Brand Name']
//                           .toString()
//                           .toUpperCase(),
//                       name: productDetails[index]['Name']
//                           .toString()
//                           .toUpperCase(),
//                       Description:
//                           productDetails[index]['Description'].toString(),
//                       price: productDetails[index]['price']
//                           .toString()
//                           .toUpperCase(),
//                       review: productDetails[index]['review'].toString(),
//                       reviewNo: productDetails[index]['reviewNo'].toString(),
//                       customerCare:
//                           productDetails[index]['customerCare'].toString(),
//                       BrandDescription:
//                           productDetails[index]['BrandDescription'].toString(),
//                       Shoesimage1:
//                           productDetails[index]['Shoesimage1'].toString(),
//                       Shoesimage2:
//                           productDetails[index]['Shoesimage2'].toString(),
//                       Shoesimage3:
//                           productDetails[index]['Shoesimage3'].toString(),
//                       ProductDetail:
//                           productDetails[index]['ProductDetail'].toString(),
//                     );

//                     return DisCoveMoreScreen(
//                       ShoesImage:
//                           ShoesPicsDiscover[index]['ShoesImage'].toString(),
//                       name: ShoesPicsDiscover[index]['name']
//                           .toString()
//                           .toUpperCase(),
//                       salePrice: ShoesPicsDiscover[index]['SaleProce']
//                           .toString()
//                           .toUpperCase(),
//                       MRPProce: ShoesPicsDiscover[index]['MRPProce'].toString(),
//                       rating: ShoesPicsDiscover[index]['Ratings']
//                           .toString()
//                           .toUpperCase(),
//                       numberReview:
//                           ShoesPicsDiscover[index]['NumberReview'].toString(),
//                     );
//                   },
//                 ),
//               ),
