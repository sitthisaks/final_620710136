import 'package:flutter/material.dart';

import '../../models/poll.dart';
import '../my_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Poll>? _polls;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    // todo: Load list of polls here
  }

  @override
  Widget build(BuildContext context) {

    return MyScaffold(
      body: Column(
        children: [
          Image.network('https://cpsu-test-api.herokuapp.com/images/election.jpg'),
          Expanded(
            child: Stack(
              children: [
                if (_polls != null) _buildList(),
                if (_isLoading) _buildProgress(),
              ],
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '1. บุคคลใดที่คุณจะสนับสนุนให้เป็นนายกรัฐมนตรีในการเลือกตั้งครั้งนี้',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.5,
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '2. ในการเลือกตั้ง ส.ส. แบบแบ่งเขต คุณจะเลือกผู้สมัครจากพรรคการเมืองใด',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.5,
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                '3. ในการเลือกตั้ง ส.ส. แบบบัญชีรายชื่อ คุณจะเลือกผู้สมัครจากพรรคการเมืองใด',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ListView _buildList() {
    return ListView.builder(
      itemCount: _polls!.length,
      itemBuilder: (BuildContext context, int index) {
        // todo: Create your poll item by replacing this Container()
        return Container();
      },
    );
  }

  Widget _buildProgress() {
    return Container(
      color: Colors.black.withOpacity(0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('รอสักครู่', style: TextStyle(color: Colors.white)
              ),
            ),
          ],
        ),
      ),
    );
  }

}