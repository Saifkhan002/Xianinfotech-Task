import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'add_item.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  bool isCreditSelected = true;
  bool isReceived = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Sale',
            style: TextStyle(color: Colors.black, fontSize: 20)),
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        actions: [
          _buildPaymentTypeToggle(),
          const SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInvoiceAndDateFields(),
            const SizedBox(height: 16),
            _buildFirmNameField(),
            const SizedBox(height: 16),
            _CustomTextField(),
            const SizedBox(height: 16),
            _BilledItems(),
            const SizedBox(height: 16),
            _buildAddItemsButton(),
            const SizedBox(height: 16),
            _TotalAmount(),
            const SizedBox(height: 16),
            _buildTransportationDetails()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
              color: const Color(0xFFFFF0F0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Your current plan may not support some features.',
                      style: TextStyle(color: Colors.red[300], fontSize: 11),
                    ),
                  ),
                  Icon(Icons.chevron_right, size: 16, color: Colors.red[300]),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text('Save & New',
                        style: TextStyle(color: Colors.blue)),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 3,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: const Icon(Icons.more_vert, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentTypeToggle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 100,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCreditSelected = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isCreditSelected ? Colors.green : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Credit',
                        style: TextStyle(
                          color: isCreditSelected
                              ? Colors.white
                              : Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isCreditSelected = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          !isCreditSelected ? Colors.green : Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Center(
                      child: Text(
                        'Cash',
                        style: TextStyle(
                          color: !isCreditSelected
                              ? Colors.white
                              : Colors.grey[600],
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceAndDateFields() {
    return Row(
      children: [
        Expanded(
          child: _buildDropdownField('Invoice No.', '23-24-01  16'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildDropdownField('Date', '17/09/2024'),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                  style: const TextStyle(fontSize: 16, color: Colors.black87)),
              const Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFirmNameField() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Firm Name:',
            style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        const SizedBox(height: 4),
        Container(
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('xianinfotech LLP',
                  style: TextStyle(fontSize: 16, color: Colors.black87)),
              SizedBox(width: 6),
              Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _CustomTextField() {
    return const Column(
      children: [
        SizedBox(
          height: 55,
          child: TextField(
            decoration: InputDecoration(
              hintText: ('Customer'),
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 55,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Billing Name(Optional)',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 12),
        SizedBox(
          height: 55,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Phone Number',
              hintStyle: TextStyle(color: Colors.grey),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _BilledItems() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.arrow_drop_down_circle_outlined,
                color: Colors.white,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Billed Items",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),

        // Item Information
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Text(
                        "#1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      ".in domain renewal fee",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Text(
                      "690",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Item Subtotal",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "1 x 690 = 690",
                      style: TextStyle(),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Discount (%): 0",
                        style: TextStyle(color: Colors.amber[800])),
                    Text("0", style: TextStyle(color: Colors.amber[800])),
                  ],
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 4),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tax: 0%", style: TextStyle(color: Colors.grey)),
                    Text("0", style: TextStyle(color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),

        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Disc: 0.0", style: TextStyle(color: Colors.black54)),
            Text("Total Tax Amt: 0.0", style: TextStyle(color: Colors.black54)),
          ],
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Qty: 1.0", style: TextStyle(color: Colors.black54)),
            Text("Subtotal: 690.0", style: TextStyle(color: Colors.black54)),
          ],
        ),
      ],
    );
  }

  Widget _buildAddItemsButton() {
    return OutlinedButton.icon(
      icon: const Icon(Icons.add, color: Colors.blue),
      label: const Text('Add Items (Optional)',
          style: TextStyle(color: Colors.blue)),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddItemToSaleScreen(),
            ));
      },
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey[300]!),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }

  Widget _TotalAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Charges",
          style: TextStyle(
              fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
        ),
        const Divider(),

        // Shipping Row
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Text(
                  "Shipping",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const SizedBox(width: 8),
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8)),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 220,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8)),
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              height: 40,
              width: 130,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),

        // Total Amount Section
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey),
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Amount",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "690.00",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  Checkbox(
                      activeColor: Colors.blue,
                      value: isReceived,
                      onChanged: (value) {
                        setState(() {
                          isReceived = value!;
                        });
                      }),
                  const Text("Received"),
                  const Spacer(),
                  isReceived
                      ? const Text(
                          "690.00",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Text(
                          "............",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Balance Due",
                    style: TextStyle(color: Colors.green, fontSize: 16),
                  ),
                  SizedBox(width: 16),
                  Text(
                    "0.00",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        // Payment Type Section
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Payment Type",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Row(
              children: [
                Icon(Icons.money, color: Colors.green),
                SizedBox(width: 4),
                Text(
                  "Cash",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Add Payment Type Link
        const Text(
          "+ Add Payment Type",
          style: TextStyle(color: Colors.blue, fontSize: 16),
        ),
        const SizedBox(height: 8),
        const Divider(),
        const SizedBox(height: 8),
        // State of Supply Dropdown
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "State of Supply",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Row(
              children: [
                Text(
                  "Select State",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Divider(),
      ],
    );
  }

  Widget _buildTransportationDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Transportation Details',
              style: TextStyle(color: Colors.blue, fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 65,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[800]!),
              ),
              child: const Icon(
                Icons.image,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Add Document',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Internet is required to upload',
          style: TextStyle(color: Colors.grey, fontSize: 11),
        ),
      ],
    );
  }

  Widget _buildPlanWarning() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 16),
      color: const Color(0xFFFFF0F0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Your current plan may not support some features.',
              style: TextStyle(color: Colors.red[300], fontSize: 11),
            ),
          ),
          Icon(Icons.chevron_right, size: 16, color: Colors.red[300]),
        ],
      ),
    );
  }

  Widget _buildSaveButtons() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child:
                const Text('Save & New', style: TextStyle(color: Colors.blue)),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 3,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey[400]!),
          ),
          child: const Icon(Icons.more_vert, color: Colors.grey),
        ),
      ],
    );
  }
}
