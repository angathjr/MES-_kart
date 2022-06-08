import 'package:flutter/gestures.dart';
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
  static int index = 0;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    double hght = MediaQuery.of(context).size.height;
    double wdth = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  hintText: 'Search for paintings, cloths and more',
                  filled: true,
                  fillColor: Color(0xffF4F4F4),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.search,
                      color: Color(0xffFF4400),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Flexible(
              flex: 0,
              child: TabBar(
                  onTap: (index) {
                    int updatedindex = index;
                  },
                  indicator: ShapeDecoration(
                      color: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: wdth * .060),
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
