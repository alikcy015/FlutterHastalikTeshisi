import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Eczema extends StatefulWidget {
  const Eczema({super.key});

  @override
  State<Eczema> createState() => _EczemaState();
}

class _EczemaState extends State<Eczema> {
  var hastalikbilgisi = "";

  var hastalikbasligi = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text(' ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[3]['başlık']),
              Text(snapshot.data!.docs[3]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

/////////////////////////////////////////////////////
class Melanoma extends StatefulWidget {
  const Melanoma({super.key});

  @override
  State<Melanoma> createState() => _MelanomaState();
}

class _MelanomaState extends State<Melanoma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[5]['başlık']),
              Text(snapshot.data!.docs[5]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

/////////////////////////////////////////
class Basal_cell_Carcinoma extends StatefulWidget {
  const Basal_cell_Carcinoma({super.key});

  @override
  State<Basal_cell_Carcinoma> createState() => _Basal_cell_CarcinomaState();
}

class _Basal_cell_CarcinomaState extends State<Basal_cell_Carcinoma> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[2]['başlık']),
              Text(snapshot.data!.docs[2]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

//////////////////////////////////////
class Atopik_Dermatit extends StatefulWidget {
  const Atopik_Dermatit({super.key});

  @override
  State<Atopik_Dermatit> createState() => _Atopik_DermatitState();
}

class _Atopik_DermatitState extends State<Atopik_Dermatit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[1]['başlık']),
              Text(snapshot.data!.docs[1]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

/////////////////////////////////////////

class Melanocytic extends StatefulWidget {
  const Melanocytic({super.key});

  @override
  State<Melanocytic> createState() => _MelanocyticState();
}

class _MelanocyticState extends State<Melanocytic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[4]['başlık']),
              Text(snapshot.data!.docs[4]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

////////////////////////////////////////////////
class Benign_Keratosis extends StatefulWidget {
  const Benign_Keratosis({super.key});

  @override
  State<Benign_Keratosis> createState() => _Benign_KeratosisState();
}

class _Benign_KeratosisState extends State<Benign_Keratosis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[0]['başlık']),
              Text(snapshot.data!.docs[0]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

//////////////////////////////////////////////
class Psoriasis extends StatefulWidget {
  const Psoriasis({super.key});

  @override
  State<Psoriasis> createState() => _PsoriasisState();
}

class _PsoriasisState extends State<Psoriasis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[6]['başlık']),
              Text(snapshot.data!.docs[6]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

////////////////////////////////
class Seborrheic extends StatefulWidget {
  const Seborrheic({super.key});

  @override
  State<Seborrheic> createState() => _SeborrheicState();
}

class _SeborrheicState extends State<Seborrheic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[7]['başlık']),
              Text(snapshot.data!.docs[7]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

//////////////////////////////
class Tinea extends StatefulWidget {
  const Tinea({super.key});

  @override
  State<Tinea> createState() => _TineaState();
}

class _TineaState extends State<Tinea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[8]['başlık']),
              Text(snapshot.data!.docs[8]['içerik'])
            ],
          );
        },
      ),
    );
  }
}

//////////////////////////////
class Warts extends StatefulWidget {
  const Warts({super.key});

  @override
  State<Warts> createState() => _WartsState();
}

class _WartsState extends State<Warts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('HastalikBilgisi')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Loading ');
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(snapshot.data!.docs[9]['başlık']),
              Text(snapshot.data!.docs[9]['içerik'])
            ],
          );
        },
      ),
    );
  }
}
