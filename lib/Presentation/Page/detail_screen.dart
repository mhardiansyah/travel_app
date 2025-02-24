import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kuta Beach"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(16),
            //   child: Image.asset(
            //     "assets/img/page1.jpg",
            //     width: double.infinity,
            //     height: 200,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 16),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/img/page1.jpg")),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text("kuta beach",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      )),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(
                        Icons.place_outlined,
                        color: Colors.white,
                      ),
                      Text("Bali, Indonesia",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text("100+",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                      Text("people have explore",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 4),
                      Text(
                        "4.8",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Bali, Indonesia",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "What's Included?",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                categoryContainer("Flight", Icons.flight),
                SizedBox(width: 10),
                categoryContainer("Hotel", Icons.hotel),
                SizedBox(width: 10),
                categoryContainer("Transport", Icons.emoji_transportation),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "About Trip",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Bali is a tropical paradise known for its white sandy beaches, vibrant nightlife, and beautiful scenery. Enjoy the warm hospitality and breathtaking views!",
            ),
            const SizedBox(height: 16),
            const Text(
              "Gallery Photo",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/img/page1.jpg",
                          ),
                          fit: BoxFit.cover),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/img/page1.jpg",
                          ),
                          fit: BoxFit.cover),
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/img/page1.jpg",
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                        child: Text("+20",
                            style:
                                TextStyle(color: Colors.white, fontSize: 14))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "Reviews (99)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/img/page1.jpg"),
              ),
              title: const Text("Yelena Belova"),
              subtitle: const Text("Pretty nice place..."),
              trailing: const Icon(Icons.star, color: Colors.orange),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "\$745.00 / Person",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Booking Now",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget categoryContainer(String title, IconData icon) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        Icon(
          icon,
          color: Colors.yellow,
        ),
        SizedBox(width: 5),
        Text(title),
      ],
    ),
  );
}
