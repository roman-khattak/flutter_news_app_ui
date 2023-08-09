import 'package:flutter/material.dart';
import 'package:flutter_news_app_ui/widgets/image_container.dart';

import '../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';
import 'article_screen.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Health', 'Politics', 'Art', 'Food', 'Science'];

    return DefaultTabController(
      //we wrap "Scaffold" with 'DefaultTabController' so that we can controll which Tab Data to show on the screen
      initialIndex: 0, // Initial Tab to be selected
      length: tabs.length, // Total number of 'Tabs'
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),

        bottomNavigationBar: const BottomNavBar(
            index:
                1), // we will change the index number of the icon clicked in "bottomNavigationBar" so that on click a different icon can be selected ie; "Search Icon"
        extendBodyBehindAppBar: false,
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20),
          children: [
           _DiscoverNews(), // this widget will make the upper section of the "Discover Screen"

            // Lets Start adding 'tabs' inside the 'listView'
            _CategoryNews(tabs: tabs)
          ],
        ),
      ),
    );
  }
}

class _CategoryNews extends StatelessWidget {
   const _CategoryNews({Key? key,
     required this.tabs
   }) : super(key: key);

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {

    final articles = Article.articles;

    return Column(
      children: [
        // We create a 'TabBar' so as to use it to move from one tab to another
        // we are going to iterate through each of the single 'Tab' thus for each of the 'Tab' 'name' we have in the 'TabList' above we create a different Tab object
        TabBar(
          isScrollable: true,   // so that the Items can be seen clearly and can be scrolled through
          indicatorColor: Colors.black,  // the indicator is teh "Underline" that exist below the Tab
          tabs: tabs
              .map(
                (tab) => Tab(
                  icon: Text(
                    tab,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
              .toList(),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(   // we will create a different tab for each of the different news category we have
            children: tabs.map((tab) => ListView.builder(   // thus we will iterate through different "tabs" and for each Tab we return a "ListView.builder" in which we are going to create a list of different articles
              shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context,
                        ArticleScreen.routeName,
                      arguments: articles[index],   // we will pass the aricle's index of the clicked article so as to show its data in the next screen
                    );
                  },
                  child: Row(
                    children: [
                      ImageContainer(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.all(10),
                          borderRadius: 5,
                          imageUrl: articles[index].imageUrl
                      ),

                      Expanded(  // so that the text widget takes all the available space
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                articles[index].title,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold
                                ),
                            ),

                            const SizedBox(height: 10),

                            Row(
                              children: [
                                const Icon(
                                  Icons.schedule,
                                  size: 18,
                                ),

                                const SizedBox(width: 5),   // width is provided here for creating space

                                Text(
                                  '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                                  style: const TextStyle(fontSize: 12),
                                ),

                                const SizedBox(width: 20),
                                const Icon(
                                  Icons.visibility,
                                  size: 18,
                                ),

                                const SizedBox(width: 5),
                                Text(
                                  '${articles[index].views} views',
                                  style: const TextStyle(fontSize: 12),
                                )

                              ],
                            )

                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            )
            ).toList(),
          ),
        )

      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height *
          0.25, // take 25% of the total screen
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Discover',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 5),
          Text('News from all over the world',
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
                hintText: 'Search',
                fillColor: Colors.grey.shade200,
                filled:
                    true, // "filled" property is set to 'true' so that the background can be filled with color
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const RotatedBox(
                  // this 'RotatedBox' widget will rotate the icon
                  quarterTurns:
                      1, //'quarterTurns' set to '1' means rotate icon by 90 degree
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide
                        .none // removing the borders around the TextFormField
                    )),
          )
        ],
      ),
    );
  }
}
