var carousel = document.querySelector('.carrossel');
var images = carousel.getElementsByTagName('img');
var currentIndex = 0;
var interval = 3500; // Tempo de exibição de cada imagem (em milissegundos)
var btnPrev = document.getElementById('botao_anterior');
var btnNext = document.getElementById('botao_proximo');

function showImage(img) {
    for (var i = 0; i < images.length; i++) {
        if (i === img) {
            images[i].style.display = 'block';
        } else {
            images[i].style.display = 'none';
        }
    }
}

function nextImage() {
    currentIndex++;
    if (currentIndex >= images.length) {
        currentIndex = 0;
    }
    showImage(currentIndex);
}

function prevImage() {
    currentIndex--;
    if (currentIndex < 0) {
        currentIndex = images.length - 1;
    }
    showImage(currentIndex);
}

// Inicia o carrossel
showImage(currentIndex);
setInterval(nextImage, interval);

// Adiciona eventos aos botões
btnPrev.addEventListener('click', prevImage);
btnNext.addEventListener('click', nextImage);