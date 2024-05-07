import 'package:ca_junction/components/admin/admin_profile.dart';
import 'package:ca_junction/components/admin/dashboard.dart';
import 'package:ca_junction/components/admin/more.dart';
import 'package:ca_junction/components/admin/services_list.dart';
import 'package:ca_junction/components/admin/support.dart';
import 'package:ca_junction/theme/daytheme.dart';
import 'package:ca_junction/theme/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GstUpdatesScreen extends StatefulWidget {
  static const String id = 'gst_updates';

  const GstUpdatesScreen({Key? key}) : super(key: key);

  @override
  GstUpdatesScreenState createState() => GstUpdatesScreenState();
}

class GstUpdatesScreenState extends State<GstUpdatesScreen> {
  int _selectedIndex = 0;

  final List<BottomNavigationBarItem> _bottomNavBarItems = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.headset_mic_outlined),
      label: 'Support',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outlined),
      label: 'Profile',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.dashboard_rounded),
      label: 'More',
    ),
  ];

  // Define a list of pages corresponding to each bottom navigation bar item
  final List<Widget> _pages = [
    // Define your home page widget here
    DashboardScreen(),
    AdminSupportScreen(),
    AdminProfileScreen(),
    AdminMoreScreen(),
  ];

  String selectedService = 'All';
  List<String> clients = [
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
  ];
  void handleServiceSelection(String service) {
    setState(() {
      selectedService = service;
      print("Selected Service is: ${service}");
      // Perform filtering logic here based on the selected service
      // For example, update the list of clients
    });
  }

  List<String> filteredClients = [];

  @override
  void initState() {
    super.initState();
    filteredClients.addAll(clients);
  }

  void filterClients(String query) {
    filteredClients.clear();
    if (query.isEmpty) {
      filteredClients.addAll(clients);
    } else {
      for (var client in clients) {
        if (client.toLowerCase().contains(query.toLowerCase())) {
          filteredClients.add(client);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Updates',
            style: TextStyle(color: themeprovider.getPrimaryColor)),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: themeprovider.getPurpleTextColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          ServiceList(
            selectedService: selectedService,
            onServiceSelected: handleServiceSelection,
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjust the vertical padding as needed
          //   child: TextField(
          //     decoration: InputDecoration(
          //       helperStyle: const TextStyle(color: Colors.red),
          //       hintText: 'Search Clients',
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(6.0),
          //         borderSide: BorderSide(
          //           color: Colors.grey[100]!,
          //         ),
          //       ),
          //       suffixIcon: const Icon(Icons.search),
          //     ),
          //     onChanged: (value) {
          //       filterClients(value);
          //       // Perform filtering logic here
          //     },
          //   ),
          // ),
          const SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredClients.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 0.3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(
                      filteredClients[index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    subtitle: const Text(
                      '13 Oct 2021',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    // trailing: const Icon(
                    //   Icons.keyboard_arrow_down,
                    //   color: Colors.grey,
                    // ),
                    onTap: () {
                      // Handle client item tap
                      // print("Selected client: ${filteredClients[index]}");
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => AdminProfileScreen()),
                      // );
                      setState(() {
                        _showBottomSheet(context, clients[index]);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          // Bottom navigation bar
          BottomNavigationBar(
            items: _bottomNavBarItems,
            currentIndex: _selectedIndex,
            showUnselectedLabels: true,
            selectedItemColor:
                AppColors.primaryColor, // Change the color to your preference
            unselectedItemColor: Colors.grey, // Set the unselected item color
            onTap: _onNavBarItemTapped,
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, clients) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
        // return Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   mainAxisSize: MainAxisSize.min,
          // children: <Widget>[
          //   ListTile(
          //     title: const Text(
          //       'Move to Dropbox',
          //       textAlign: TextAlign.center,
          //     ),
          //     onTap: () {
          //       // Handle edit action
          //       Navigator.pop(context);
          //     },
          //   ),
          // ],
        // );

        child: Container(
          color: Color(0xff757575),
          child: Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    title: const Text(
                      'Move to Dropbox',
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      // Handle edit action
                      Navigator.pop(context);
                    },
                  ),
                ],
              )),
        ),
      )
    );
  }

  // Method to handle bottom navigation bar item taps
  void _onNavBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
