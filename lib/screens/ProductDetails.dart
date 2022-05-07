import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/products/products.dart';
import 'package:sample/widgets/ConfirmButton.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String dropdownvalue = "Block A";
  List<String> dropdownlist = ['Block A', 'Block B', 'Block C', 'Block D'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                'Details Page',
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontSize: 17),
              ),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new,
                    color: Color(0xffFF4400)),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: SingleChildScrollView(
              reverse: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(color: Colors.transparent),
                          width: 100,
                          child: Image(
                            image: AssetImage(widget.product.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.product.title,
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text('Item Description'),
                                Text(
                                  '\$ ${widget.product.price}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xffEDEDED),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffDFF0FF)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.info_outline,
                                size: 30,
                              ),
                              Text(
                                ' Please pay cash at the time of delivery',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      color: Color(0xffEDEDED),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'You are just one step away!',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Please share your contact details for a seamless delivery.',
                      style: TextStyle(
                        color: Color(0xff79747E),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Mobile number',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: '1234567890',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      'Select your block',
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        elevation: 0,
                        isExpanded: true,
                        value: dropdownvalue,
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (String? newvalue) {
                          setState(() {
                            dropdownvalue = newvalue!;
                          });
                        },
                        items: dropdownlist
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const ConfirmButton()));
  }
}
