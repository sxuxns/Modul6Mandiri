import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/berita_provider.dart';
import 'detail_berita.dart';

class BeritaPage extends StatelessWidget {
  const BeritaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BeritaProvider()..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'API Berita',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.teal,
        ),
        body: Container(
          color: Colors.teal[50],
          child: Consumer<BeritaProvider>(
            builder: (context, provider, _) {
              if (provider.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (provider.berita.isEmpty) {
                return Center(child: Text('No data available'));
              }
              return ListView.builder(
                itemCount: provider.berita.length,
                itemBuilder: (context, index) {
                  final berita = provider.berita[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      color: Colors.teal,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(berita: berita),
                            ),
                          );
                        },
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
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                berita.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal[50], 
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              Text(
                                berita.pubDate,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                berita.description,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.teal[50],
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
