document.addEventListener("DOMContentLoaded", function () {
    const joblistbtn = document.querySelector(".joblistbtn");
    const joblistmenu = document.querySelector(".joblistlist");
    const interviewbtn = document.querySelector(".interviewbtn");
    const interviewmenu = document.querySelector(".interviewlist");
    const userbtn = document.querySelector(".userbtn");
    const usermenu = document.querySelector(".userlist");

    function toggleMenu(menuType) {
        fetch('/api/toggleMenu', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams({
                menuType: menuType
            })
        })
        .then(response => response.text())
        .then(data => console.log(data))
        .catch(error => console.error('Error:', error));
    }

    if (joblistbtn) {
        joblistbtn.addEventListener("click", function () {
            joblistmenu.classList.toggle("joblistshow");
            interviewmenu.classList.remove("interviewlistshow");
            usermenu.classList.remove("userlistshow");
            toggleMenu('joblist');
        });
    }

    if (interviewbtn) {
        interviewbtn.addEventListener("click", function () {
            interviewmenu.classList.toggle("interviewlistshow");
            joblistmenu.classList.remove("joblistshow");
            usermenu.classList.remove("userlistshow");
            toggleMenu('interview');
        });
    }

    if (userbtn) {
        userbtn.addEventListener("click", function () {
            usermenu.classList.toggle("userlistshow");
            interviewmenu.classList.remove("interviewlistshow");
            joblistmenu.classList.remove("joblistshow");
            toggleMenu('user');
        });
    }

    const menubtn = document.querySelector('.menubar');
    const navbar = document.querySelector('nav');
    const xmarkicon = document.querySelector('.xmark');

    if (menubtn) {
        menubtn.addEventListener('click', function () {
            navbar.classList.toggle('navbarshow');
        });
    }

    if (xmarkicon) {
        xmarkicon.addEventListener('click', function () {
            navbar.classList.remove('navbarshow');
        });
    }
});
