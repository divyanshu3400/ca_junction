import 'package:ca_junction/core/constant/text_style.dart';
import 'package:ca_junction/core/network_connectivity_check/network_connectivity_provider.dart';
import 'package:ca_junction/core/router/routers.dart';
import 'package:ca_junction/utility/api_request.dart';
import 'package:ca_junction/utility/constants.dart';
import 'package:ca_junction/utility/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import '../../../../../../theme/daytheme.dart';

part '../widgets/product_details_seller_info_section.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});


  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final bool hasNotification = true;

  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(connectivityStatusProviders.notifier).checkStatus();
    });
    fetchUserDashboardData(SharedPref.getInt(userId));
  }

  @override
  void dispose() {
    super.dispose();
    ref.read(connectivityStatusProviders.notifier).dispose();
  }

  Future<dynamic> fetchUserDashboardData(int? userId) async {
    var storedData = await getStoredData(userDashboardStats);
    if (storedData == null) {
      bool isFetching = await fetchUserDashboardStats(userId);
      if (isFetching) {
        storedData = await getStoredData(userDashboardStats);
      }
    }
    if (storedData != null) {
      return storedData;
    } else {
      return null;
    }
  }

  Future<dynamic> getStoredData(String key) async {
    var box = await Hive.openBox<Map>(userBox); // Open the box
    return box.get(key);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_img.png', // Path to your background image
            fit: BoxFit.cover,
          ),
        ),
        // Content
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background_img.png', // Path to your background image
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: FutureBuilder(
                future: fetchUserDashboardData(SharedPref.getInt(userId)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data found.'));
                  } else {
                    dynamic userLocalDashboardStats = snapshot.data;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 16, right: 16),
                          child: Row(
                            children: <Widget>[
                              const CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Text(
                                    "Welcome Back",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${userLocalDashboardStats['data']['first_name'] ?? ''} ${userLocalDashboardStats['data']['last_name'] ?? ""}',
                                    style: const TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  Text(
                                    '#${userLocalDashboardStats['data']['username'].toString().toUpperCase()}',
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.refresh_sharp,
                                    color: Colors.white),
                                onPressed: () {
                                  fetchUserDashboardData(
                                      SharedPref.getInt(userId));
                                  // SharedPref.removeAll();
                                  // context.goNamed('/${Routers.signIn}');
                                  // Refresh action
                                },
                              ),
                              IconButton(
                                icon: hasNotification
                                    ? Image.asset(
                                        'assets/images/notification.png')
                                    : const Icon(Icons.notifications,
                                        color: Colors.white),
                                onPressed: () {
                                  // Notification action
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          elevation: 1,
                          margin: const EdgeInsets.all(26),
                          color: AppColors.cardColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 16, 20, 4),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        userLocalDashboardStats['data']['role']
                                                .toString()
                                                .toUpperCase(),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      Text(
                                        '#${userLocalDashboardStats['data']['username'].toString().toUpperCase()}',
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  )),
                              GridView.count(
                                crossAxisCount: 3,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  _buildGridItem(
                                      "assets/images/people.png", 'My Clients',
                                      () {
                                    context.push('/${Routers.myClients}');
                                  }),
                                  _buildGridItem("assets/images/req.png",
                                      'Pending Requests', () {
                                    context.push('/${Routers.myClients}');
                                  }),
                                  _buildGridItem("assets/images/payment.png",
                                      'Add Payments', () {}),
                                  _buildGridItem("assets/images/mytask.png",
                                      'My Tasks', () {}),
                                  _buildGridItem("assets/images/task.png",
                                      'Task For Client', () {}),
                                  _buildGridItem("assets/images/graph.png",
                                      'Reports', () {}),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 120,
                                      height: 70,
                                      margin: const EdgeInsets.only(right: 8),
                                      // Add margin for spacing
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: AppColors.iconBackgroundColor,
                                        // Light gray color
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "New Updates",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 120,
                                      height: 70,
                                      margin: const EdgeInsets.only(left: 8),
                                      // Add margin for spacing
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: AppColors.iconBackgroundColor,
                                        // Light gray color
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Dropbox",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: 120,
                                      height: 70,
                                      margin: const EdgeInsets.only(right: 8),
                                      // Add margin for spacing
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: AppColors.iconBackgroundColor,
                                        // Light gray color
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Legal Services",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 120,
                                      height: 70,
                                      margin: const EdgeInsets.only(left: 8),
                                      // Add margin for spacing
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: AppColors.iconBackgroundColor,
                                        // Light gray color
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "User Management",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: AppColors.primaryColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    );
                  }
                }),
          ),
        )
      ],
    );
  }

  Widget _buildGridItem(String imgPath, String label, VoidCallback onTap) {
    return Material(
      type: MaterialType.transparency,
      // Add this line to enable the ripple effect
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 64, // Adjust the width and height to fit your icon
              height: 64,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.iconBackgroundColor,
                // Light gray color
              ),
              child: Center(
                child: Image.asset(
                  imgPath,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontSize: 14, color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
