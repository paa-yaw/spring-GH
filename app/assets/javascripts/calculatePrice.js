function placeValue(){
  if (window.location.pathname == "/"){
    document.getElementById("daPrice").innerHTML = "Ghc"+0+".00";
  }
}

function calculatePrice(){
  //get selected input fields
  var bedroom = parseInt(document.getElementById("request_bedrooms").value);
  var bathroom = parseInt(document.getElementById("request_bathrooms").value);
  var kitchen = parseInt(document.getElementById("request_kitchens").value);
  var hall = parseInt(document.getElementById("request_hall").value);
  //var days = parseInt(document.getElementById("request_days").value);

  console.log(bedroom, bathroom, kitchen, hall);

  var cost = 0;
  var rooms = 0;

  if(bedroom==1 && bathroom==1 && kitchen==1 && hall==1 ){
    document.getElementById("daPrice").innerHTML = "Ghc"+45+".00";
  }  else if (bedroom >=1 && bathroom >=1 && kitchen >=1 && hall >=1) {
    rooms = (bedroom + bathroom + kitchen + hall);
    console.log(rooms);
    price = (((rooms - 4)*15)+45);
    document.getElementById("daPrice").innerHTML = "Ghc"+price+".00";
  } 
}
