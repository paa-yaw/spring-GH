document.onreadystatechange = function(){
  if(window.location.pathname=="/requests/new" || window.location.pathname=="/requests/new" ){
   if(document.readyState === 'complete'){
    document.getElementById("daDays").defaultValue = 1;
  }
 }
}


//makes the price appear in the form one page is loaded.

function placeValue() {
  if (window.location.pathname=="/requests/new" || window.location.pathname=="/requests"){
    document.getElementById("daPrice").innerHTML = "$"+12+".00";
    document.getElementById("daRooms").innerHTML = 4;
    document.getElementById("daDays").innerHTML = "("+getDaysNumber()+")";
  }
// this value is returned when the function is called in calculatePricing.
  return 12;
}

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

// converts value in Number of Days input field to integer and returns value on function call or 1 as default.
function getDaysNumber() {
  var daysNumber = 0;
  var daysNumber = (parseInt(document.getElementById("request_days").value) || 1);
  return daysNumber;
}

function getCheckBoxValue() {
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

function checkDays() {
  var selectedDays = [];
  var checkedDays = getDaysNumber();
  var listOfDays = document.getElementsByName("request[weekdays][]");
  
  if(document.getElementById('request_weekdays_monday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_monday').value);

  } else {
    checkedDays +=0;
  }

  if (document.getElementById('request_weekdays_tuesday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_tuesday').value);
  } else {
    checkedDays += 0;
  }

  if (document.getElementById('request_weekdays_wednesday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_wednesday').value);
  } else {
    checkedDays += 0;
  }

  if (document.getElementById('request_weekdays_thursday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_thursday').value);
  } else {
    checkedDays += 0;
  }
  
  if (document.getElementById('request_weekdays_friday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_friday').value);
  } else {
    checkedDays += 0;
  }
  
  if (document.getElementById('request_weekdays_saturday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_saturday').value);
  } else {
    checkedDays += 0;
  }
    
  if (document.getElementById('request_weekdays_sunday').checked == true) {
    checkedDays -= 1;
    selectedDays.push(document.getElementById('request_weekdays_sunday').value);
  } else {
    checkedDays += 0;
  }
  
  if (checkedDays < 0) {
    alert("You can only choose "+getDaysNumber()+" days");
    for (var i = 0; i < listOfDays.length; i++) {
      listOfDays[i].checked = false;
      selectedDays = [];
    };
  }
  document.getElementById('selectedDays').innerHTML = selectedDays;
  console.log(checkedDays);
  console.log(selectedDays);
}

function getCleaningProduct() {
  var cleaningProduct = 0;
  if(document.getElementsByName('request[provide]')[0].checked == true ) {
    cleaningProduct = 3;
  } else if(document.getElementsByName('request[provide]')[1].checked == true ) {
    cleaningProduct = 0;
  }
  return cleaningProduct;
}

// calculates pricing based on number of rooms.
function calculatePricing() {
  checkDays();
  // if a cleaning product is provided for or 
  var cleanProduct = (getCleaningProduct()*getDaysNumber());
  // extra services multiplying the number of days
  var extra = ((getCheckBoxValue()[0]+getCheckBoxValue()[1]+getCheckBoxValue()[2]+getCheckBoxValue()[3])*getDaysNumber());
  // add up all the rooms.
  var rooms = (getBedroomNumber() + getBathroomNumber() + getKitchenNumber() + getHallNumber());
  document.getElementById("daRooms").innerHTML = rooms;
  if(rooms > 4){
    // if rooms is more than 4 calculate pricing with number of days as a multiple.
    var pricing = (((((rooms-4)*5)+12)*getDaysNumber())+extra+cleanProduct);
    document.getElementById("daPrice").innerHTML = "$"+pricing+".00";
  } else {
    // if rooms is equal to 4 or less use 45 as default and calculate pricing.
    document.getElementById("daPrice").innerHTML = "$"+((placeValue()*(parseInt(getDaysNumber())))+extra+cleanProduct)+".00"; 
  }
}
