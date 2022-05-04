import 'package:flutter/material.dart';

import '../screens/OrderSCreen.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _txtsearch = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    return Container(
        child: Row(
      children: [
        SizedBox(
          width: wdth * 0.78,
          child: TextFormField(
            controller: _txtsearch,
            onTap: () => showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            ),
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              hintText: 'Search orders',
              border: InputBorder.none,
            ),
          ),
        ),
        Flexible(
            child: IconButton(
          onPressed: () {
            showSearch(
              context: context,
              delegate: CustomSearchDelegate(),
            );
          },
          icon: Icon(
            Icons.search,
            color: Color(0xffFF4400),
          ),
        ))
      ],
    ));
  }
}
