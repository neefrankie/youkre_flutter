import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youkre_flutter/core/ui/widgets/icon_title_summary.dart';
import 'package:youkre_flutter/core/ui/widgets/text_card_view.dart';
import 'package:youkre_flutter/features/content/toc_screen.dart';
import 'package:youkre_flutter/features/content/viewmodel/book_list_viewmodel.dart';

class BookListPage extends StatelessWidget {
  const BookListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final vm = BookListViewModel();
        vm.loadData();
        return vm;
      },
      child: Consumer<BookListViewModel>(
        builder: (context, vm, child) {
          return _buildBody(context);
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final vm = context.watch<BookListViewModel>();

    if (vm.isLoading) {
      return const CircularProgressIndicator();
    }
    if (vm.error != null) {
      return Text('加载失败: ${vm.error}');
    }

    return ListView(
      children: List.generate(vm.courses.length, (index) {
        final course = vm.courses[index];
        return TextCardView(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TocScreen(course: course)
                )
            );
          },
          child: IconTitleSummaryRow(
            title: course.title,
            summary: course.summary,
          ),
        );
      }),
    );
  }

}