import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample/products/products.dart';
import 'package:sample/widgets/BuyNowButton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductInfo extends StatefulWidget {
  final Product product;
  int itemindex;
  //VoidCallback press;
  ProductInfo({Key? key, required this.product, required this.itemindex

      /*required this.press*/
      })
      : super(key: key);

  @override
  State<ProductInfo> createState() => _ProductInfoState(itemindex);
}

class _ProductInfoState extends State<ProductInfo>
    with SingleTickerProviderStateMixin {
  int activeindex = 0;

  _ProductInfoState(int itemindex);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ' Products',
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700, color: Colors.black, fontSize: 17),
          ),
          leading: IconButton(
            icon:
                const Icon(Icons.arrow_back_ios_new, color: Color(0xffFF4400)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                    ),
                    width: double.maxFinite,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: CarouselSlider.builder(
                            itemCount: 4,
                            itemBuilder: (context, index, realindex) {
                              return Container(
                                  width: double.maxFinite,
                                  color: Colors.transparent,
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        widget.product.images[index]),
                                  ));
                            },
                            options: CarouselOptions(
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    activeindex = index;
                                  });
                                },
                                viewportFraction: 1,
                                height: 280,
                                enableInfiniteScroll: false),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AnimatedSmoothIndicator(
                            effect: const WormEffect(
                                dotColor: Color(0xffC4C4C4),
                                activeDotColor: Color(0xffFF4400),
                                dotHeight: 10,
                                dotWidth: 10),
                            activeIndex: activeindex,
                            count: products[widget.itemindex].images.length),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  widget.product.title,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.product.description,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.w400, fontSize: 15)),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '₹' + widget.product.price.toString(),
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w700, fontSize: 24),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 1,
                  color: Color(0xffEDEDED),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Description',
                  style: GoogleFonts.lato(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff79747E)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  ''' W x H: 14Inch x 20Inch\n\nType: Fabric Paint\n\nFrame Included\n\n\n
                    There are many variations of passages of Lorem Ipsum available,
                     but the majority have suffered alteration in some form, by injected humour, 
                     or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum,
                      you need to be sure there isn't anything embarrassing hidden in 
                      the middle of text ''',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BuyNowButton(
          itemindex: widget.itemindex,
          product: widget.product,
        ),
      ),
    );
  }
}
