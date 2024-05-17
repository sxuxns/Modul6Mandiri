import 'package:flutter/material.dart';
import '../models/berita.dart';

class DetailPage extends StatelessWidget {
  final Berita berita;

  const DetailPage({Key? key, required this.berita}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Berita',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal, 
      ),
      body: Container(
        color: Colors.teal[50],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    berita.thumbnail,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  berita.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal[800], 
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.date_range,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      berita.pubDate,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), 
                      ),
                    ],
                  ),
                  child: Text(
                    berita.description,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
