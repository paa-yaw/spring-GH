function checkMonth() {
  var d = new Date();

  var month = d.getMonth();
  var hour = d.getHours();

  for (var i = 1; i <= month; i++) {
    document.getElementById("request_date_time_2i").children[(i-1)].style.display="none";
  }

  if (document.getElementById("request_date_time_2i").value == (d.getMonth()+1)) {
    for (var j= 1; j <= d.getDate(); j++) {
      document.getElementById("request_date_time_3i").children[(j-1)].style.display="none";
    }
  } else {
    for( var j = 1; j <= d.getDate(); j++) {
      document.getElementById("request_date_time_3i").children[(j-1)].style.display="block";
    }
  }
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

// get extra services
function getExtraServices(){
  var extraServices = [0,0,0,0];

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

  if (document.getElementById('request_extra_services_400').checked) {
    extraServices[3] = 40;
  } else {
    extraServices[3] = 0;
  }

  var extraServiceTotal = parseInt(extraServices[0] + extraServices[1] + extraServices[2] + extraServices[3]);
  return extraServiceTotal;
}


function getFrequency(){
  // document.getElementById('request_frequency_60').checked = true;
  var dayFrequency = 0;
  var weekFrequency = 0;
  var monthFrequency = 0;

  if (document.getElementById("request_frequency_1500").checked) {
    document.getElementById("roomNumber").innerHTML = 4;
    dayFrequency = parseFloat(document.getElementById("request_frequency_1500").value);
  } else {
    dayFrequency = 0;
  }
                               
  if (document.getElementById("request_frequency_15001").checked) {
    document.getElementById("roomNumber").innerHTML = 4;
    weekFrequency = parseFloat(document.getElementById("request_frequency_15001").value);
  } else {
    weekFrequency = 0;  
  }

  if (document.getElementById("request_frequency_5000").checked) {
     document.getElementById("roomNumber").innerHTML = 8;
     monthFrequency = parseFloat(document.getElementById("request_frequency_5000").value);
  } else {
     monthFrequency = 0;
  }

  var totalFrequency = (dayFrequency + weekFrequency + monthFrequency);
    return totalFrequency;
}

function roomTotal() {
  var roomTotal = (getBedroomNumber() + getBathroomNumber() + getKitchenNumber() + getHallNumber());
  // console.log(roomTotal);
  return roomTotal;
}

function checkSchedule() {
  var schedule = document.querySelectorAll("#days > div > .request_weekdays > label")[0];

  var a = document.getElementById('request_frequency_1500');
  if(a.checked == true) {
    // schedule.innerHTML = "Schedule " + "&nbsp;<i>(Choose a day)</i>";
    document.getElementById('days').parentNode.style.display = 'none';
  }
  
  var b = document.getElementById('request_frequency_15001');
  if(b.checked == true) {
    document.getElementById('days').parentNode.style.display = 'block';
    schedule.innerHTML = "Schedule " + "&nbsp;<i>(Choose 3 days)</i>";
  }

  var c = document.getElementById('request_frequency_5000');
  if(c.checked == true) {
    document.getElementById('days').parentNode.style.display = 'block';
    schedule.innerHTML = "Schedule " + "&nbsp;<i>(Choose 3 days. The 3 days selected is repetitive throughout the month.)</i>";
  }
}

function checkDays() {
  var checkedDays;
  var limit;

  // getFrequency();
  if (getFrequency() == 150.0){
    checkedDays = 1;
    limit = checkedDays;
  } else if(getFrequency() == 150.01){
    checkedDays = 3;
    limit = checkedDays;
  } else if (getFrequency() == 500.00 ) {
    checkedDays = 3;
    limit = checkedDays;
  }

  var listOfDays = document.getElementsByName("request[weekdays][]");

  if(document.getElementById('request_weekdays_monday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }

  if (document.getElementById('request_weekdays_tuesday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }

  if (document.getElementById('request_weekdays_wednesday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }

  if (document.getElementById('request_weekdays_thursday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }
  
  if (document.getElementById('request_weekdays_friday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }
  
  if (document.getElementById('request_weekdays_saturday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }
    
  if (document.getElementById('request_weekdays_sunday').checked == true) {
    checkedDays -= 1;
  } else {
    checkedDays += 0;
  }
  
  if (checkedDays < 0) {
    alert("You can only choose "+limit+" day(s)");
    for (var i = 0; i < listOfDays.length; i++) {
      listOfDays[i].checked = false;
    };
  }
}


function calculatePricing() {
  checkDays();
  checkMonth();
  checkSchedule();  

  var roomFactor = 0;
  var totalPrice = 0;

  if(getFrequency() == 150.01) {
    var roomFactor = -4;
  } else if (getFrequency() == 500.00) {
    var roomFactor = -8;
  } else {
    var roomFactor = -4;
  }

  var freq = parseInt(getFrequency());
    document.getElementById('packagePrice').innerHTML = "GHc "+freq+".00";

  var extraRoom = (roomTotal() + roomFactor);
    document.getElementById('extraRooms').innerHTML = extraRoom;

  var extraRoomPrice = "GHc "+((roomTotal() + roomFactor)*5 )+".00";
    document.getElementById('extraRoomPrice').innerHTML = extraRoomPrice;

  var extraService = getExtraServices();
    document.getElementById('extraServicePrice').innerHTML = "GHc "+extraService+".00";

  var totalPrice = ( ( (roomTotal() + roomFactor)*5 ) + getExtraServices() + parseInt(getFrequency()) );
    document.getElementById('PricingValue').innerHTML = "GHc "+totalPrice+".00";

  return totalPrice;
}


$(document).ready(function() {
  // checks for current month and adds display:none to previous months
  checkMonth();
});
