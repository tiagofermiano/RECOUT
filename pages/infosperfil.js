function infosperfil() {
    fetch('/infosperfil')
        .then(response => response.json())
        .then(data => {
            fillFormFields(data);
        })
        .catch(error => {
            console.log('Erro ao obter dados pessoais:', error);
        });
}

// Preenche os campos de entrada com os dados pessoais
function fillFormFields(data) {
    document.querySelector('.txt_email').innerText = data.email;
    document.querySelector('.txt_nome').innerText = data.nome;
}

// Chama a função para obter os dados pessoais quando a página é carregada
window.addEventListener('load', infosperfil);
