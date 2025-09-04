import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/quiz/daily_quiz_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DailyQuizView(),
            SizedBox(height: 16.0),
            ListTile(
              title: Text('更多练习'),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              children: [
                ExerciseCard(title: '简易微积分', image: 'assets/images/youkre-launch@2x.png'),
                ExerciseCard(title: '初级代数', image: 'assets/images/youkre-launch@2x.png'),
                ExerciseCard(title: '概率统计入门', image: 'assets/images/youkre-launch@2x.png'),
                ExerciseCard(title: '三角函数', image: 'assets/images/youkre-launch@2x.png'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final String title;
  final String image;

  const ExerciseCard({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

