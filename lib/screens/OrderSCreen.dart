import 'package:flutter/material.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  Widget build(BuildContext context) {
    double wdth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                  child: Container(
                    width: wdth,
                    decoration: BoxDecoration(
                        color: Color(0xffF4F4F4),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: [
                        SizedBox(
                          width: wdth * 0.78,
                          child: TextFormField(
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
                    ),
                  ),
                ),
                ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) => ListTile(
                          leading: Text('hello ${index + 1}'),
                        )),
                    separatorBuilder: (ctx, index) {
                      return Divider();
                    },
                    itemCount: 30)
              ],
            ),
          )),
    ));
  }
}

//search
class CustomSearchDelegate extends SearchDelegate {
  List<String> listitems = ['apple', 'mango', 'banana'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  //back end works  commenting here
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchquery = [];
    for (var fruit in listitems) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    for (var fruit in listitems) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchquery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchquery.length,
        itemBuilder: (context, index) {
          var result = matchquery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }
}
