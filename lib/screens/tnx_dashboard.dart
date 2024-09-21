import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xaininfotect_task/providers/settings_provider.dart';
import 'package:xaininfotect_task/widgets/loading_widget.dart';

import 'sales.dart';

class TnxDashboard extends StatefulWidget {
  const TnxDashboard({super.key});

  @override
  State<TnxDashboard> createState() => _TnxDashboardState();
}

class _TnxDashboardState extends State<TnxDashboard> {
  bool _isLoading = true;
  // initialize settings from firebase
  init() async {
    final settingsProvider = context.read<SettingsProvider>();
    await settingsProvider.fetchSettings();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading
        ? Scaffold(
            backgroundColor: const Color(0xFFE5F2FF),
            appBar: AppBar(
              title: const Text('Xianinfotech LLP',
                  style: TextStyle(color: Colors.black)),
              leading: const Icon(Icons.home_work_outlined, color: Colors.blue),
              actions: const [
                Icon(Icons.notifications_none_rounded, color: Colors.black),
                SizedBox(width: 8),
                Icon(Icons.settings, color: Colors.green),
                SizedBox(width: 10),
              ],
              elevation: 0,
            ),
            body: Column(
              children: [
                _buildTabs(),
                _buildQuickLinks(),
                _buildSearchBar(),
                _buildTransactionList(),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SaleScreen()));
              },
              label: const Text(
                'Add New Sale',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              icon:
                  const Icon(Icons.currency_rupee_rounded, color: Colors.white),
              backgroundColor: Colors.red,
              shape: const StadiumBorder(),
            ),
            bottomNavigationBar: _buildBottomNavBar(),
          )
        : const LoadingWidget();
  }

  Widget _buildTabs() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.red.shade600, width: 2),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Transaction Details',
                  style: TextStyle(color: Colors.red.shade600, fontSize: 15),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(color: Colors.grey, width: 2),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Party Details',
                  style: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLinks() {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Quick Links',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildQuickLinkItem(Icons.add, 'Add Txn', Colors.red[400]!),
                _buildQuickLinkItem(
                    Icons.description, 'Sale Report', Colors.blue[300]!),
                _buildQuickLinkItem(
                    Icons.settings, 'Txn Settings', Colors.blue[300]!),
                _buildQuickLinkItem(
                    Icons.chevron_right, 'Show All', Colors.blue[300]!),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickLinkItem(IconData icon, String label, Color color) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(fontSize: 12, color: Colors.black87)),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: SizedBox(
        height: 55,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for a transaction',
            suffixIcon: const Icon(Icons.filter_list),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionList() {
    return Expanded(
      child: ListView(
        children: [
          _buildTransactionItem('blue sky tech legal solutions', '24,000.00',
              '#23-24-0115\n07 Sep, 24'),
          _buildTransactionItem(
              'Mca Saleel', '36,700.00', '#23-24-0114\n28 Aug, 24'),
          _buildTransactionItem(
              'gulf corp logi', '0.00', '#23-24-0113\n14 Aug, 24'),
        ],
      ),
    );
  }

  Widget _buildTransactionItem(String title, String amount, String details) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  details,
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'SALE',
                style: TextStyle(
                    color: Colors.green[700],
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12)),
                    Text(amount,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Balance',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 12)),
                    Text(amount,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.print, color: Colors.grey[400]),
                    const SizedBox(width: 12),
                    Transform(
                      alignment: Alignment.center,
                      transform:
                          Matrix4.rotationY(3.1416), // 180 degrees in radians
                      child: Icon(Icons.reply_rounded, color: Colors.grey[400]),
                    ),
                    const SizedBox(width: 12),
                    Icon(Icons.more_vert, color: Colors.grey[400]),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_work_outlined),
          label: 'HOME',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined), label: 'DASHBOARD'),
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined), label: 'ITEMS'),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'MENU'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              color: Colors.amber,
            ),
            label: 'GET PREMIUM'),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black54,
      showUnselectedLabels: true,
      selectedFontSize: 10,
      unselectedFontSize: 10,
    );
  }
}
