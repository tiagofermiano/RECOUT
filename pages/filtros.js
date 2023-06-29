const Cabecalho = [flip-card];

function checkCabecalho(Cabecalho) {
  return Cabecalho> document.getElementById("cabecalhoToCheck").value;
}


{
Cabecalho: "flip-card",
category:"txt_podcast"
}

  document.getElementById("demo").innerHTML = Cabecalho.filter(checkCabecalho);


  Cabecalho.filter((Cabecalho) => {
    return Cabecalho.category == "txt_podcast"
  });
