import 'package:flutter/material.dart';
import 'package:study_market/domain/model/doc.dart';

class DocWidget extends StatelessWidget {
  final Doc doc;

  const DocWidget({Key? key, required this.doc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uri uri = Uri.parse(doc.downloadUrl);
    //확장자 얻기기
   String extension = uri.pathSegments.last.split('.').last;
    return ListTile(
      title: Text(doc.fileName),
      trailing: _buildIcon(extension),

    );
  }

  Widget _buildIcon(String extension) {
    switch (extension) {
      case 'pdf':
        return Icon(Icons.picture_as_pdf);
      case 'jpg':
        return Icon(Icons.photo);
      default:
        return const Icon(Icons.text_fields);
    }
  }
}
