import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'confirm_upload_video.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: UploadVideoPage()));
}

class UploadVideoPage extends StatefulWidget {
  @override
  _UploadVideoPageState createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();

  XFile? _videoFile;

  Future<void> _pickVideo() async {
    final picker = ImagePicker();
    final video = await picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        _videoFile = video;
      });
    }
  }

  void _uploadVideo() {
    if (_formKey.currentState!.validate()) {
      if (_videoFile != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Video uploaded successfully!')),
        );
        // ارفع الفيديو هنا
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select a video.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Upload video", style: TextStyle(color: Colors.deepPurple)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload video", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your video Name',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Enter video name' : null,
              ),
              SizedBox(height: 16),
              Text("Video Description", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(
                  hintText: 'Enter your Description',
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                validator: (value) => value == null || value.isEmpty ? 'Enter description' : null,
              ),
              SizedBox(height: 16),
              Text("Upload video file", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              GestureDetector(
                onTap: _pickVideo,
                child: Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    color: Colors.grey[100],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.video_library, color: Colors.deepPurple),
                        SizedBox(height: 5),
                        Text(
                          "Select Your video",
                          style: TextStyle(color: Colors.deepPurple),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Confirm()), (route) => false);},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Upload video",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
