import 'package:flutter/material.dart';
import 'package:flutter_news_app_ui/widgets/image_container.dart';

import '../models/article_model.dart';
import '../widgets/custom_tag.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {

    // to fetch the data we are passing with the "Navigator" from the other screen we need a 'ModalRoute' and access the arguments and store it as 'Article' Object
    final article = ModalRoute.of(context)!.settings.arguments as Article;   // for this 'Article' object we import "model Class"
    return ImageContainer(  // wrapping scaffold with ImageContainer so that the image can always feel the background
        width: double.infinity,
        imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(   // creates the back_arrow
            color: Colors.white
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),

        extendBodyBehindAppBar: true,

        body: ListView(
          children: [

            _NewsHeadline(article: article),

            _NewsBody(article: article)

          ],
        ),

      ),
    );
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [

          Row(
            children: [
              CustomTag(
                  backgroundColor: Colors.black,
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: NetworkImage(
                        article.authorImageUrl,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      article.author,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ]
              ),

              const SizedBox(width: 10,),

              CustomTag(
                  backgroundColor: Colors.grey.shade200,
                  children: [
                   const Icon(
                     Icons.timer,
                     color: Colors.grey,
                   ),
                    const SizedBox(width: 10),
                    Text(
                      '${DateTime.now().difference(article.createdAt).inHours} h',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ]
              ),

              const SizedBox(width: 10,),

              CustomTag(            // this will indicate how many views the article has received
                  backgroundColor: Colors.grey.shade200,
                  children: [
                    const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 10),
                    Text(
                    '${article.views}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),

                  ]
              ),

            ],
          ),

          const SizedBox(height: 20.0),
          Text(
            '${article.title}',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 20.0),
          Text(
            '${article.body}',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 1.5
            ),
          ),

          const SizedBox(height: 20.0),
          GridView.builder(
            shrinkWrap: true,
              itemCount: 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: 1.25      // so that image is larger than it's height
              ),
            itemBuilder: (BuildContext context, int index) {
                return ImageContainer(
                    width: MediaQuery.of(context).size.height * 0.42,
                    imageUrl: article.imageUrl,
                  margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
                );
            },
          ),

        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          SizedBox(height: MediaQuery.of(context).size.height * 0.15,),  // creating space of 15% height of the screen

          CustomTag(
              backgroundColor: Colors.grey.withAlpha(150),
              children: [
                Text(
                  article.category,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              ]
          ),
          const SizedBox(height: 10,),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.5
            )
          ),

          const SizedBox(height: 10,),

          Text(
              article.subtitle,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
              )
          ),

        ],
      ),
    );
  }
}
