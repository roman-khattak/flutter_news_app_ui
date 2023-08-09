import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl; //Banner of the article
  final int views;      // this "int" will receive the count of views that the article has received
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.views,
    required this.createdAt
});

  // creating a list of Articles based on some sample data
  static List<Article> articles = [

    Article(
      id: '1',
      title: 'A game changer?',
      subtitle: 'The thaw in Saudi-Iran relations is a potential game changer for the region',
      body: 'THE Middle East’s security landscape could be transformed by an unanticipated development that took place earlier this month. Long-standing regional rivals Saudi Arabia and Iran agreed to restore bilateral relations after seven years of bitter confrontation and a diplomatic hiatus. The deal was signed in Beijing, which mediated the agreement. In the joint trilateral statement, the two countries pledged to respect the “sovereignty of states” and “non-interference in the internal affairs of states”. They agreed to revive their 2001 security cooperation pact and renew their general cooperation agreement of 1998, which ranges over trade, economy and investment. The breakthrough followed several days of talks in China, which were preceded by two key high-level visits — by Iranian President Ebrahim Raisi to Beijing in February 2023 and Chinese President Xi Jinping’s trip to Saudi Arabia in December 2022. These summit-level meetings and Saudi-Iranian exchanges in the region laid the necessary groundwork for the March 10 agreement.',
      author: 'Maleeha Lodhi',
      authorImageUrl: 'https://i.dawn.com/primary/2023/03/64178092a69a5.jpg',
      category: 'Politics',
      views: 1204,
      imageUrl: 'https://images.unsplash.com/photo-1505635552518-3448ff116af3?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80',
      //imageUrl: 'https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),   // used to show that article is written in the past
    ),

    Article(
      id: '2',
      title: 'Misplaced optimism?',
      subtitle: 'The solution to all Pakistan’s problems lies in correcting its policies rather than building false hopes on political developments elsewhere.',
      body: 'PAKISTAN can take comfort in the decision taken by Iran and Saudi Arabia, after mediation by China, to restore diplomatic ties. Pakistan has long been struggling to maintain a balance in its ties with the two states, although it has always maintained a clear tilt towards Riyadh because of its constant financial and political support. Pakistan has not fully exploited the potential of its economic and trade engagement with Iran evidently on the pretext of factors concerning Saudi Arabia and the US. It is too early to predict whether the restoration of Saudi-Iranian ties will put an end to their politico-ideological rivalry; it is also too simplistic to assume that it will resolve sectarian tensions in Pakistan, which have largely been abetted by the Saudis and Iranians in the past. Many in Islamabad also describe the development as a game changer for Pakistan based on the perception that normalcy between the two archrivals in the Middle East will ease some economic difficulties. Pakistan needs to review its relationship with both countries; it may discover that the restoration of diplomatic ties between Iran and Saudi Arabia cannot change much for Pakistan as the problem lies in its own (bilateral) relations with each of the two countries.',
      author: 'M Amir Rana',
      authorImageUrl: '	https://i.dawn.com/primary/2023/03/64166a95730bc.jpg',
      category: 'Politics',
      views: 800,
      imageUrl: 'https://images.unsplash.com/photo-1557098335-a82a4f429af8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=468&q=80',
      createdAt: DateTime.now().subtract(const Duration(hours: 6)),
    ),

    Article(
      id: '3',
      title: 'AShaheen’s cameo proved turning point of the final, says Rizwan',
      subtitle: 'Meanwhile, Shaheen was appo­inted as captain of the Team of PSL 8 by an independent panel headed by Haroon Rashid',
      body: 'LAHORE: Both Shaheen Shah Afridi and Mohammad Rizwan hea­ped praise on each other following the nerve-racking final of the HBL Pakistan Super League here at the Gaddafi Stadium on Saturday night. “Rizwan is a good human being, having a different personality and the way he is improving is remarkable. Scoring 500-plus runs in back-to-back PSL editions plus amassing 1,000 runs in international contests in a calendar year is not easy for a cricketer but he is doing it,” Lahore Qalandars’ captain Shaheen, who led from the front with a title-winning all-round performance in the decider, said in the post-final press conference. On the other hand, Multan Sultans’ skipper Rizwan whose team could not grab the PSL-8 title after losing the final by just one run, reckoned Shaheen’s batting was the key moment in the thrill-filled decider. “For me, the turning point of the final was Shaheen’s aggressive batting, and not my catch [held by David Wiese]. We had taken control over the final but Shaheen took the momentum away from us,” the 30-year-old Rizwan said referring to the left-hander’s rapid-fire 15-ball 44 that helped Qalandars reach the 200 mark in the end. Commenting on his cameo featuring five sixes and two fours in the final, Shaheen said his decision to come in to bat was a quick call made with a plan.',
      author: 'Mohammad Yaqoob',
      authorImageUrl: 'https://images.unsplash.com/photo-1444491741275-3747c53c99b4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      category: 'Sports',
      views: 900,
      imageUrl: 'https://i.dawn.com/primary/2023/03/2009403730508f2.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
    ),

    Article(
      id: '4',
      title: 'Learning from our last default',
      subtitle: 'Why were we unable to use the period of debt relief to get on a sustainable debt-servicing trajectory?',
      body: 'THERE has been much talk recently of Pakistan’s seeking a restructuring of its external debt servicing obligations. We last requested such restructuring in December 1998. What lessons does our past experience hold for our current predicament? After it carried out a series of nuclear explosions in May 1998, important bilateral lenders imposed sanctions on Pakistan and cut off new loans. Multilateral lenders also suspended new loans. To conserve foreign exchange, Pakistan cut back on public spending, devalued the rupee and instituted capital controls. This proved insufficient. The country was still unable to pay maturing claims and requested a restructuring of its bilateral debt through what is called a Paris Club process. The restructuring negotiations began in December 1998 and ended in December 2001. By January 2001, three agreements had been reached, covering around 6 billion of debt. At one-third of the total bilateral debt, this was a modest yield for more than two years of effort. Then, in December 2001, a fourth agreement was announced. This extended restructuring terms to the entire remaining stock of bilateral debt of around 12.5bn. Also and separately, sanctions were lifted and access to multilateral lending restored.',
      author: 'Farrukh Iqbal',
      authorImageUrl: 'https://i.dawn.com/primary/2023/03/640e86dc80b10.jpg',
      category: 'Economy',
      views: 1000,
      imageUrl: 'https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
      createdAt: DateTime.now().subtract(const Duration(hours: 19)),
    ),

    Article(
      id: '5',
      title: 'FLOODS 2022',
      subtitle: 'The Way Forward',
      body: 'Two-thirds of Pakistan was submerged under water. Water that swelled, broke embankments and swept entire villages away. People were struggling with little to no access to food or any kind of shelter. In line with our vision to provide relief and rehabilitation to people in distress, Dawn Relief first initiated operations in villages in Balochistan that had been worst-hit by the floods and then expanded its relief operations to Khyber Pakhtunkhwa and Sindh. We worked round-the-clock, distributing relief goods (including tents, essential food, soap, mosquito repellents and cooking utensils) in Lasbela District in southern Balochistan, which was among the worst affected by the floods. We first focused on Uthal Tehsil, home to 21,979 men and women and 20,888 children (total population: 42,867). Before the floods struck, Uthal was a farming community scattered across several villages — and home to 7,912 families. The floods wiped everything out — entire houses, crops and livestock. Then, we moved further north to Bela Tehsil, where 40,682 men and women and 39,442 children live (total population: 80,124 people) and where some 14,606 families were without shelter and food. After Uthal and Bela, we directed our efforts to Khyber Pakhtunkhwa, where in addition to the distribution of relief goods, we started the construction of a 350-foot cable trolley to replace a bridge that was destroyed during the floods. This will enable the people living along Mahandari Nullah to access neighbouring areas. We also managed to expand our operations to southern Sindh with distribution drives in Goth Saleh Muhammad Bagul and Goth Suleman Kerai in Sujawal District and in the settlements of Bajara, with its population of approximately 3,500 people, in the province’s Sehwan taluka.',
      author: 'Dawn Relief',
      authorImageUrl: 'https://images.unsplash.com/photo-1509475826633-fed577a2c71b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
      category: 'Natural Calamities',
      views: 1100,
      imageUrl: 'https://i.dawn.com/primary/2022/10/191243129fefa9a.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 20)),
    ),

  ];

  // we will use "props" to compare different instances of this class
  @override
  List<Object?> get props => [   // we can also add all the variables into "props"
    id,
    title,
    subtitle,
    body,
    author,
    authorImageUrl,
    category,
    imageUrl,
    views,
    createdAt
  ];

}