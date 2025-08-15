import 'package:flutter/material.dart';


class MovieTabSection extends StatelessWidget {
  final String? overview;

  const MovieTabSection({
    super.key,
    this.overview
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            indicatorColor: Colors.grey,
            indicatorWeight: 2.5,
            tabs: [
              Tab(text: "About Movie"),
              Tab(text: "Reviews"),
              Tab(text: "Cast"),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    overview ?? 'No overview available',
                    style: const TextStyle(color: Colors.white, height: 1.5),
                  ),
                ),
                const Center(
                  child: Text(
                    "Reviews content here",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Center(
                  child: Text(
                    "Cast content here",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
