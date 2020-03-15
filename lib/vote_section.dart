import 'package:flutter/material.dart';

class VoteSection extends StatefulWidget {
  String name;
  int counter;
  String backgroundUrl;
  VoidCallback onPressed;

  VoteSection(
      {Key key,
      @required this.name,
      @required this.counter,
      @required this.backgroundUrl,
      this.onPressed})
      : super(key: key);

  @override
  _VoteSectionState createState() => _VoteSectionState();
}

class _VoteSectionState extends State<VoteSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("${widget.backgroundUrl}"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${widget.name}',
            style: Theme.of(context).textTheme.headline1,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black, width: 4),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                '${widget.counter}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
          RaisedButton(
            onPressed: widget.onPressed,
            child: Text("Vote for ${widget.name}!"),
          ),
        ],
      ),
    );
  }
}

/*
StreamBuilder(
              stream: Firestore.instance
                  .collection('votes')
                  .document('voteCount')
                  .snapshots(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return CircularProgressIndicator();
                  case ConnectionState.waiting:
                    return CircularProgressIndicator();

                  default:
                    return VoteSection(
                        name: "Cats",
                        counter: _catCounter,
                        backgroundUrl: "assets/cat.jpg",
                        onPressed: () {
                          _incrementCatCounter();
                        });
                }
              },
            ),
*/
