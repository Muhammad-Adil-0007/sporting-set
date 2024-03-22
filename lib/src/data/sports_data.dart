class Match {
  final String team1;
  final String team2;
  final String time;
  final double odd1;
  final double oddX;
  final double odd2;
  final int? team1Goal;
  final int? team2Goal;
  final int? possession;
  final int? shots;
  final int? onTarget;
  final int? scr;
  final int? corners;
  final int? ins;
  final int? saves;
  final int? possession2; // New field
  final int? shots2; // New field
  final int? onTarget2; // New field
  final int? scr2; // New field
  final int? corners2; // New field
  final int? ins2; // New field
  final int? saves2; // New field
  final String? status;
  late final bool? odd;

  Match({
    required this.team1,
    required this.team2,
    required this.time,
    required this.odd1,
    required this.oddX,
    required this.odd2,
    this.team1Goal,
    this.team2Goal,
    this.possession,
    this.shots,
    this.onTarget,
    this.scr,
    this.corners,
    this.ins,
    this.saves,
    this.possession2,
    this.shots2,
    this.onTarget2,
    this.scr2,
    this.corners2,
    this.ins2,
    this.saves2,
    this.status,
    this.odd,
  });

  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      team1: map['team1'],
      team2: map['team2'],
      time: map['time'],
      odd1: map['odd1'].toDouble(),
      oddX: map['oddX'].toDouble(),
      odd2: map['odd2'].toDouble(),
      team1Goal: map['team1goal'],
      team2Goal: map['team2goal'],
      possession: map['possession'],
      shots: map['shots'],
      onTarget: map['ontarget'],
      scr: map['scr'],
      corners: map['corners'],
      ins: map['ins'],
      saves: map['saves'],
      possession2: map['possession2'],
      shots2: map['shots2'],
      onTarget2: map['ontarget2'],
      scr2: map['scr2'],
      corners2: map['corners2'],
      ins2: map['ins2'],
      saves2: map['saves2'],
      status: map['status'] ?? 'draw',
      odd: map['odd'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team1': team1,
      'team2': team2,
      'time': time,
      'odd1': odd1,
      'oddX': oddX,
      'odd2': odd2,
      'team1goal': team1Goal,
      'team2goal': team2Goal,
      'possession': possession,
      'shots': shots,
      'ontarget': onTarget,
      'scr': scr,
      'corners': corners,
      'ins': ins,
      'saves': saves,
      'possession2': possession2,
      'shots2': shots2,
      'ontarget2': onTarget2,
      'scr2': scr2,
      'corners2': corners2,
      'ins2': ins2,
      'saves2': saves2,
      'status': status,
      'odd': odd,
    };
  }
}

List<Match> footballData = [
  Match(
    team1: 'Manchester United',
    team2: 'Liverpool',
    time: '19:20',
    odd1: 2.1,
    oddX: 2.4,
    odd2: 2.3,
    team1Goal: 1,
    team2Goal: 2,
    possession: 55,
    shots: 10,
    onTarget: 5,
    scr: 1,
    corners: 7,
    ins: 3,
    saves: 3,
    status: 'lose',
    odd: true,
    // New values
    possession2: 60,
    shots2: 12,
    onTarget2: 6,
    scr2: 0,
    corners2: 5,
    ins2: 2,
    saves2: 4,
  ),
  Match(
    team1: 'Barcelona',
    team2: 'Real Madrid',
    time: '18:45',
    odd1: 1.9,
    oddX: 2.6,
    odd2: 2.5,
    team1Goal: 2,
    team2Goal: 2,
    possession: 60,
    shots: 15,
    onTarget: 8,
    scr: 2,
    corners: 8,
    ins: 4,
    saves: 2,
    status: 'draw',
    odd: false,
    // New values
    possession2: 55,
    shots2: 14,
    onTarget2: 9,
    scr2: 3,
    corners2: 9,
    ins2: 5,
    saves2: 5,
  ),
  Match(
    team1: 'Arsenal',
    team2: 'Chelsea',
    time: '20:00',
    odd1: 2.2,
    oddX: 2.5,
    odd2: 2.4,
    team1Goal: 0,
    team2Goal: 1,
    possession: 50,
    shots: 12,
    onTarget: 6,
    scr: 0,
    corners: 5,
    ins: 2,
    saves: 4,
    status: 'lose',
    odd: true,
    // New values
    possession2: 52,
    shots2: 10,
    onTarget2: 4,
    scr2: 1,
    corners2: 6,
    ins2: 3,
    saves2: 2,
  ),
  Match(
    team1: 'Paris Saint-Germain',
    team2: 'Bayern Munich',
    time: '21:15',
    odd1: 2.5,
    oddX: 2.7,
    odd2: 2.2,
    team1Goal: 3,
    team2Goal: 2,
    possession: 58,
    shots: 14,
    onTarget: 9,
    scr: 3,
    corners: 9,
    ins: 5,
    saves: 5,
    status: 'win',
    odd: true,
    // New values
    possession2: 65,
    shots2: 16,
    onTarget2: 11,
    scr2: 4,
    corners2: 10,
    ins2: 6,
    saves2: 6,
  ),
  Match(
    team1: 'Juventus',
    team2: 'AC Milan',
    time: '20:30',
    odd1: 2.0,
    oddX: 2.8,
    odd2: 2.6,
    team1Goal: 2,
    team2Goal: 1,
    possession: 53,
    shots: 13,
    onTarget: 7,
    scr: 2,
    corners: 6,
    ins: 3,
    saves: 3,
    status: 'win',
    odd: false,
    possession2: 55,
    shots2: 14,
    onTarget2: 8,
    scr2: 2,
    corners2: 7,
    ins2: 4,
    saves2: 4,
  ),

];



List<Match> hockeyData = [
  Match(
    team1: 'Chicago Blackhawks',
    team2: 'Boston Bruins',
    time: '20:15',
    odd1: 1.8,
    oddX: 3.0,
    odd2: 2.2,
    team1Goal: 2,
    team2Goal: 3,
    possession: 45,
    shots: 8,
    onTarget: 4,
    scr: 2,
    corners: 3,
    ins: 1,
    saves: 6,
    status: 'lose',
    odd: true,
  ),
  // ... (other hockey matches)
];

List<Match> basketballData = [
  Match(
    team1: 'Los Angeles Lakers',
    team2: 'Golden State Warriors',
    time: '21:00',
    odd1: 1.7,
    oddX: 3.1,
    odd2: 2.0,
    team1Goal: 110,
    team2Goal: 105,
    possession: 52,
    shots: 40,
    onTarget: 25,
    scr: 5,
    corners: 3,
    ins: 15,
    saves: 2,
    status: 'win',
    odd: true,
  ),
];
