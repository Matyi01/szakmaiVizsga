document.onload = init();

function init() {
    hirfolyamok()
}

function hirfolyamok() {
    fetch("forum/hirfolyamok")
        .then(response => response.json())
        .then(data => {
            data.forEach(e => {
                hirfolyamElem(e.id, e.megnevezes)
            });
        })
}

function hirfolyamElem(id, nev) {
    let gomb = document.createElement("button")
    gomb.type = "button"
    gomb.innerText = nev
    gomb.classList.add("btn", "btn-outline-dark", "m-2")
    gomb.onclick = function () { uzenetek(id) };
    document.getElementById("hirfolyamok").appendChild(gomb)
}

function uzenetek(id) {
    fetch("forum/uzenetek/" + id)
        .then(response => response.json())
        .then(data => {
            document.getElementById("uzenetek").innerHTML = "";
            data.forEach(e => {
                uzenetElem(e.tartalom, e.kuldido, e.utonev, e.email)
            });
        })
}

function uzenetElem(tartalom, kuldido, utonev, email) {
    let row = document.createElement("div")
    row.classList.add("row", "p-1")

    let uzenet = document.createElement("div")
    uzenet.classList.add("col-5");
    uzenet.innerText = tartalom

    let nev = document.createElement("div")
    nev.classList.add("col-1");
    nev.innerText = utonev
       
    let mail = document.createElement("div")
    mail.classList.add("col-3");
    mail.innerText = email

    let ido = document.createElement("div")
    ido.classList.add("col-1");
    ido.innerText = kuldido

    row.appendChild(uzenet)
    row.appendChild(nev)
    row.appendChild(mail)
    row.appendChild(ido)
    document.getElementById("uzenetek").appendChild(row)
}