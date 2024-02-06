import 'package:bynry_assignment/Wigets/options_tile.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
enum timeFrame {
  month,
  week,
  day,
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() {
    return _Dashboard();
  }
}

class _Dashboard extends State<Dashboard> {
  timeFrame _selectedTimeFrame = timeFrame.month;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Quick Actions',
                    style: TextStyle(
                      color: Color.fromARGB(255, 114, 23, 189),
                      fontSize: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    OptionsTile(
                      imageAddress: 'assets/images/bill.png',
                      label: 'Bills',
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                    ),
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/disconnect.png',
                      label: 'Disconnect',
                    ),
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/disconnect.png',
                      label: 'Transfer',
                    ),
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/services.png',
                      label: 'Services',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/compain.png',
                      label: 'Complain..',
                    ),
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/update.png',
                      label: 'Update ..',
                    ),
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/update.png',
                      label: 'Connecti..',
                    ),
                    OptionsTile(
                      onTap: (label) {
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(label)));
                      },
                      imageAddress: 'assets/images/update.png',
                      label: 'Outage',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 10,
            child: Container(
              color: Colors.grey,
            ),
          ),
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gas |   ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Text(
                      "SA1234567",
                      style: TextStyle(
                          color: Color.fromARGB(255, 114, 23, 189),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color.fromARGB(255, 220, 220, 223)),
                            color: const Color.fromARGB(255, 242, 242, 245),
                            borderRadius: BorderRadius.circular(24)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              borderRadius: BorderRadius.circular(12),
                              items: timeFrame.values
                                  .map(
                                    (timeFrame) => DropdownMenuItem(
                                      value: timeFrame,
                                      child: Text(
                                          "Last ${timeFrame.name.toUpperCase()}"),
                                    ),
                                  )
                                  .toList(),
                              value: _selectedTimeFrame,
                              onChanged: (value) {
                                if (value == null) {
                                  return;
                                }
                                setState(() {
                                  _selectedTimeFrame = value;
                                });
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: ClipRect(
                            child: Align(
                              alignment: Alignment.centerRight,
                              widthFactor: 0.6,
                              child: Icon(
                                Icons.trip_origin_rounded,
                                size: 60,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Bills',
                                style: TextStyle(fontSize: 18),
                              ),
                              Text(
                                '20 Jan 2020',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 186, 186, 187),
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Text(
                          "43\$",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
