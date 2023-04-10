import 'package:admin_app/data/add_new_candidate.dart';
import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/ui/add_candidate_page.dart';
import 'package:admin_app/ui/candidates_view_page.dart';
import 'package:admin_app/ui/constituency_view_page.dart';
import 'package:admin_app/ui/party_view_page.dart';
import 'package:admin_app/ui/tally_view_page.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

import 'ui/add_party_page.dart';

void main() {
  setup();
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController page = PageController();

  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    super.initState();
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
  }

  void changePageToTallyPage() {
    sideMenu.changePage(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Application')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
              // showTooltip: false,
              displayMode: SideMenuDisplayMode.auto,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              selectedIconColor: Colors.white,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(10)),
              // ),
              // backgroundColor: Colors.blueGrey[700]
            ),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'mohada',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Tally',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.list),
                tooltipContent: "This is a tooltip for Tally list",
              ),
              SideMenuItem(
                priority: 1,
                title: 'Candidates',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.person),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Parties',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.group),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Constituencies',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.location_on),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Add Party',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.star),
              ),
              SideMenuItem(
                priority: 5,
                title: 'Add Candidate',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.person_add),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                const TallyViewPage(),
                const CandidatesViewPage(),
                const PartiesViewPage(),
                const ConstituenciesViewPage(),
                AddPartyPage(changePageToTallyPage: changePageToTallyPage),
                const AddCandidatePage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
