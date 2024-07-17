import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:statsfl/statsfl.dart';

void main() => runApp(const TestApp());

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StatsFl(
      align: Alignment.center,
      maxFps: 120,
      child: const MaterialApp(
        title: 'Flutter 모듈 테스트 앱',
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: true,
        home: TestHomePage(title: 'Flutter 모듈 테스트 앱'),
      ),
    );
  }
}

class TestHomePage extends StatelessWidget {
  const TestHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        forceMaterialTransparency: true,
        shape: const Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          if (index % 2 == 0) {
            return SizedBox(
              height: 100,
              child: UiKitView(
                viewType: 'viewType',
                layoutDirection: TextDirection.ltr,
                creationParams: {'index': index},
                creationParamsCodec: const StandardMessageCodec(),
              ),
            );
          } else {
            return SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  '${index + 1} 번째 항목',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.grey,
            height: 1,
          );
        },
        itemCount: 100,
      ),
    );
  }
}
