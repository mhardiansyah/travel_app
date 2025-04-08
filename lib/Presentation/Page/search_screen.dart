import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/Core/Rounting/App_route.dart';
import 'package:travel_app/Core/UseCase/homecontroller.dart';
import 'package:travel_app/Core/models/model.dart';
import 'package:travel_app/Presentation/Widget/judul.dart';
import 'package:travel_app/Presentation/Widget/kategori.dart';
import 'package:travel_app/Presentation/Widget/popular.dart';

class SearchScreen extends StatefulWidget {
  final int categoryID;
  final String? searchQuery;
  const SearchScreen({
    super.key,
    required this.categoryID,
    this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  Login? dataUser;
  List<Categories> category = [];
  List<DetailWisata> filtered = [];
  int selectedRating = 0;
  RangeValues selectedPriceRange = RangeValues(100, 1000000);
  List<DetailWisata> allData = [];

  void popupFiltered(List<DetailWisata> allData) {
    List<DetailWisata> temp = List.from(allData);

    // Filter rating
    if (selectedRating > 0 && selectedRating <= 5) {
      temp = temp
          .where((item) => item.ratingWisata.toInt() == selectedRating)
          .toList();
      print("Filtered by rating: $selectedRating");
    } else {
      print("No rating filter applied.");
    }

    // Filter harga
    if (selectedPriceRange.start > 100 || selectedPriceRange.end < 1000000) {
      temp = temp
          .where((item) =>
              item.hargaWisata >= selectedPriceRange.start &&
              item.hargaWisata <= selectedPriceRange.end)
          .toList();
      print(
          "Filtered by price range: ${selectedPriceRange.start} - ${selectedPriceRange.end}");
    } else {
      print("No price range filter applied.");
    }

    setState(() {
      filtered = temp;
    });

    if (filtered.isEmpty) {
      print("Hasil tidak ditemukan.");
    }
  }

  // void filteredData(
  //     {String? searchQuery, int? rating, RangeValues? priceRange}) async {
  //   final controller = Homecontroller();
  //   var rawData = await controller.getWisata();

  //   List<DetailWisata> data;
  //   if (rawData is List<Map<String, List<DetailWisata>>>) {
  //     data =
  //         rawData.expand((map) => map.values.expand((list) => list)).toList();
  //   } else if (rawData is List<DetailWisata>) {
  //     data = rawData;
  //   } else {
  //     print("Error: Unexpected data format");
  //     return;
  //   }

  //   setState(() {
  //     String query = searchQuery ?? widget.searchQuery ?? "";

  //     if (query.isNotEmpty) {
  //       filtered = data
  //           .where((item) =>
  //               item.namawisata.toLowerCase().contains(query.toLowerCase()))
  //           .toList();
  //     } else if (widget.categoryID != 0) {
  //       filtered =
  //           data.where((item) => item.idCategory == widget.categoryID).toList();
  //     } else {
  //       filtered = data;
  //     }

  //     // Filter berdasarkan rating
  //     if (selectedRating > 0 && selectedRating <= 5) {
  //       filtered = filtered
  //           .where((item) =>
  //               item.ratingWisata.toInt() == selectedRating.toDouble())
  //           .toList();
  //       print("Filtered Data:");
  //       filtered.forEach((item) => print("Item Rating: ${item.ratingWisata}"));
  //     }

  //     // Filter berdasarkan harga
  //     if (selectedPriceRange.start > 100 || selectedPriceRange.end < 1000000) {
  //       filtered = filtered
  //           .where((item) =>
  //               item.hargaWisata >= selectedPriceRange.start &&
  //               item.hargaWisata <= selectedPriceRange.end)
  //           .toList();
  //     }

  //     // Cek jika tidak ada hasil
  //     if (filtered.isEmpty) {
  //       print("Hasil tidak ditemukan.");
  //     }
  //   });
  // }

  void filteredData({String? searchQuery}) async {
    final controller = Homecontroller();
    var rawData = await controller.getWisata();

    List<DetailWisata> data;
    if (rawData is List<Map<String, List<DetailWisata>>>) {
      data =
          rawData.expand((map) => map.values.expand((list) => list)).toList();
    } else if (rawData is List<DetailWisata>) {
      data = rawData;
    } else {
      print("Error: Unexpected data format");
      return;
    }

    List<DetailWisata> temp;

    String query = searchQuery ?? widget.searchQuery ?? "";

    if (query.isNotEmpty) {
      temp = data
          .where((item) =>
              item.namawisata.toLowerCase().contains(query.toLowerCase()))
          .toList();
    } else if (widget.categoryID != 0) {
      temp =
          data.where((item) => item.idCategory == widget.categoryID).toList();
    } else {
      temp = data;
    }

    // Panggil filter nya
    popupFiltered(temp);
  }

  @override
  void initState() {
    super.initState();
    filteredData();
  }

  void showFilterSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        int tempRating = selectedRating;
        RangeValues tempPriceRange = selectedPriceRange;

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Range Price"),
                  RangeSlider(
                    values: tempPriceRange,
                    min: 100,
                    max: 1000000,
                    divisions: 50,
                    labels: RangeLabels(
                      tempPriceRange.start.toStringAsFixed(0),
                      tempPriceRange.end.toStringAsFixed(0),
                    ),
                    onChanged: (values) {
                      setModalState(() => tempPriceRange = values);
                    },
                  ),
                  SizedBox(height: 16),
                  Text("Star Review"),
                  Row(
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          Icons.star,
                          color:
                              index < tempRating ? Colors.amber : Colors.grey,
                        ),
                        onPressed: () {
                          setModalState(() => tempRating = index + 1);
                        },
                      );
                    }),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            selectedRating = 0;
                            selectedPriceRange = RangeValues(100, 1000000);
                            filteredData(); // Reset filter
                          });
                          Navigator.pop(context);
                        },
                        child: Text("Clear All"),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final controller = Homecontroller();
                          var rawData = await controller.getWisata();

                          List<DetailWisata> data;
                          if (rawData
                              is List<Map<String, List<DetailWisata>>>) {
                            data = rawData
                                .expand(
                                    (map) => map.values.expand((list) => list))
                                .toList();
                          } else if (rawData is List<DetailWisata>) {
                            data = rawData;
                          } else {
                            print("Error: Unexpected data format");
                            return;
                          }

                          setState(() {
                            selectedRating = tempRating;
                            selectedPriceRange = tempPriceRange;
                          });

                          popupFiltered(data);
                          Navigator.pop(context);
                        },
                        child: Text("Apply"),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var tinggi = MediaQuery.of(context).size.height;
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.goNamed(Routes.home);
            },
          ),
          title: Text('Search'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.filter_list_alt),
              onPressed: () {
                showFilterSheet();
              },
            ),
          ],
        ),
        body: Container(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //start search
                  Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search destination",
                          suffixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          hintStyle: GoogleFonts.poppins(fontSize: 20)),
                      onChanged: (value) => filteredData(searchQuery: value),
                    ),
                  ),
                  Judul("data dari ctegory yg di pilih ", "", tinggi),
                  Container(
                      margin: EdgeInsets.only(bottom: tinggi * 0.03),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(spacing: 20, children: [
                          Category("Beach", "assets/img/beach.png", lebar),
                          Category(
                              "Mountain", "assets/img/mountains.png", lebar),
                          Category("Religion", "assets/img/mosque.png", lebar),
                        ]),
                      )),
                  Container(
                    margin: EdgeInsets.only(bottom: tinggi * 0.03),
                    child: filtered.isEmpty
                        ? Center(
                            child: Text(
                              "Data not found",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : Wrap(
                            runSpacing: 30,
                            children: List.generate(
                              filtered.length,
                              (index) => Popular(
                                  filtered[index].gambarwisata,
                                  filtered[index].namawisata,
                                  filtered[index].hargaWisata.toString(),
                                  filtered[index].ratingWisata,
                                  filtered[index].deskripsi,
                                  lebar,
                                  tinggi),
                            )),
                  )

//end popular
                ]))));
  }
}

