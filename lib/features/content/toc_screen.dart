import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/models/course.dart';
import 'package:youkre_flutter/core/ui/widgets/text_card_view.dart';
import 'package:youkre_flutter/core/ui/widgets/title_summary_view.dart';
import 'package:youkre_flutter/features/content/webview_page.dart';
import 'package:youkre_flutter/features/content/viewmodel/toc_viewodel.dart';

class TocScreen extends StatelessWidget {
  final Course course;

  const TocScreen({
    super.key,
    required this.course
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
      ),
      body: ChangeNotifierProvider(
          create: (_) {
            final vm = TocViewModel();
            vm.loadData(course);
            return vm;
          },
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Consumer<TocViewModel>(
              builder: (context, vm, child) {
                return _buildBody(context);
              }
            ),
          ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final vm = context.watch<TocViewModel>();
    if (vm.isLoading) {
      return const CircularProgressIndicator();
    }
    if (vm.error != null) {
      return Text('加载失败: ${vm.error}');
    }

    return ListView(
      children: List.generate(vm.tocDisplayEntries.length, (index) {
        final entry = vm.tocDisplayEntries[index];
        return TextCardView(
            onTap: () {
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => WebViewPage(
                    course: course,
                    entry: entry,
                  )
                ),
              );
            },
            child: Expanded(
              child: TitleSummaryView(
                title: entry.title,
                summary: entry.summary,
              ),
            ),
        );
      }),
    );
  }
}