import 'package:flutter/material.dart';

MyTabBar (TabController tabController, BuildContext context){
  return PreferredSize(
      preferredSize: Size.fromHeight(60),
      child: TabBar(
              controller: tabController,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              
              labelStyle: Theme.of(context).textTheme.bodyLarge,
              unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,
              tabs: const[
                Tab(
                  text: "Chats",
                ),
                Tab(
                  text: "Groups",
                ),
                Tab(
                  text: "Calls",
                ),
              ],
            
      ),
  );
}