import 'package:flutter/material.dart';
import 'package:travel_app/Presentation/Widget/popular.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<Map<String, dynamic>> destinations = [
    {
      "image": "assets/img/page1.jpg",
      "title": "Pantai Kuta",
      "price": "500000",
      "rating": 4.8
    },
    {
      "image": "assets/img/page2.jpg",
      "title": "Ubud Forest",
      "price": "300000",
      "rating": 4.7
    },
    {
      "image": "assets/img/page3.jpg",
      "title": "Tanah Lot",
      "price": "800000",
      "rating": 4.9
    },
  ];

  List<Map<String, dynamic>> filteredDestinations = [];

  @override
  void initState() {
    super.initState();
    filteredDestinations = destinations;
  }

  void filterSearch(String query) {
    List<Map<String, dynamic>> temp = destinations
        .where((destination) =>
            destination['title'].toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredDestinations = temp;
    });
  }

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Menyesuaikan tinggi modal dengan konten
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6, // Awal modal 60% tinggi layar
          minChildSize: 0.4,
          maxChildSize: 0.9,
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Range Price"),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.black,
                        inactiveTrackColor: Colors.grey[300],
                        thumbColor: Colors.black,
                      ),
                      child: RangeSlider(
                        values: RangeValues(100, 590),
                        min: 100,
                        max: 7000,
                        onChanged: (RangeValues values) {},
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("Star Review"),
                    Column(
                      children: List.generate(5, (index) {
                        return ListTile(
                          leading: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(5, (i) {
                              return Icon(
                                Icons.star,
                                color: i <= index ? Colors.amber : Colors.grey,
                              );
                            }),
                          ),
                          trailing: index == 0
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : null,
                        );
                      }),
                    ),
                    SizedBox(height: 16),
                    Text("Included"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FilterChip(
                            label: Text("All"),
                            selected: true,
                            onSelected: (bool value) {}),
                        FilterChip(
                            label: Text("Flight"),
                            selected: false,
                            onSelected: (bool value) {}),
                        FilterChip(
                            label: Text("Hotel"),
                            selected: false,
                            onSelected: (bool value) {}),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: () {}, child: Text("Clear All")),
                        ElevatedButton(onPressed: () {}, child: Text("Apply")),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Search', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: showFilterSheet,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: searchController,
                onChanged: filterSearch,
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
              SizedBox(height: 16),
              Text(
                'We found ${filteredDestinations.length} trips',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Column(
                children: filteredDestinations.map((destination) {
                  return Popular(
                    destination["image"],
                    destination["title"],
                    destination["price"],
                    destination["rating"],
                    "Lorem ipsum dolor sit amet...",
                    lebar,
                    tinggi,
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
