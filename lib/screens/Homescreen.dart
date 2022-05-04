import 'package:flutter/material.dart';
import 'package:sample/tabs/All.dart';
import 'package:sample/tabs/crafs.dart';
import 'package:sample/tabs/gifts.dart';
import 'package:sample/tabs/paintings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wdth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 20),
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: 'Search for paintings, cloths and more',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Flexible(
                        child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Color(0xffFF4400),
                      ),
                    ))
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 0,
              child: TabBar(
                  indicator: ShapeDecoration(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  labelColor: Colors.white,
                  controller: _tabcontroller,
                  tabs: const [
                    Tab(
                      text: 'All',
                    ),
                    Tab(
                      text: 'crafts',
                    ),
                    Tab(
                      text: 'gifts',
                    ),
                    Tab(
                      text: 'paintings',
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabcontroller, children: const [
                AllCatogery(),
                craftsCategory(),
                GiftCategory(),
                paintingscategory()
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
