import 'package:flutter/material.dart';
import 'package:swiftcart_admin/screens/home/widgets/admin_drawer.dart';
import 'package:swiftcart_admin/screens/home/widgets/dashborad_cards.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = width > 900;
    final bool isTablet = width > 600;

    int gridCount = 2;

    if (isDesktop) {
      gridCount = 4;
    } else if (isTablet) {
      gridCount = 3;
    }

    return Scaffold(
      backgroundColor: Color(0xfff5f7fb),

      /// Drawer
      drawer: isDesktop ? null : AdminDrawer(),

      body: Row(
        children: [
          /// Desktop Sidebar
          if (isDesktop) SizedBox(width: 260, child: AdminDrawer()),

          /// Main Content
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      /// Top Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (!isDesktop)
                            Builder(
                              builder: (context) => IconButton(
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                icon: Icon(Icons.menu),
                              ),
                            ),

                          Expanded(
                            child: Text(
                              "Admin Dashboard",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Icon(Icons.notifications_none),
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      /// Statistics Cards
                      GridView.count(
                        crossAxisCount: gridCount,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: 1.4,
                        children: [
                          DashboardCard(
                            title: "Users",
                            value: "1,240",
                            icon: Icons.people,
                            color: Colors.blue,
                          ),
                          DashboardCard(
                            title: "Products",
                            value: "340",
                            icon: Icons.shopping_bag,
                            color: Colors.orange,
                          ),
                          DashboardCard(
                            title: "Orders",
                            value: "890",
                            icon: Icons.shopping_cart,
                            color: Colors.green,
                          ),
                          DashboardCard(
                            title: "Revenue",
                            value: "\$12K",
                            icon: Icons.attach_money,
                            color: Colors.purple,
                          ),
                        ],
                      ),

                      SizedBox(height: 30),

                      /// Sales Analytics
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sales Analytics",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 30),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: List.generate(7, (index) {
                                final heights = [
                                  80.0,
                                  120.0,
                                  90.0,
                                  150.0,
                                  110.0,
                                  170.0,
                                  140.0,
                                ];

                                return Column(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: heights[index],
                                      decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      [
                                        "Mon",
                                        "Tue",
                                        "Wed",
                                        "Thu",
                                        "Fri",
                                        "Sat",
                                        "Sun",
                                      ][index],
                                    ),
                                  ],
                                );
                              }),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 30),

                      /// Recent Orders
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Orders",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 20),

                            ListView.builder(
                              itemCount: 5,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: CircleAvatar(
                                    backgroundColor: Colors.indigo.shade100,
                                    child: Icon(
                                      Icons.shopping_bag,
                                      color: Colors.indigo,
                                    ),
                                  ),
                                  title: Text(
                                    "Order #00$index",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text("2 Products"),
                                  trailing: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green.shade100,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Text(
                                      "Completed",
                                      style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
