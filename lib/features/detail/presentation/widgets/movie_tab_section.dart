import 'package:flutter/material.dart';

class MovieTabSection extends StatelessWidget {
  const MovieTabSection({super.key});

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
            child: const TabBarView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.",
                    style: TextStyle(color: Colors.white, height: 1.5),
                  ),
                ),
                Center(
                  child: Text(
                    "Reviews content here",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Center(
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
