import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../features/content/content.dart';
import '../utils/responsive_utils.dart';

class PrivacyPolicySheet extends StatefulWidget {
  const PrivacyPolicySheet({super.key});

  @override
  State<PrivacyPolicySheet> createState() => _PrivacyPolicySheetState();
}

class _PrivacyPolicySheetState extends State<PrivacyPolicySheet> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ContentBloc>().add(const ContentFetchLegalEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                showDragHandle: true,
                builder: (context) {
                  return BlocBuilder<ContentBloc, ContentState>(
                    builder: (context, state) {
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: HtmlWidget(state.privacyPolicy?.content ?? ""),
                        ),
                      );
                    },
                  );
                });
          },
          child: Text(
            'Privacy Policy',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: Sizer.of(context).fontSize(16),
              fontWeight: FontWeight.bold,
              decorationColor: Theme.of(context).colorScheme.secondary,
            ),
          )),
    );
  }
}
