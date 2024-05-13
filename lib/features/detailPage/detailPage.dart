import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_bag/model/model.dart';
import 'package:shopping_bag/utils/textStyles.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.selectedBag});
  final BagModel selectedBag;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Evaly'),
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(
              Icons.person_2_outlined,
              size: 32,
            ),
          )
        ],
      ),
      body: Container(

        child: Column(
          children: [
            Container(
              width: double.maxFinite,
                height: MediaQuery.of(context).size.height*0.4,
            decoration:  BoxDecoration(

              image: DecorationImage(image: NetworkImage(widget.selectedBag.productImg.toString()))
            ),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
                thickness: 15,
            ),
            ListTile(
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              titleAlignment: ListTileTitleAlignment.center,

              leading: Text("SKU",
              style: MyTextStyles.PmainTitle.copyWith(
                fontSize: 18,
                color: Colors.black,
              ),),
              title: Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Text("0x4c56sd",
                  style: MyTextStyles.PmainTitle.copyWith(
                    fontSize: 20
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
              thickness: 15,
            ),
            ListTile(
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              titleAlignment: ListTileTitleAlignment.center,

              leading: Text("Price",
                style: MyTextStyles.PmainTitle.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),),

              trailing: Text("Rs ${widget.selectedBag.productPrice}",
              style: MyTextStyles.PmainTitle.copyWith(
                fontSize: 18,
                color: Colors.orange
              ),),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
              thickness: 15,
            ),
            ListTile(
              dense: false,
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              titleAlignment: ListTileTitleAlignment.center,

              leading: Text("Description",
                style: MyTextStyles.PmainTitle.copyWith(
                  fontSize: 18,
                  color: Colors.black,
                ),),

            ),
            Divider(
              color: Colors.grey.withOpacity(0.1),
              thickness: 15,
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
               width: double.maxFinite,
               height: 55,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
              
               ),
               child:   Row(
                 children: [
                   Padding(
                     padding: EdgeInsets.only(left: 20),
                     child: Icon(Icons.favorite_outline,weight: 50,
                     size: 20,),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(left: 20),
                     child: Container(
                       height: double.maxFinite,
                       width: 120,
                       color: Colors.red.shade100,
                       child: Center(child: Text("ADD TO CART",
                       style: MyTextStyles.PmainTitle.copyWith(
                         fontSize: 17
                       ),)),
                     ),
                   ),
                   Expanded(
                     child: Container(
                       height: double.maxFinite,
                       width: 150,
                       decoration: const BoxDecoration(
                         color: Colors.red,
                         borderRadius: BorderRadius.only(topRight: Radius.circular(15),
                         bottomRight: Radius.circular(15))
                       ),
                       child: Center(child: Text("AVAILABLE AT SHOPS",
                         style: MyTextStyles.PmainTitle.copyWith(
                             fontSize: 17,
                           color: Colors.white
                         ),)),
                     ),
                   ),
                 ],
               ),
             ),
           )
          ],
        ),
      ),
    );
  }
}
