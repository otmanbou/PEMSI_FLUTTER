import 'package:flutter/material.dart';
import 'package:pfaflutter/constants/news.dart';
import 'package:pfaflutter/models/article_model.dart';
class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}
class _NewsScreenState extends State<NewsScreen> {

   List<ArticleModel> articles=<ArticleModel>[];
  bool _loading=true;
  @override
  void initState() {
    super.initState();
     getNews();
  }
  
 getNews() async{
    News newsClass =News();
    await newsClass.getNews();
    articles=newsClass.news;
    setState(() {
      _loading=false;
    });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.transparent,
        title:  Row (
          mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("PEMSI",style: TextStyle(
                    color: Colors.green))  ,
                Text("News"),
              ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:

      _loading ? Center(
        child: CircularProgressIndicator(),
    ) : SingleChildScrollView(


        child: Container(

          child: Column(

            children: <Widget>[
             //Categories

        Container(
          decoration: new BoxDecoration(
              color: Colors.lightGreenAccent
          ),
          child:
            ListView.builder(
                 itemCount: articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder:(context,index){
                  return BlogTile(
                    img:articles[index].img,
                    desc: articles[index].description,
                    title: articles[index].title,

                  );
                }),
           )
            ],
          ),
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  final String desc,img,title;
  BlogTile({required this.desc,required this.img,required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Colors.lightGreenAccent,),
      margin: EdgeInsets.only(bottom:10 ,top:  10),
      child:

      Column(
        children: <Widget>[

          Text(
            title,textAlign: TextAlign.center, style: TextStyle(
            color: Colors.green,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),),
          SizedBox(
             height: 8,
          ),


          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child:
            Image.network(
              img,
              width: 300, height:300, fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            desc,textAlign:TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
          ),

        ],
     ),
    );
  }
}


