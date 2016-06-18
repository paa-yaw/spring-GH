function checkMonth() {

  for (var j= 1; j <= 7; j++) {
    document.getElementById("request_time_4i").children[j].style.display="none";
  }
  for (var k= 19; k <= 24; k++) {
    document.getElementById("request_time_4i").children[k].style.display="none";
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
    document.getElementById("roomNumber").innerHTML = "One-time";
    dayFrequency = parseFloat(document.getElementById("request_frequency_1500").value);
  } else {
    dayFrequency = 0;
  }
                               
  if (document.getElementById("request_frequency_2000").checked) {
    document.getElementById("roomNumber").innerHTML = "Weekly";
    weekFrequency = parseFloat(document.getElementById("request_frequency_2000").value);
  } else {
    weekFrequency = 0;  
  }

  if (document.getElementById("request_frequency_5000").checked) {
     document.getElementById("roomNumber").innerHTML = "Monthly";
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
    document.getElementById('selectDays').parentNode.style.display = 'none';
  }
  
  var b = document.getElementById('request_frequency_2000');
  if(b.checked == true) {
    document.getElementById('selectDays').parentNode.style.display = 'block';
    schedule.innerHTML = "Schedule " + "&nbsp;<i>(Choose 3 days)</i>";
  }

  var c = document.getElementById('request_frequency_5000');
  if(c.checked == true) {
    document.getElementById('selectDays').parentNode.style.display = 'block';
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
  } else if(getFrequency() == 200.00){
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
  checkSchedule();  

  var roomFactor = 0;
  var totalPrice = 0;

  //case of these four possible conditions: freq 0, freq 150, freq 200, freq 500
  if (getFrequency() == 0 ) {
    var roomFactor = 0;

    var freq = parseInt(getFrequency());

      document.getElementById('packagePrice').innerHTML = "GHS " +freq+".00";

    var extraRoom = (roomTotal() + roomFactor);

      document.getElementById('extraRooms').innerHTML = extraRoom;
      // document.getElementById('roomNumber').innerHTML = "0";

    var extraRoomValue = (roomTotal() + roomFactor);

    var extraRoomPrice = "GHS " + ((extraRoomValue)*5)+".00";

      document.getElementById('extraRoomPrice').innerHTML = extraRoomPrice;
      document.getElementById('navExtraRoomPrice').innerHTML = extraRoomPrice;

    var extraService = getExtraServices();

      document.getElementById('extraServicePrice').innerHTML = "GHS "+extraService+".00";
      document.getElementById('navExtraServicePrice').innerHTML = "GHS "+extraService+".00";

    var totalPrice = ( ( (roomTotal() + roomFactor)*5 ) + getExtraServices() + parseInt(getFrequency()) );
      document.getElementById('PricingValue').innerHTML = "GHS "+totalPrice+".00";
      document.getElementById('navPricingValue').innerHTML = "GHS "+totalPrice+".00";
 
  } else if( getFrequency() == 200.00 || getFrequency() == 150.00 ) {
    var roomFactor = 0;

    var freq = parseInt(getFrequency());

    document.getElementById('packagePrice').innerHTML = "GHS "+freq+".00";

    var extraRoom = (roomTotal() + roomFactor);

      document.getElementById('extraRooms').innerHTML = extraRoom;

    var extraRoomValue = (roomTotal() + roomFactor);

    var extraRoomPrice = "GHS "+((extraRoomValue)*5 )+".00";

      document.getElementById('extraRoomPrice').innerHTML = extraRoomPrice;
      document.getElementById('navExtraRoomPrice').innerHTML = extraRoomPrice;

    var extraService = getExtraServices();

      document.getElementById('extraServicePrice').innerHTML = "GHS "+extraService+".00";
      document.getElementById('navExtraServicePrice').innerHTML = "GHS "+extraService+".00";

    var totalPrice = ( ( (roomTotal() + roomFactor)*5 ) + getExtraServices() + parseInt(getFrequency()) );
      document.getElementById('PricingValue').innerHTML = "GHS "+totalPrice+".00";
      document.getElementById('navPricingValue').innerHTML = "GHS "+totalPrice+".00";

    // var discountPrice = Math.round(totalPrice * promoCode());
    // document.getElementById('navPricingValue').innerHTML ="GHS "+discountPrice+".00";
    //  document.getElementById('DiscountValue').innerHTML = "GHS "+discountPrice+".00";


    // discountPrice = parseInt(totalPrice * discountValue);


 //case of this particular frequency
  } else if (getFrequency() == 500.00) {
    var roomFactor = -8;
    // console.log(roomFactor);

    var freq = parseInt(getFrequency());
     // console.log(freq);
    document.getElementById('packagePrice').innerHTML = "GHS "+freq+".00";

    var extraRoom = (roomTotal() + roomFactor);
    // var extraRoomValue

    if (extraRoom <= 0) {
      var extraRoom = 0;
      var extraRoomPrice = 0;

      document.getElementById('extraRooms').innerHTML = extraRoom;
      document.getElementById('extraRoomPrice').innerHTML = "GHS "+extraRoomPrice+".00";
      document.getElementById('navExtraRoomPrice').innerHTML = "GHS "+extraRoomPrice+".00";
    } else {
      // var extraRoom = (roomTotal() + roomFactor);
      var extraRoomPrice = ((extraRoom)*5 );

      document.getElementById('extraRooms').innerHTML = extraRoom;
      document.getElementById('extraRoomPrice').innerHTML = "GHS "+extraRoomPrice+".00";
      document.getElementById('navExtraRoomPrice').innerHTML = "GHS "+extraRoomPrice+".00";
    }

     var extraService = getExtraServices();
      document.getElementById('extraServicePrice').innerHTML = "GHS "+extraService+".00";
      document.getElementById('navExtraServicePrice').innerHTML = "GHS "+extraService+".00";

    var totalPrice = ( ( (extraRoom)*5 ) + getExtraServices() + parseInt(getFrequency()) );
      document.getElementById('PricingValue').innerHTML = "GHS "+totalPrice+".00";
      document.getElementById('navPricingValue').innerHTML = "GHS "+totalPrice+".00";

    // var discountPrice = Math.round(totalPrice * promoCode());
    //   document.getElementById('navPricingValue').innerHTML = "GHS "+discountPrice+".00";
    //     document.getElementById('DiscountValue').innerHTML = "GHS "+discountPrice+".00";
  } 
}


$(document).ready(function() {
  // checks for current month and adds display:none to previous months
  checkMonth();
  checkSchedule()
});
