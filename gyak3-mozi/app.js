document.onload = init();

function init() {
    filmek();
}

function filmek() {
    fetch("filmek")
        .then(response => response.json())
        .then(data => {
            console.log(data)
            data.forEach(e => {
                filmKartya(e)
            });
        })
}

function filmKartya(e) {
    let card = document.createElement("div")
    card.classList.add("card", "d-inline-block", "m-2")

    let cardBody = document.createElement("div")
    cardBody.classList.add("card-body")

    let cardTitle = document.createElement("h5")
    cardTitle.classList.add("card-title")
    cardTitle.innerText = e.cim;

    let cardSubtitle = document.createElement("h6")
    cardSubtitle.classList.add("card-subtitle", "mb-2", "text-body-secondary")
    cardSubtitle.innerText = e.ertekeles;

    let cardText = document.createElement("p")
    cardText.classList.add("card-text")
    cardText.innerHTML = "Rendező: " + e.nev + "<br>Év: " + e.ev + "<br>Műfaj: " + e.mufaj + "<br>Játékidő: " + e.jatekido + " perc"

    cardBody.appendChild(cardTitle)
    cardBody.appendChild(cardSubtitle)
    cardBody.appendChild(cardText)
    card.appendChild(cardBody)
    document.getElementById("filmek").appendChild(card)
}

function ujFilm(){
    let json = {
        cim: "Matyiii",
        ev: 2026
    }
    fetch("filmek/uj", {
        method: "POST",
        body: JSON.stringify(json)
    })
    .then(response => response.json())
    .then(data => {
        console.log(data)
    })
}


