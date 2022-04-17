// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/screens/select_contact.dart';
import 'package:whatsapp_clone/screens/select_contact_calls_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

///////////////////////////////
//////////////////////////////
///
///
class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 10,
          title: Text(
            "WhatsApp UI",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          backgroundColor: Colors.teal[600],
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
          bottom: TabBar(
            controller: _tabcontroller,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(
                  Icons.photo_camera_rounded,
                ),
              ),
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              ),
              Tab(
                text: "CALLS",
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabcontroller,
          children: [
            camerapge(context),
            chatspage(context),
            statuspage(context, _tabcontroller),
            callspage(context),
          ],
        ),
      ),
    );
  }

//*********************
//*CAMERA PAGE COMPONENTS
//*********************
  camerapge(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Container(
                    width: double.infinity,
                    height: 100,
                    color: Colors.teal,
                    child: Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  titlePadding: EdgeInsets.zero,
                  content: Text(
                    "To Capture photos and videos, allow WhatsApp access to your camera.",
                    style: TextStyle(fontSize: 15),
                  ),
                  contentPadding: EdgeInsets.only(left: 10, right: 5, top: 20),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _tabcontroller
                            .animateTo((_tabcontroller.index + 1) % 2);
                      },
                      child: Text(
                        "NOT NOW ",
                        style: TextStyle(
                            color: Colors.teal[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "CONTINUE",
                        style: TextStyle(
                            color: Colors.teal[600],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: Text(
              "Open Camera",
              style: TextStyle(fontSize: 20, color: Colors.teal[600]),
            ),
          ),
        ),
      ),
    );
  }

