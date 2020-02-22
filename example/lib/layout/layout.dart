import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fpyi/fpyi.dart';
import 'package:fpyi_example/layout/store.dart';

final store = LayoutStore();

class Layout extends PYIComponent {
  @override
  Widget render(BuildContext context) {
    // store.checkLogin(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('云链天下'),
        leading: Icon(Icons.home),
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_alarm),
            tooltip: 'Add Alarm',
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              store.createHeaderBtn(Icons.message, '发起群聊', 'A'),
              store.createHeaderBtn(Icons.group_add, '添加服务', 'B'),
              store.createHeaderBtn(Icons.cast_connected, '扫一扫码', 'C'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              switch (action) {
                case 'A':
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
          )
        ],
      ),
      body: Center(
        heightFactor: double.infinity,
        widthFactor: double.infinity,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Text('You have pushed the button this many times:'),
              Expanded(
                child: Container(
                  height: double.infinity,
                  child: RouteView().display,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: Observer(
        builder: (_) => BottomNavyBar(
          selectedIndex: store.currentIndex,
          showElevation: true,
          itemCornerRadius: 8,
          // onItemSelected: store.onItemSelected,
          onItemSelected: (index) {
            switch (index) {
              case 0:
                Navigator.of(context).pushNamed('/finance');
                break;
              case 1:
                Navigator.of(context).pushNamed('/transport');
                break;
              case 2:
                Navigator.of(context).pushNamed('/goods');
                break;
              case 3:
                Navigator.of(context).pushNamed('/supplier');
                break;
              case 4:
                Navigator.of(context).pushNamed('/setting');
                break;
            }
          },
          items: [
            BottomNavyBarItem(
              title: Text('财务管理'),
              icon: Icon(
                IconData(0xe611, fontFamily: 'iconfonts'),
              ),
              activeColor: Colors.red,
            ),
            BottomNavyBarItem(
              title: Text('运输管理'),
              icon: Icon(
                IconData(0xe606, fontFamily: 'iconfonts'),
              ),
              activeColor: Colors.pink,
            ),
            BottomNavyBarItem(
              title: Text('商品管理'),
              icon: Icon(
                IconData(0xe607, fontFamily: 'iconfonts'),
              ),
              activeColor: Colors.blue,
            ),
            BottomNavyBarItem(
              title: Text('供应商管理'),
              icon: Icon(
                IconData(0xe604, fontFamily: 'iconfonts'),
              ),
              activeColor: Colors.blueGrey,
            ),
            BottomNavyBarItem(
              title: Text('系统管理'),
              icon: Icon(
                IconData(0xe604, fontFamily: 'iconfonts'),
              ),
              activeColor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
