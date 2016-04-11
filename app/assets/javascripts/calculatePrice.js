
// converts value in the bedroom dropdown to integer and returns value on function call
function getBedroomNumber() {
  var bedroomNumber = 0;
  var bedroomNumber = parseInt(document.getElementById("request_bedrooms").value);
  return bedroomNumber;
}

// converts value in the bathroom dropdown to integer and returns value on function call
function getBathroomNumber() {
  var bathroomNumber = 0;
  var bathroomNumber = parseInt(document.getElementById("request_bathrooms").value);
  return bathroomNumber;
}

// converts value in the kitchen dropdown to integer and returns value on function call
function getKitchenNumber() {
  var kitchenNumber = 0;
  var kitchenNumber = parseInt(document.getElementById("request_kitchens").value);
  return kitchenNumber;
}

// converts value in the Hall dropdown to integer and returns value on function call
function getHallNumber() {
  var hallNumber = 0;
  var hallNumber = parseInt(document.getElementById("request_hall").value);
  return hallNumber;
}

function getRoomNumber() {
  var rooms = (getBedroomNumber() + getBathroomNumber() + getKitchenNumber() + getHallNumber());
  if (rooms > 4){
    var extraRooms = parseInt(rooms-4);
    // console.log(extraRooms);
  } else {
    var extraRooms = 0;
  }
    return extraRooms;
}


function getLargeRoomNumber() {
 var rooms = (getBedroomNumber() + getBathroomNumber() + getKitchenNumber() + getHallNumber());
 if (rooms > 8) {
   var extraLargeRooms = parseInt(rooms - 8);
   // console.log(extraLargeRooms);
 } else {
  var extraLargeRooms = 0;
 }
 return extraLargeRooms;
}


function getExtraServices(){
  var extraServices = [0,0,0];

  if (document.getElementById('request_extra_services_150').checked) {
    extraServices[0] = 15;
  } else {
    extraServices[0] = 0;
  }

  if (document.getElementById('request_extra_services_1001').checked) {
    extraServices[1] = 10;
  } else {
    extraServices[1] = 0;
  }

  if (document.getElementById('request_extra_services_100').checked) {
    extraServices[2] = 10;
  } else {
    extraServices[2] = 0;
  }

  var extraServiceTotal = parseInt(extraServices[0] + extraServices[1] + extraServices[2]);
  return extraServiceTotal;
}

function getFrequency(){
  // document.getElementById('request_frequency_60').checked = true;
  var dayFrequency = 0;
  var weekFrequency = 0;
  var monthFrequency = 0;

  if (document.getElementById("request_frequency_60").checked) {
    dayFrequency = parseInt(document.getElementById("request_frequency_60").value);
  } else {
    dayFrequency = 0;
  }

  if (document.getElementById("request_frequency_150").checked) {
    weekFrequency = parseInt(document.getElementById("request_frequency_150").value);
  } else {
    weekFrequency = 0;  
  }

  if (document.getElementById("request_frequency_500").checked) {
     document.getElementById("roomNumber").innerHTML = 8;
     monthFrequency = parseInt(document.getElementById("request_frequency_500").value);
  } else {
     monthFrequency = 0;
  }

  var totalFrequency = (dayFrequency + weekFrequency + monthFrequency);
    return totalFrequency;
}


// function checkDays() {
//   var checkedDays = 3;
//   var listOfDays = document.getElementsByName("request_weekdays");
  
//   if(document.getElementById('request_weekdays_monday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays +=0;
//   }

//   if (document.getElementById('request_weekdays_tuesday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays += 0;
//   }

//   if (document.getElementById('request_weekdays_wednesday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays += 0;
//   }

//   if (document.getElementById('request_weekdays_thursday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays += 0;
//   }
  
//   if (document.getElementById('request_weekdays_friday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays += 0;
//   }
  
//   if (document.getElementById('request_weekdays_saturday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays += 0;
//   }
    
//   if (document.getElementById('request_weekdays_sunday').checked == true) {
//     checkedDays -= 1;
//   } else {
//     checkedDays += 0;
//   }
  
//   if (checkedDays < 0) {
//     alert("You can only choose 3 days");
//     for (var i = 0; i < listOfDays.length; i++) {
//       listOfDays[i].checked = false;
//     };
//   }
//   console.log(checkedDays);
// }
function calculateTotal(){
  var total = getRoomNumber()*5 + getExtraServices(); 
  total = total + (60 || getFrequency());
  document.getElementById("PricingValue").innerHTML = "GHc "+total+".00";
}

// calculates pricing based on number of rooms.

function calculatePricing() {
  document.getElementById("PricingValue").innerHTML = "GHc "+total+".00";
  // checkDays();
  getLargeRoomNumber();
  getRoomNumber();
  getExtraServices();
  getFrequency();
  calculateTotal();
  
  document.getElementById('packagePrice').innerHTML = "GHc "+(60 || getFrequency())+".00";
  document.getElementById('extraServicePrice').innerHTML = "GHc "+getExtraServices()+".00";


  if (getFrequency() == 500) {
    document.getElementById("extraRooms").innerHTML =( 0 || getLargeRoomNumber() );
    document.getElementById("packagePrice").innerHTML = "GHc "+( 500|| getFrequency())+".00";
  } else {
    document.getElementById("extraRooms").innerHTML =( 0 || getRoomNumber() );
  }
   
  if (getFrequency() == 500) {
    document.getElementById("extraRoomPrice").innerHTML = "GHc "+getLargeRoomNumber()*5+".00";
  } else{
    document.getElementById("extraRoomPrice").innerHTML = "GHc "+getRoomNumber()*5+".00";
  }

  if (getFrequency() == 60){
    document.getElementById("roomNumber").innerHTML = 4;
    var total = 60 + getRoomNumber()*5 + getExtraServices(); 
    // console.log(total);
    document.getElementById("PricingValue").innerHTML = "GHc "+total+".00";
  }
  else if (getFrequency() == 150) {
    document.getElementById("packagePrice").innerHTML = "GHc "+( 150|| getFrequency())+".00";
    document.getElementById("roomNumber").innerHTML = 4;
    var total = 150 + getRoomNumber()*5 + getExtraServices();
    // console.log(total);
    document.getElementById("PricingValue").innerHTML = "GHc "+total+".00";
  }
  else if (getFrequency() == 500) {
    var rooms = (getBedroomNumber() + getBathroomNumber() + getKitchenNumber() + getHallNumber());

    var total = 500 + getLargeRoomNumber()*5 + getExtraServices();
    // console.log(total);
    document.getElementById("PricingValue").innerHTML = "GHc "+total+".00";
  }

}
