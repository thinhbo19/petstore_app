import 'package:flutter/material.dart';
import 'dart:async';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(Duration(seconds: 4)); // Giả lập thời gian tải
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: _isLoading ? _buildContent() : HomePage(),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.pinkAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Để căn giữa
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white.withValues(
                    red: 255,
                    green: 255,
                    blue: 255,
                    alpha: 204 // 0.8 * 255 = 204
                    ),
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/logo-web.png',
                  height: 100), // Logo
            ),
            SizedBox(height: 20),
            Text(
              'Chào mừng đến với\nShop Thú Cưng!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min, // Để căn giữa
              children: [
                _buildPetIcon(Icons.pets),
                SizedBox(width: 15),
                _buildPetIcon(Icons.favorite),
                SizedBox(width: 15),
                _buildPetIcon(Icons.pets),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              height: 5,
              child: LinearProgressIndicator(
                value: null,
                backgroundColor: const Color.fromARGB(255, 224, 224, 224),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                print("Bắt đầu mua sắm!"); // Thay bằng navigation nếu cần
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Text(
                'Bắt đầu mua sắm',
                style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget Icon thú cưng dễ thương
  Widget _buildPetIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withValues(
            red: 255, green: 255, blue: 255, alpha: 204 // 0.8 * 255 = 204
            ),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 40, color: Colors.pinkAccent),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trang Chủ')),
      body: Center(child: Text('Chào mừng bạn đến với Home!')),
    );
  }
}
