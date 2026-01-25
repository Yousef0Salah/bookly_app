import 'package:bookly/Features/home/data/model/book_model/book_model.dart';
import 'package:bookly/core/widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookAction extends StatelessWidget {
  const BookAction({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                final hasPdf = bookModel.accessInfo?.pdf?.isAvailable ?? false;

                late final Uri uri;

                if (hasPdf && bookModel.accessInfo?.pdf?.acsTokenLink != null) {
                  final acsLink = bookModel.accessInfo!.pdf!.acsTokenLink!;
                  final viewerUrl =
                      'https://docs.google.com/gview?embedded=true&url=$acsLink';

                  uri = Uri.parse(viewerUrl);
                } else {
                  uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                }

                if (!await launchUrl(
                  uri,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw Exception('Could not launch $uri');
                }
              },
              fontSize: 16,
              text: 'Free Preview',
              backgroundColor: Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
