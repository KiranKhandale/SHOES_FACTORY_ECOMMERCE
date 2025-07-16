const container = document.querySelector('.container');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');

registerBtn.addEventListener('click', () => {
    container.classList.add('active');
});

loginBtn.addEventListener('click', () => {
    container.classList.remove('active');
});

function seterror(id, error) {
    // Sets error inside tag of id
    const element = document.getElementById(id);
    element.getElementsByClassName('formerror')[0].innerHTML = error;
}

function validateForm() {

    var returnval = true;

    // Clear all previous errors
    const errors = document.getElementsByClassName('formerror');
    for (let item of errors) {
        item.innerHTML = "";
    }

    // Validate name
    var name = document.forms['myRegisterForm']['name1'].value;
    if (name.length < 5) {
        seterror("name", "Length of user name is too short (minimum 5 characters)");
        returnval = false;
    }

    // Validate email
    var email = document.forms['myRegisterForm']['email1'].value;
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
        seterror("email", "Invalid email format");
        returnval = false;
    }

    // Validate password
    var password = document.forms['myRegisterForm']['password1'].value;
    if (password.length < 8) {
        seterror("password", "Password must be at least 8 characters long");
        returnval = false;
    }

    var city=document.forms['myRegisterForm']['city1'].value;
    if(city.length<3){
       seterror("city","Enter a Valid City Name");
       returnval=false;
    }


    



    // Prevent toggling if validation fails
    return returnval;
}
