import 'package:flutter/material.dart';
import 'package:flutter_news_app_ui/widgets/custom_tag.dart';

import '../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';
import 'article_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';    // declaring the actual name of route here and it is associated with the "routes" in "main.dart"

  @override
  Widget build(BuildContext context) {

    Article article = Article.articles[0];   // as we are going to use this "Article.articles[index]" multiple times so save a specific article into a variable inside build method.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.white,),
        ),
      ),

      bottomNavigationBar: const BottomNavBar(index: 0),   // my custom designed BottomNavigationBar class
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: [
          _NewsOfTheDay(article: article),

          _BreakingNews(articles: Article.articles),

        ],
      ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key? key,
    required this.articles,    //articles are required as an input here
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Breaking News",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),

              Text('More', style: Theme.of(context).textTheme.bodyLarge,)

            ],
          ),
          
          const SizedBox(height: 20),
          
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,   // 'scroll Direction' is horizontal so a horizontal slider is created this way
                itemCount: articles.length,
                itemBuilder: (context, index) {
                return Container(
                 width: MediaQuery.of(context).size.width * 0.5,  // this size is given to the container so that the 'title' is not spread in horizontal space but instead the text is contained into the space of "ImageContainer" and text is broken into lines if exceed the limit of "0.5%" of screen
                  margin: const EdgeInsets.only(right: 10), // this 'margin' will create space between the containers in listView

                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context,
                          ArticleScreen.routeName,
                          arguments: articles[index] // we take data of the article and send it to another screen to display
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                            width: MediaQuery.of(context).size.width * 0.5, // taking 50% of the width of screen
                            imageUrl: articles[index].imageUrl
                        ),
                        const SizedBox(height: 10,),
                        Text(
                          maxLines: 2,
                          articles[index].title,
                          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                            height: 1.5
                          ),
                        ),

                        const SizedBox(height: 5),
                        Text(
                          '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',   // we compare current time with article createdAt DateTime Object
                          style: Theme.of(context).textTheme.bodySmall
                        ),

                        const SizedBox(height: 5),
                        Text(
                           "by ${articles[index].author}",
                            style: Theme.of(context).textTheme.bodySmall
                        ),
                      ],
                    ),
                  ),
                );
                },
            ),
          )
          
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.all(20),   // this padding is given to Text Widget ("News of the Day")
      imageUrl: article.imageUrl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: [
                Text(
                  "News of the Day",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                  ),
                ),
              ]
          ),

          const SizedBox(height: 10),

          Text(
              article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              height: 1.25
            ),
          ),

          TextButton(
              onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),   // this padding is "cancelled" so that the text button can allign with the other widgets from Left size
              child: Row(
                children: [

                  Text(
                    "Learn More",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  )

                ],
              )
          ),
        ],
      ),
    );
  }
}


