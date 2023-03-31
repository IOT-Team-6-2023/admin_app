import 'package:admin_app/get_it_init.dart';
import 'package:admin_app/ui/candidates_view_page.dart';
import 'package:admin_app/ui/tally_view_page.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

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
                title: 'Files',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.file_copy_rounded),
                trailing: Container(
                    decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 3),
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 11, color: Colors.grey[800]),
                      ),
                    )),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Download',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.download),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Settings',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.settings),
              ),
              // SideMenuItem(
              //   priority: 5,
              //   onTap:(page){
              //     sideMenu.changePage(5);
              //   },
              //   icon: const Icon(Icons.image_rounded),
              // ),
              // SideMenuItem(
              //   priority: 6,
              //   title: 'Only Title',
              //   onTap:(page){
              //     sideMenu.changePage(6);
              //   },
              // ),
              const SideMenuItem(
                priority: 7,
                title: 'Exit',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                TallyViewPage(),
                CandidatesViewPage(),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Files',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Download',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Title',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text(
                      'Only Icon',
                      style: TextStyle(fontSize: 35),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
