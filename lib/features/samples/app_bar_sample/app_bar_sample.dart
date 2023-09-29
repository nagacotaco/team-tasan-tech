import 'package:flutter/material.dart';
import 'package:team_tasan_tech/main.dart';
import 'package:team_tasan_tech/shared/extensions/build_context_extensions.dart';
import 'package:team_tasan_tech/shared/widgets/app_image.dart';

class AppBarSample extends StatelessWidget {
  const AppBarSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // * sample 1
            SliverAppBar(
              title: const Text('通知'),
              // trueの場合、ユーザーが下にスクロールするとアプリバーはすぐに表示defaultは`false`
              floating: false,
              toolbarHeight: $styles.dimens.appBarHeight,
            ),
            // * sample 2
            SliverAppBar(
              // trueの場合、ユーザーが下にスクロールするとアプリバーはすぐに表示
              floating: false,
              toolbarHeight: context.sizeHeight * .14,
              automaticallyImplyLeading: false,
              flexibleSpace: const AppImage(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1682687221073-53ad74c2cad7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80')),
            ),
            // * sample 3
            SliverAppBar(
              title: const Text('このアップバーはスクロール時固定'),
              toolbarHeight: $styles.dimens.appBarHeight,
              // falseでタイトル左側に表示
              centerTitle: false,
              automaticallyImplyLeading: false,
              // スクロール時にアップバーを固定
              pinned: true,
              actions: [
                IconButton(
                    alignment: Alignment.topCenter,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                    )),
                IconButton(
                    padding: EdgeInsets.all($styles.insets.p4),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ))
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      color: Colors.amberAccent,
                      height: 300,
                    ),
                    Container(
                      color: Colors.greenAccent,
                      height: 300,
                    ),
                    Container(
                      color: Colors.blueAccent,
                      height: 300,
                    ),
                    Container(
                      color: Colors.purpleAccent,
                      height: 300,
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
