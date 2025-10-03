import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(EcoVentureApp());
}

class EcoVentureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoVenture',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFF001422),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1600), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeContainer()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFF071524),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/globe.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "EcoVenture",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
            Spacer(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class HomeContainer extends StatefulWidget {
  @override
  _HomeContainerState createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    DashboardScreen(),
    HeatMapScreen(),
    PredictionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Color(0xFF071524),
              child: _pages[_currentIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0xFF0B2836),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navButton(Icons.home, "Home", 0),
            _navButton(Icons.map, "HeatMap", 1),
            _navButton(Icons.show_chart, "Prediction", 2),
          ],
        ),
      ),
    );
  }

  Widget _navButton(IconData icon, String label, int index) {
    final bool active = index == _currentIndex;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: active ? Colors.white : Colors.white70),
          SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
                color: active ? Colors.white : Colors.white70, fontSize: 12),
          )
        ],
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        children: [
          HeaderTitle(title: "DashBoard"),
          SizedBox(height: 20),
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Color(0xFF07232D).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.greenAccent,
                              Colors.yellowAccent,
                              Colors.redAccent,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "78",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Air Quality",
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Color(0xFF1E2C33),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.traffic, color: Colors.orangeAccent),
                            SizedBox(width: 10),
                            Expanded(
                                child: Text("Medium",
                                    style: TextStyle(color: Colors.white))),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("Traffic",
                          style: TextStyle(color: Colors.white70)),
                      SizedBox(height: 18),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: LinearPercentIndicator(
                                  lineHeight: 14.0,
                                  percent: 0.65,
                                  backgroundColor: Colors.white24,
                                  progressColor: Colors.greenAccent,
                                  barRadius: Radius.circular(12),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("65%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text("City Health Index",
                              style: TextStyle(color: Colors.white70)),
                          SizedBox(height: 18),
                        ],
                      ),
                      SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 14),
                        decoration: BoxDecoration(
                          color: Color(0xFF0D1A22),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Recommendation:",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white)),
                            SizedBox(height: 8),
                            Text("1. Air Quality is Moderate",
                                style: TextStyle(color: Colors.white70)),
                            Text(
                                "2. Safe to go outside, but consider keeping a mask",
                                style: TextStyle(color: Colors.white70)),
                            Text("3. Avoid high traffic zones during 2-5 PM",
                                style: TextStyle(color: Colors.white70)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF07232D).withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white70),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                        "This is a demo representaation of the DashBoard.",
                        style: TextStyle(color: Colors.white70))),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class HeatMapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        children: [
          HeaderTitle(title: "HeatMap Explorer"),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black26,
              image: DecorationImage(
                image: AssetImage('assets/map_placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 40,
                  top: 120,
                  child: HeatBlob(size: 220, colors: [
                    Colors.green.withOpacity(0.10),
                    Colors.transparent,
                  ]),
                ),
                Positioned(
                  left: 140,
                  top: 60,
                  child: HeatBlob(size: 180, colors: [
                    Colors.yellow.withOpacity(0.20),
                    Colors.transparent,
                  ]),
                ),
                Positioned(
                  right: 40,
                  top: 160,
                  child: HeatBlob(size: 160, colors: [
                    Colors.red.withOpacity(0.28),
                    Colors.transparent,
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF07232D).withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white70),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                        "This is a demo overlay of the Heatmap. Red areas indicate high pollution.",
                        style: TextStyle(color: Colors.white70))),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class HeatBlob extends StatelessWidget {
  final double size;
  final List<Color> colors;
  const HeatBlob({required this.size, required this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: colors,
          stops: [0.0, 1.0],
        ),
      ),
    );
  }
}

class PredictionScreen extends StatelessWidget {
  final List<Map<String, dynamic>> predictions = [
    {
      'date': 'Feb 17, 2025',
      'day': 'Friday',
      'aqi': 49,
      'label': 'Good',
      'desc': 'Fine'
    },
    {
      'date': 'Feb 18, 2025',
      'day': 'Saturday',
      'aqi': 157,
      'label': 'UNHEALTHY',
      'desc': 'MODERATE'
    },
    {
      'date': 'Feb 19, 2025',
      'day': 'Sunday',
      'aqi': 153,
      'label': 'UNHEALTHY',
      'desc': 'MODERATE'
    },
    {
      'date': 'Feb 20, 2025',
      'day': 'Monday',
      'aqi': 204,
      'label': 'VERY UNHEALTHY',
      'desc': 'UNHEALTHY'
    },
    {
      'date': 'Feb 21, 2025',
      'day': 'Tuesday',
      'aqi': 132,
      'label': 'UNHEALTHY',
      'desc': 'Fine'
    },
    {
      'date': 'Feb 22, 2025',
      'day': 'Wednesday',
      'aqi': 121,
      'label': 'UNHEALTHY',
      'desc': 'Fine'
    },
    {
      'date': 'Feb 23, 2025',
      'day': 'Thursday',
      'aqi': 301,
      'label': 'HAZARDOUS',
      'desc': 'Fine'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      child: Column(
        children: [
          HeaderTitle(title: "7 Day Air Quality Prediction"),
          SizedBox(height: 20),
          Column(
            children: predictions
                .map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF071F28),
                  borderRadius: BorderRadius.circular(14),
                ),
                padding:
                EdgeInsets.symmetric(vertical: 16, horizontal: 14),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['date'],
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12)),
                          Text(p['day'],
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 10)),
                          SizedBox(height: 6),
                          Text("AQI",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 11)),
                          Text("${p['aqi']}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 6),
                          Text("Descending: ${p['desc']}",
                              style: TextStyle(
                                  color: Colors.white54, fontSize: 12))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 14),
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        p['label'],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ))
                .toList(),
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF07232D).withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white70),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                        "This is a demo representation of the AI Predicted 7 Day Air Quality Index.",
                        style: TextStyle(color: Colors.white70))),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

class HeaderTitle extends StatelessWidget {
  final String title;
  const HeaderTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        SizedBox(height: 18),
      ],
    );
  }
}