//*********************
//*CHAT PAGE COMPONENTS
//*********************
  chatspage(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectContact(),
            ),
          );
        },
        backgroundColor: Colors.teal[500],
        elevation: 6,
        child: Icon(Icons.message),
      ),
      body: ListView(
        children: [
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/portrait-mature-man-smiling-camera-handsome-businessman-portrait-mature-man-smiling-camera-handsome-164936393.jpg",
            time: Text("08:15"),
            name: "Adeel Haider",
            mes: "Hello! Whats up?",
            icon: Icon(
              Icons.done_all,
              color: Colors.green,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/portrait-smiling-middle-aged-lady-resting-sofa-portrait-smiling-middle-aged-lady-resting-sofa-using-cellphone-happy-174979677.jpg",
            time: Text("1:50"),
            name: "Sana",
            mes: "Whats going on bro!..???",
            icon: Icon(
              Icons.done,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/close-up-middle-age-man-glasses-smiling-against-white-background-close-up-portrait-middle-age-man-glasses-smiling-118510238.jpg",
            time: Text("12:02"),
            name: "Anees",
            mes: "Missed voice call",
            icon: Icon(
              Icons.phone_missed,
              color: Colors.red,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/portrait-handsome-smiling-young-man-folded-arms-smiling-joyful-cheerful-men-crossed-hands-isolated-studio-shot-172869765.jpg",
            time: Text(
              "Yesterday",
              style: TextStyle(fontSize: 12),
            ),
            name: "Hammad",
            mes: "This message was deleted",
            icon: Icon(
              Icons.do_disturb_alt_outlined,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/portrait-nice-modern-handsome-male-student-glasses-blue-shirt-touching-frame-eyewear-smiling-friendly-delight-delighted-129358021.jpg",
            time: Text(
              "01/04/22",
              style: TextStyle(fontSize: 12),
            ),
            name: "Adnan",
            mes: "Photo",
            icon: Icon(
              Icons.photo,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/little-girl-red-cup-fillter-images-close-up-filler-89194728.jpg",
            time: Text("11/02/22"),
            name: "Nafee",
            mes: "yeah Keep Dreaming",
            icon: Icon(
              Icons.done_all,
              color: Colors.green,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/emotional-angry-middle-aged-man-over-gray-dark-background-62624316.jpg",
            time: Text(
              "Yesterday",
              style: TextStyle(fontSize: 12),
            ),
            name: "Aqsar",
            mes: "Photo",
            icon: Icon(
              Icons.photo,
              color: Colors.grey,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/elegant-young-handsome-man-studio-fashion-portrait-photo-34588771.jpg",
            time: Text("11/12/21"),
            name: "Asim",
            mes: "Congrats! Keep it up bro",
            icon: Icon(
              Icons.done_all,
              color: Colors.green,
              size: 20,
            ),
          ),
          Contact(
            profile:
                "https://thumbs.dreamstime.com/b/handsome-smiling-young-man-portrait-cheerful-looking-camera-101977866.jpg",
            time: Text("25/02/22"),
            name: "rameez",
            mes: "ohhh so sad................",
            icon: Icon(
              Icons.done,
              color: Colors.grey,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

//*********************
//*STATUS PAGE COMPONENTS
//*********************
statuspage(BuildContext context, TabController _tabcontroller) {
  return Scaffold(
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 45,
          height: 45,
          child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.grey[300],
              elevation: 4,
              child: Icon(
                Icons.create,
                color: Colors.grey[600],
              )),
        ),
        SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Container(
                  width: double.infinity,
                  height: 100,
                  color: Colors.teal,
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                titlePadding: EdgeInsets.zero,
                content: Text(
                  "To Capture photos and videos, allow WhatsApp access to your camera.",
                  style: TextStyle(fontSize: 15),
                ),
                contentPadding: EdgeInsets.only(left: 10, right: 5, top: 20),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      _tabcontroller.animateTo((_tabcontroller.index));
                    },
                    child: Text(
                      "NOT NOW ",
                      style: TextStyle(
                          color: Colors.teal[600], fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "CONTINUE",
                      style: TextStyle(
                          color: Colors.teal[600], fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          },
          backgroundColor: Colors.teal[500],
          elevation: 4,
          child: Icon(Icons.camera_alt_rounded),
        ),
      ],
    ),
    body: ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {},
          child: ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[400]),
              child: Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              ),
            ),
            title: Text(
              "My status",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              "Tap to add status update",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 5),
          child: Text(
            "Viewd updates",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.grey[700]),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          children: [
            InkWell(
              onTap: () {},
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://thumbs.dreamstime.com/b/handsome-smiling-young-man-portrait-cheerful-looking-camera-101977866.jpg"),
                ),
                title: Text(
                  "Rameez",
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "Today, 08:34",
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

//*********************
//*CALLS PAGE COMPONENTS
//*********************
callspage(BuildContext context) {
  return Scaffold(
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SelectContactOfCalls(),
          ),
        );
      },
      backgroundColor: Colors.teal[500],
      elevation: 6,
      child: Icon(Icons.add_call),
    ),
    body: Padding(
      padding: EdgeInsets.only(top: 160),
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: 500),
        builder: (BuildContext context, double _value, child) {
          return Opacity(
            opacity: _value,
            child: Padding(
              padding: EdgeInsets.only(top: _value * 50),
              child: child,
            ),
          );
        },
        child: Container(
            width: double.infinity,
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                children: [
                  TextSpan(
                    text: "To start calling contacts who have\n WhatsApp, tap ",
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.add_call,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  TextSpan(
                    text: " at the bottom of your\n screen.",
                  ),
                ],
              ),
            )),
      ),
    ),
  );
}

// *CONTACT(CHATPAGE) CLASS FOR LISTTILE DETAILS
class Contact extends StatelessWidget {
  Contact({
    required this.profile,
    required this.time,
    required this.name,
    required this.mes,
    required this.icon,
  });

  final String profile;
  final Text time;
  final String name;
  final String mes;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(profile),
        ),
        trailing: time,
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Row(
          children: [
            icon,
            SizedBox(
              width: 5,
            ),
            Text(mes),
          ],
        ),
      ),
    );
  }
}
