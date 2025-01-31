import 'package:flutter/material.dart';

class UploadDocumentScreen extends StatefulWidget {
  @override
  _UploadDocumentScreenState createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? selectedCategory;
  String? selectedTag;
  List<String> uploadedDocs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Upload Document'), backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // First Name Field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Document Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Category & Tag in a Row
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedCategory,
                    onChanged: (value) =>
                        setState(() => selectedCategory = value),
                    items: ['Business', 'Education', 'Personal']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'Tag',
                      border: OutlineInputBorder(),
                    ),
                    value: selectedTag,
                    onChanged: (value) => setState(() => selectedTag = value),
                    items: ['Urgent', 'Important', 'Normal']
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Upload Document Button
            Center(
              child: ElevatedButton.icon(
                onPressed: _uploadDocument,
                icon: Icon(Icons.upload_file),
                label: Text(
                  'Upload Document',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              ),
            ),
            SizedBox(height: 16),

            // Uploaded Documents Box
            Container(
              height: 100,
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: uploadedDocs.isEmpty
                  ? Center(
                      child: Text('No Documents Uploaded',
                          style: TextStyle(color: Colors.grey)))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: uploadedDocs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 8),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.teal.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.insert_drive_file, color: Colors.teal),
                              SizedBox(width: 8),
                              Text(uploadedDocs[index],
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 8),
                              GestureDetector(
                                onTap: () => _deleteDocument(index),
                                child: Icon(Icons.delete, color: Colors.red),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void _uploadDocument() {
    // Mocking file upload
    setState(() {
      uploadedDocs.add('Document ${uploadedDocs.length + 1}.pdf');
    });
  }

  void _deleteDocument(int index) {
    setState(() {
      uploadedDocs.removeAt(index);
    });
  }
}
