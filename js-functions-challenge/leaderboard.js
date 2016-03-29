var gameInfo = function(){
  return [
   {
     home_team: "Patriots",
     away_team: "Broncos",
     home_score: 7,
     away_score: 3
   },
   {
     home_team: "Broncos",
     away_team: "Colts",
     home_score: 3,
     away_score: 0
   },
   {
     home_team: "Patriots",
     away_team: "Colts",
     home_score: 11,
     away_score: 7
   },
   {
     home_team: "Steelers",
     away_team: "Patriots",
     home_score: 7,
     away_score: 21
   }
 ]
}

games = gameInfo();
var Team = function(name){
  this.name = name;
  this.rank = undefined,
  this.wins = 0,
  this.losses = 0
};

var leaderboard = [] //array of team objects
  //team objects have name, rank, wins, losses
var teams = []
var teamArray = function(arr) {
  for (var i = 0; i < arr.length; i++) {
    var home_team = arr[i].home_team;
    var away_team = arr[i].away_team;

    if (teams.indexOf(home_team) < 0) {
      teams.push((home_team));
    }
    if (teams.indexOf(away_team) < 0) {
      teams.push((away_team));
    }
  }
};

var teamObjArr = []
var teamObjects = function(arr) {
  for (var i = 0; i < arr.length; i++){
    teamObjArr.push(new Team(arr[i]))
  }
};

teamArray(games);
teamObjects(teams);

var tally = function(arr) {
  for (var i = 0; i < arr.length; i++) {
    var home_score = arr[i].home_score;
    var away_score = arr[i].away_score;
    debugger
    if (home_score > away_score) {
      var win_index = teams.indexOf(arr[i].home_team)
      var lose_index = teams.indexOf(arr[i].away_team)
      debugger
      teamObjArr[win_index].wins += 1
      teamObjArr[lose_index].losses += 1
    }
    else {
      var win_index = teams.indexOf(arr[i].away_team)
      var lose_index = teams.indexOf(arr[i].home_team)
      debugger
      teamObjArr[win_index].wins += 1
      teamObjArr[lose_index].losses += 1
    }
  }
};
var assignRank = function(arr) {
  for (var i = 0; i < arr.length; i++) {
    arr[i].rank = i + 1
  }
};


tally(games);

teamObjArr.sort(function(a, b) {
  return b.wins - a.wins
});

assignRank(teamObjArr);

console.log(teamObjArr);