class FilterOptions extends StatefulWidget {
  @override
  _FilterOptionsState createState() => _FilterOptionsState();
}

class _FilterOptionsState extends State<FilterOptions> {
  RangeValues _currentRangeValues = RangeValues(1000, 5000);
  bool _includeFlight = false;
  bool _includeHotel = false;
  bool _includeTransportation = false;
  bool _includeEat = false;
  int _selectedStar = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      padding: EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Filter Options',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Price Range'),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 5000000,
              divisions: 100,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Star Review'),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _selectedStar ? Icons.star : Icons.star_border,
                  ),
                  onPressed: () {
                    setState(() {
                      _selectedStar = index + 1;
                    });
                  },
                );
              }),
            ),
            SizedBox(height: 20),
            Text('Include'),
            CheckboxListTile(
              title: Text('Flight'),
              value: _includeFlight,
              onChanged: (value) {
                setState(() {
                  _includeFlight = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Hotel'),
              value: _includeHotel,
              onChanged: (value) {
                setState(() {
                  _includeHotel = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Transportation'),
              value: _includeTransportation,
              onChanged: (value) {
                setState(() {
                  _includeTransportation = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Eat'),
              value: _includeEat,
              onChanged: (value) {
                setState(() {
                  _includeEat = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: ElevatedButton(
                    onPressed: () {
                      // Clear all filters
                      setState(() {
                        _currentRangeValues = RangeValues(1000, 5000);
                        _includeFlight = false;
                        _includeHotel = false;
                        _includeTransportation = false;
                        _includeEat = false;
                        _selectedStar = 0;
                      });
                    },
                    child: Text('Clear All'),
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.grey),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.17,
                  child: ElevatedButton(
                    onPressed: () {
                      // Apply filters
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
