import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Core/UseCase/homecontroller.dart';
import 'package:travel_app/Core/models/model.dart';
import 'package:travel_app/Presentation/Widget/popular.dart';
import 'package:travel_app/Presentation/Widget/wisata.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Login? dataUser;
  List<Categories> data = [];

  getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dataUser = loginFromJson(prefs.getString('Login')!);
    });
    Homecontroller().getCategory().then(
      (value) {
        setState(() {
          if (value != null) {
            data = value;
          }
        });
      },
    );
  }

  @override
  @override
  void initState() {
    getData();
    // getCategories();
    super.initState();
  }

  // Future getCategories() async {
  //   final data = Homecontroller().getCategory().then(
  //     (value) {
  //       if (value != null) {
  //         setState(() {
  //           this.datacategory = value;
  //         });
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/img/beach.png'),
                    ),
                    SizedBox(width: 10),
                    Row(
                      children: [
                        Text(
                          "HI ${dataUser?.data.name}",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.notification_add, color: Colors.grey),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Where do you want to explore today?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: "Search destination",
                prefixIcon: Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Choose Category",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
                children: List.generate(
              data.length,
              (index) {
                print("gagal loop${data[index]}");
                return categoryContainer(data[index].name, data[index].image);
              },
            )),
            SizedBox(height: 20),
            Text(
              "Favorite Place",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                child: Wrap(
                  spacing: 10,
                  children: [
                    Wisata("assets/img/page1.jpg", "Tempat Wisata",
                        "Jonggol, Indonesia", "4.8", tinggi, lebar, context),
                    Wisata("assets/img/page1.jpg", "Tempat Wisata",
                        "Jonggol, Indonesia", "4.8", tinggi, lebar, context),
                    Wisata("assets/img/page1.jpg", "Tempat Wisata",
                        "Jonggol, Indonesia", "4.8", tinggi, lebar, context),
                    Wisata("assets/img/page1.jpg", "Tempat Wisata",
                        "Jonggol, Indonesia", "4.8", tinggi, lebar, context),
                    Wisata("assets/img/page1.jpg", "Tempat Wisata",
                        "Jonggol, Indonesia", "4.8", tinggi, lebar, context),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Package",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SizedBox(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Popular(
                        "assets/img/page1.jpg",
                        "Tempat Wisata",
                        "500000",
                        4.8,
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
                        lebar,
                        tinggi),
                    Popular(
                        "assets/img/page2.jpg",
                        "Tempat Wisata",
                        "300000",
                        4.8,
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
                        lebar,
                        tinggi),
                    Popular(
                        "assets/img/page3.jpg",
                        "Tempat Wisata",
                        "800000",
                        4.8,
                        "Lorem ipsum dolor sit amet consectetur adipisicing elit...",
                        lebar,
                        tinggi),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget categoryContainer(String title, String image) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Image.network(
            image,
          ),
          SizedBox(width: 5),
          Text(title),
        ],
      ),
    );
  }
}
