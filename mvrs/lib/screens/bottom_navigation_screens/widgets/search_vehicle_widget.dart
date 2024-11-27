import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvrs/screens/discover_search_result_screen.dart';

class SearchVehicleWidget extends StatefulWidget {
  const SearchVehicleWidget({super.key});

  @override
  State<SearchVehicleWidget> createState() => _SearchCardWidgetState();
}

class _SearchCardWidgetState extends State<SearchVehicleWidget> {
  final TextEditingController _tripStartDateTimeController =
      TextEditingController();
  final TextEditingController _tripEndDateTimeController =
      TextEditingController();
  final List<String> _optionCitys = [
    'Ahmedabad',
    'Gandhinagar',
    'Vadodara',
    'Surat',
    'Rajkot',
    'Dhrol',
    'Jamnagar',
    'Amreli',
    'Anand',
    'Junagadh',
    'Patan',
    'Morbi',
    'Navsari',
    'Bharuch',
    'Valsad',
    'Dhule',
    'Bhavnagar',
    'Nadiad',
    'Porbandar',
    'Vapi',
    'Kutch',
    'Bhuj',
    'Surendranagar'
  ];
  final List<String> _vehicleTypes = ["Motorcycles", "Cars", "Buses", "Trucks"];
  // ignore: unused_field
  String _selectedCity = "";
  DateTime _tripStart = DateTime.now();
  DateTime _tripEnd = DateTime.now().add(Duration(hours: 1));
  final DateFormat _dateFormat = DateFormat('MMM d, h:m a');
  int _selectedIndex = 1; // Index of the selected button

  @override
  void initState() {
    super.initState();
    _tripStartDateTimeController.text = _dateFormat.format(_tripStart);
    _tripEndDateTimeController.text = _dateFormat.format(_tripEnd);
  }

  Future<void> _pickDateTime(TextEditingController controller,
      DateTime initialDateTime, Function(DateTime) onDateTimeSelected) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime(initialDateTime.year + 1),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDateTime),
      );

      if (pickedTime != null) {
        final DateTime combinedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );

        setState(() {
          onDateTimeSelected(combinedDateTime);
          controller.text = _dateFormat.format(combinedDateTime);
        });
      }
    }
  }

  Widget _buildToggleButton(
      IconData icon, String title, String subtitle, String tooltip, int index) {
    bool isSelected = _selectedIndex == index;
    return Tooltip(
      message: tooltip,
      child: Padding(
        padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 6.7,
          right: 6.7,
        ), // Minimal horizontal padding
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: 30,
              color: isSelected ? Colors.white : Colors.green,
            ),
            SizedBox(height: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title\n',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: subtitle,
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Search for vehicles...",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Autocomplete<String>(
                      optionsBuilder: (TextEditingValue textEditingValue) {
                        // Filter the options based on the current text input
                        if (textEditingValue.text.isEmpty) {
                          return const Iterable<String>.empty();
                        }
                        return _optionCitys.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      },
                      onSelected: (String selection) {
                        // Handle the selected option
                        setState(() {
                          _selectedCity = selection;
                        });
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text('City changed to $selection.'),
                        //     duration: Duration(seconds: 10),
                        //     action: SnackBarAction(
                        //       label: 'OK',
                        //       textColor: Colors.black,
                        //       backgroundColor: Colors.white,
                        //       onPressed: () {
                        //         // Some code to clode the snackbar.
                        //         ScaffoldMessenger.of(context)
                        //             .hideCurrentSnackBar();
                        //       },
                        //     ),
                        //   ),
                        // );
                      },
                      fieldViewBuilder: (context, citySearchController,
                          focusNode, onEditingComplete) {
                        return TextFormField(
                          controller: citySearchController,
                          focusNode: focusNode,
                          onEditingComplete: onEditingComplete,
                          decoration: InputDecoration(
                            labelText: 'Search City',
                            hintText: 'Start typing to search cities...',
                            labelStyle: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[800]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.purple),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            prefixIcon: Icon(Icons.location_city_rounded,
                                color: Colors.purple),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    Flex(
                      direction: Axis.horizontal,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _tripStartDateTimeController,
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Trip Starts',
                              labelStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[800]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.green,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.green,
                                onPressed: () => _pickDateTime(
                                  _tripStartDateTimeController,
                                  _tripStart,
                                  (dateTime) => _tripStart = dateTime,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextFormField(
                            controller: _tripEndDateTimeController,
                            readOnly: true,
                            style: TextStyle(
                              fontSize: 14,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Trip Ends',
                              labelStyle: TextStyle(
                                color: Colors.grey[700],
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey[800]!),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.purple),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              prefixIcon: Icon(
                                Icons.calendar_month,
                                color: Colors.green,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.green,
                                onPressed: () => _pickDateTime(
                                  _tripEndDateTimeController,
                                  _tripEnd,
                                  (dateTime) => _tripEnd = dateTime,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: double
                          .infinity, // Ensure the Container takes full width
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ToggleButtons(
                              isSelected: List.generate(
                                  4, (index) => index == _selectedIndex),
                              onPressed: (int index) {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              children: <Widget>[
                                _buildToggleButton(
                                  Icons.motorcycle,
                                  'Motorcycles',
                                  '[Bikes, Scooters..]',
                                  "Includes all types of two wheeler like. Bikes, Scooters, etc.",
                                  0,
                                ),
                                _buildToggleButton(
                                  Icons.directions_car,
                                  'Cars',
                                  '[Sedans, SUVs..]',
                                  "Includes all types of four wheeler like. Sedans, SUVs, Hatchbacks, Coupe, etc.",
                                  1,
                                ),
                                _buildToggleButton(
                                  Icons.directions_bus,
                                  'Buses',
                                  '[Transport, School..]',
                                  "Includes all types of buses like. School Vans, AC Bus, Non-AC Bus, Sleeper Bus, etc.",
                                  2,
                                ),
                                _buildToggleButton(
                                  Icons.local_shipping,
                                  'Trucks & Vans',
                                  '[Pickup, Delivery..]',
                                  "Includes all heavy vehicles like. Parcel Pickup Vans, Delivery Trucks, Heavy-Duty Trucks, Tankers, etc.",
                                  3,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.black,
                              selectedColor: Colors.white,
                              fillColor: Colors.green,
                              borderWidth: 2,
                              selectedBorderColor:
                                  Colors.green, // Adjust the height
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_selectedCity != "") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DiscoverSearchResultScreen(
                                    searchCity: _selectedCity,
                                    journeyStartDate: _tripStart,
                                    journeyEndDate: _tripEnd,
                                    vehicleType: _vehicleTypes[_selectedIndex],
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            shadowColor: Colors.green,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            textStyle: TextStyle(fontSize: 18),
                          ),
                          child: Text('Discover'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
