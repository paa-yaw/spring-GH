//makes the price appear in the form one page is loaded.
function placeValue(){
  if (window.location.pathname == "/" || window.location.pathname == "/requests"){
    document.getElementById("daPrice").innerHTML = "$"+12+".00";
  }
// this value is returned when the function is called in calculatePricing.
  return 12;
}


// converts value in the bedroom dropdown to integer and returns value on function call
function getBedroomNumber(){
  var bedroomNumber = 0;
  var bedroomNumber = parseInt(document.getElementById("request_bedrooms").value);
  return bedroomNumber;
}

// converts value in the bathroom dropdown to integer and returns value on function call
function getBathroomNumber(){
  var bathroomNumber = 0;
  var bathroomNumber = parseInt(document.getElementById("request_bathrooms").value);
  return bathroomNumber;
}

// converts value in the kitchen dropdown to integer and returns value on function call
function getKitchenNumber(){
  var kitchenNumber = 0;
  var kitchenNumber = parseInt(document.getElementById("request_kitchens").value);
  return kitchenNumber;
}

// converts value in the Hall dropdown to integer and returns value on function call
function getHallNumber(){
  var hallNumber = 0;
  var hallNumber = parseInt(document.getElementById("request_hall").value);
  return hallNumber;
}

// converts value in Number of Days input field to integer and returns value on function call or 1 as default.
function getDaysNumber(){
  var daysNumber = 0;
  var daysNumber = (parseInt(document.getElementById("request_days").value) || 1);
  console.log(daysNumber);
  return daysNumber;
}


function getCheckBoxValue(){
  //declare an array to store values
  var extraServices = [0,0,0,0];
  
  // if checkbox is clicked assign its value to first array position [0] else assign 0
  if (document.getElementById('request_extra_services_8').checked == true) {
    extraServices[0] = parseInt(document.getElementById('request_extra_services_8').value);
  }
  else {
    extraServices[0] = 0;
  }

  if(document.getElementById('request_extra_services_7').checked == true) {
    extraServices[1] = parseInt(document.getElementById('request_extra_services_7').value);
  }
  else {
    extraServices[1] = 0;
  }

  if (document.getElementById('request_extra_services_3').checked == true) {
    extraServices[2] = parseInt(document.getElementById('request_extra_services_3').value);
  }
  else {
    extraServices[2] = 0;
  }

  if (document.getElementById('request_extra_services_5').checked == true) {
    extraServices[3] = parseInt(document.getElementById('request_extra_services_5').value);
  }
  else {
    extraServices[3] = 0;
  }

  return extraServices;
}


// calculates pricing based on number of rooms.
function calculatePricing(){
  // add up all the rooms.
  var extra = ((getCheckBoxValue()[0]+getCheckBoxValue()[1]+getCheckBoxValue()[2]+getCheckBoxValue()[3])*getDaysNumber());
  console.log(extra);
  var rooms = (getBedroomNumber() + getBathroomNumber() + getKitchenNumber() + getHallNumber());
  if(rooms > 4){
    // if rooms is more than 4 calculate pricing with number of days as a multiple.
    var pricing = (((((rooms-4)*5)+12)*getDaysNumber())+extra);
    document.getElementById("daPrice").innerHTML = "$"+pricing+".00";
  } else {
    // if rooms is equal to 4 or less use 45 as default and calculate pricing.
    document.getElementById("daPrice").innerHTML = "$"+((placeValue()*(parseInt(getDaysNumber())))+extra)+".00"; 
  }
}


// calculates the price as the user selects options.
// function calculatePrice(){
//   //get selected input fields
  
//   var bedroom = parseInt(document.getElementById("request_bedrooms").value);
//   var bathroom = parseInt(document.getElementById("request_bathrooms").value);
//   var kitchen = parseInt(document.getElementById("request_kitchens").value);
//   var hall = parseInt(document.getElementById("request_hall").value);

//   console.log(bedroom, bathroom, kitchen, hall, days);

//   var cost = 0;
//   var rooms = 0;
//   var days = getNumberOfDays();

//   // calculate the price based on chosen user input.
//   if(bedroom==1 && bathroom==1 && kitchen==1 && hall==1 ) {
//     document.getElementById("daPrice").innerHTML = "Ghc"+45+".00";
//   }
//   //   else if (bedroom >=1 && bathroom >=1 && kitchen >=1 && hall >=1) {
//   //   rooms = (bedroom + bathroom + kitchen + hall);
//   //   price = (((rooms - 4)*15)+45);
//   //   document.getElementById("daPrice").innerHTML = "Ghc"+price+".00";
//   // } 
//   else if(bedroom >=1 && bathroom >=1 && kitchen >=1 && hall >=1 && days >=1) {
//     rooms = (bedroom + bathroom + kitchen + hall);
//     price = ((((rooms - 4)*15)*days)+45);
//     console.log(price);
//     document.getElementById("daPrice").innerHTML = "Ghc"+price+".00";
//   }

// }

// trying to get value from the number of days input field.. argh!