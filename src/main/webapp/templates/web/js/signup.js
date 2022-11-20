const eyes = document.querySelectorAll('.signup-board__icon-view');
const password = document.getElementById('password');
const confirmPassword = document.getElementById('password_confirm');
console.log(eyes);

[...eyes].forEach(eye => {
    eye.onclick = function (e) {
        if (e.target.previousElementSibling.type == 'password') {
            e.target.classList.toggle('fa-eye-slash');
            e.target.classList.toggle('fa-eye');
            e.target.previousElementSibling.setAttribute('type', 'text')
        } else {
            e.target.classList.toggle('fa-eye-slash');
            e.target.classList.toggle('fa-eye');
            e.target.previousElementSibling.setAttribute('type', 'password')
        }
    }
})