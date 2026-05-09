import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:eqraa_book_store/core/constants/text_style.dart';
import 'package:flutter/material.dart';

class BookDetailsScreen extends StatefulWidget {
  final String title;
  final String author;
  final String imageUrl;
  final double price;
  final double rating;
  final String language;
  final int pages;

  const BookDetailsScreen({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.language,
    required this.pages,
  });

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  bool _isExpanded = false;
  final String _description =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here' making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.";

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: Image.asset("assets/arrowIcon.png", height: screenHeight * 0.025),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border_outlined, size: screenWidth * 0.06),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("assets/shareIcon.png", height: screenHeight * 0.03),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset("assets/cartIcon.png", height: screenHeight * 0.03),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: screenHeight * 0.55,
                    width: double.infinity,
                    margin: EdgeInsets.only(top: screenHeight * 0.12),
                    padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.05,
                      screenHeight * 0.2,
                      screenWidth * 0.05,
                      screenHeight * 0.03,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0F4FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          "By ${widget.author}",
                          style: StylesManager.textStyle15px.copyWith(
                            fontSize: screenWidth * 0.035,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _StatItem(
                              label: "Pages",
                              value: widget.pages.toString(),
                            ),
                            _StatItem(
                              label: "Language",
                              value: widget.language,
                            ),
                            _StatItem(
                              label: "Ratings",
                              value: widget.rating.toString(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: screenHeight * 0.45,
                    width: screenWidth * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(widget.imageUrl),
                        fit: BoxFit.fill,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Descriptions",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text.rich(
                      TextSpan(
                        text: _isExpanded
                            ? _description
                            : "${_description.substring(0, 200)}... ",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          height: 1.6,
                          fontSize: screenWidth * 0.035,
                        ),
                        children: [
                          TextSpan(
                            text: _isExpanded ? " Show Less" : "Read More",
                            style: TextStyle(
                              color: Constants.mainColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    "Author",
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.07,
                        backgroundImage: const NetworkImage(
                          "https://i.pravatar.cc/150?u=author",
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.author,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Author",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF0F4FF),
                          foregroundColor: Constants.mainColor,
                          elevation: 0,
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.05,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: Text(
                          "View Profile",
                          style: TextStyle(fontSize: screenWidth * 0.03),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          screenWidth * 0.06,
          screenHeight * 0.02,
          screenWidth * 0.06,
          screenHeight * 0.04,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
                Text(
                  "\$${widget.price.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: screenWidth * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(width: screenWidth * 0.08),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Constants.mainColor,
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, screenHeight * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
                child: Text(
                  "Buy Now",
                  style: TextStyle(fontSize: screenWidth * 0.045),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;

  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 6),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}
