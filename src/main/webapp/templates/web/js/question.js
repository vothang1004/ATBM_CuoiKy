
let wraps = document.querySelectorAll('.content-question__wrap-item');

function handleClick(wrap) {
    let child = wrap.querySelector('.content-question__item');
    let sibbling = child.parentElement.nextElementSibling;
    if(child.style.color !== 'var(--orange)') {
        child.style = `color: var(--orange)`;
        if(sibbling.classList.contains('content-question__item-answer--hide')) {
            sibbling.classList.remove('content-question__item-answer--hide');
        }
    }else {
        child.style = `color: var(--gray-dark)`;
        if(!sibbling.classList.contains('content-question__item-answer--hide')) {
            sibbling.classList.add('content-question__item-answer--hide');
        }
    }
}
[...wraps].forEach(item => {
    item.onclick =() => {
        handleClick(item)
    }
})