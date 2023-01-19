//slider

$(document).ready(function(){
    $('.slider').slick({
        centerMode: true,
        centerPadding: '0px',
        slidesToShow: 1,
        autoplay: true,
        autoplaySpeed: 5000,
        dots: false,
        arrows: false
    });
});

//filters

function search() {
    // Declare variables
    var input, filter, i, txtValue1, txtValue2, cards, brand, name;
    input = document.getElementById('search');
    filter = input.value.toUpperCase();
    cards = document.querySelectorAll(".offer .col-xs-12");

    // Loop through all list items, and hide those who don't match the search query
    for (i = 0; i < cards.length; i++) {
        brand = cards[i].querySelector(".card form").children[1];
        name = cards[i].querySelector(".card form").children[2];
        txtValue1 = brand.textContent || brand.innerText;
        txtValue2 = name.textContent || name.innerText;
        if (txtValue1.toUpperCase().indexOf(filter) > -1 || txtValue2.toUpperCase().indexOf(filter) > -1) {
            cards[i].style.display = "block";
        } else {
            cards[i].style.display = "none";
        }
    }
}

var buttons = document.querySelectorAll('li button');
var cards = document.querySelectorAll('.offer .row .col-xs-12'); 

for (let i = 0; i < buttons.length; i++){
    buttons[i].addEventListener('click', () =>{
        for(let j = 0; j < buttons.length; j++){
            buttons[j].classList.remove("btn--active");
        }
        buttons[i].classList.add("btn--active");
        if(buttons[i].id === "Leasing"){
            
            for(let k = 0; k < cards.length; k++){
                
                cards[k].classList.remove("card--selected");
                if(cards[k].children[0].id == "Leasing"){
//                console.log("dupa");
                    cards[k].classList.add("card--selected");
                }
            }
        }
        else if(buttons[i].id === "Kupno"){
            for(let k = 0; k < cards.length; k++){
                cards[k].classList.remove("card--selected");
                if(cards[k].children[0].id == "Kupno"){
                    cards[k].classList.add("card--selected");
                }
            }
        }        
        else if(buttons[i].id === "Wypozyczenie"){
            for(let k = 0; k < cards.length; k++){
                cards[k].classList.remove("card--selected");
                if(cards[k].children[0].id == "Wypozyczenie"){
                    cards[k].classList.add("card--selected");
                }
            }
        }        
        else if(buttons[i].id === "all"){
            for(let k = 0; k < cards.length; k++){
                cards[k].classList.add("card--selected");
            }
        }
    });
}

//calculator
let offerType = document.querySelector(".singleOffer .offercheck");
offerType = offerType.innerHTML.substring(15, offerType.innerHTML.length);
var price = document.querySelector(".offerPrice");
var carValue = document.querySelector("#carPrice").innerHTML;
var submit = document.querySelector("form #order");
var alert = document.querySelector(".alert");
var form = document.querySelector("form");
var cost = document.querySelector("#cost");

//prevent enter submiting 

form.addEventListener('keypress', function(event) {
    if (event.keyCode == 13) {
        event.preventDefault();
    }
});

// months check
if(offerType == 'Leasing'){

months.addEventListener('change', ()=>{
    var months = document.querySelector("#months");

    if(months.value < 37 && months.value > 11){
        var x = parseInt(carValue.substring(5, carValue.length - 2));
        x = x + (x / 20);
        var y = x / months.value;
        months.style.borderColor = 'green';
        alert.style.display = 'none';
        submit.style.pointerEvents = 'all';
        price.style.display = 'block';
        price.innerHTML = 'Cena: ' + Math.ceil(y * 100) / 100 + "zł/msc"; 
        cost.value = x; 
    }
    else{
        months.style.borderColor = 'red';
        alert.style.display = 'block';
        alert.innerHTML = 'Ustal liczbę miesięcy od 12 do 36!';
        price.style.display = 'none'; 
        submit.style.pointerEvents = 'none';
    }
});
}

//days check

if(offerType == 'Wypożyczenie'){
    var days = document.querySelector("#days");

    days.addEventListener('change', ()=>{
    if(days.value < 31 && days.value > 0){
        var x = parseInt(carValue.substring(5, carValue.length - 7));
        var y = x * days.value;
        days.style.borderColor = 'green';
        alert.style.display = 'none';
        submit.style.pointerEvents = 'all';
        price.style.display = 'block';
        price.innerHTML = 'Cena: ' + Math.ceil(y * 100) / 100 + "zł"; 
        cost.value = y; 
    }
    else{
        days.style.borderColor = 'red';
        alert.style.display = 'block';
        alert.innerHTML = 'Ustal liczbę dni od 1 do 30!';
        price.style.display = 'none'; 
        submit.style.pointerEvents = 'none';
    }
});
}

//buy check

if(offerType == 'Kupno'){
    submit.style.pointerEvents = 'all';
    var x = parseInt(carValue.substring(5, carValue.length - 2));
    cost.value = x;
}