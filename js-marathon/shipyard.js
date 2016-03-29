//YOUR CODE GOES HERE

var crewNames = ["john", 'ashley', 'evan', 'candace', 'mike', 'chelsea', 'carrie', 'filipe', 'kamille', 'scotty mac'];
var trainCrew = function(arr){
  var result = [];
  for (i = 0; i < arr.length; i++){
    result.push({ name: arr[i] });
  }
  return result;
}

var crewMembers = trainCrew(crewNames);

var ship = {
  name: "Shippy",
  crew: [],
  loadCrew: function(crewMembers) {
    for (var i = 0; i < crewMembers.length; i++) {
      member = crewMembers[i];
      ship.crew.push(member);
      console.log(member.name + " is aboard the ship!");
    }
  },
  captain: function() {
    var number = this.crew.length;
    var random_number = Math.floor(Math.random() * number);
    return this.crew[random_number];
  },
  propulsion: null,
  mountPropulsion: function(obj) {
    this.propulsion = obj;
    console.log(this.name + "'s engines were mounted!");
  },
  takeoff: function() {
    if(this.propulsion == null) {
      console.log("Captain! There's no engine on this thing!")
    } else if (this.propulsion.fire()){
      console.log("ROARRRRRRRR OF THE ENGINNNNNNESSSSS!!!!!!!!!!!!!!one!");
    } else {
      console.log("Engines didn't fire. Did we fuel it up?  Captain? Captain..?");
    }
  },
  fuelShip: function(fuelAmt) {
    this.propulsion.fuel += fuelAmt;
    console.log(fuelAmt + " units have been added!!!!!!!!!!!!!!!!!!!(Chelsea's happy!!!!)");
  }
};

var rocket = {
  fuel: 0,
  fire: function() {
    if (this.fuel > 0) {
      this.fuel--;
      console.log('The engines have been fired!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      return true;
    } else {
      console.log('The engines failed to fire :((((((((((((((()))))))))))))))');
      return false;
    }
  }
}


var countdown = function(int, callback){

  if ( int === 0 ) {
    console.log("Blastoff!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    callback.takeoff();
  } else {
    setTimeout(function(){
      console.log(int);
    }, 1000);
  }
}

var launchpad = function(ship, crew, rocket) {
  console.log("Prepare for liftoff!!!");
  console.log(ship.name + " is ready for takeoff!!1one!");
  ship.loadCrew(crew);
  console.log("The captain is " + ship.captain().name + ", watch out!!");
  ship.mountPropulsion(rocket);
  ship.fuelShip(9001);
  countdown(10, ship);
  };

launchpad(ship, crewMembers, rocket);
