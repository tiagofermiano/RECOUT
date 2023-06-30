const button = document.querySelector('button');
const popup = document.querySelector('.popup-wrapper');
const closeButton = document.querySelector('.popup-close');

button.addEventListener('click', () => {
    popup.style.display = 'block';
});

popup.addEventListener('click', event => {
    const classNameOfClickedElement = event.target.classList[0];
    console.log(classNameOfClickedElement);
    const classNames = ['popup-link', 'popup-close', 'popup-wrapper']

    const closePopup = classNames.some(className => className === classNamesOfClickedElment)

    if (closePopup) {
        popup.style.display = 'none';
    }
})