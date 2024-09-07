document.addEventListener("DOMContentLoaded", function () {
    const joblistbtn = document.querySelector(".joblistbtn");
    const joblistmenu = document.querySelector(".joblistlist");
    const interviewbtn = document.querySelector(".interviewbtn");
    const interviewmenu = document.querySelector(".interviewlist");
    const userbtn = document.querySelector(".userbtn");
    const usermenu = document.querySelector(".userlist");

    const addeducationbtn = document.querySelector("#educationadd");
    const educationdetailform = document.querySelector(".educationcertificateform");
    const closeeducationdetail = document.querySelector("#educationclose");
    const addcertificatebtn = document.querySelector("#certificateadd");
    const certificatedetailform = document.querySelector(".certificateform");
    const closecertificatedetail = document.querySelector("#certificateclose");

    const menubtn = document.querySelector('.menubar');
    const navbar = document.querySelector('nav');
    const xmarkicon = document.querySelector('.xmark');

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

    function toggleForm(url) {
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            }
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

    if (addeducationbtn) {
        addeducationbtn.addEventListener("click", function(){
            if (educationdetailform.style.display == "flex") {
                educationdetailform.style.display = "none";
            }
            else {
                educationdetailform.style.display = "flex";
            }
            
            if (certificatedetailform.style.display == "flex") {
                certificatedetailform.style.display = "none";
            }

            toggleForm('/api/toggleEducationForm');
        });
    }

    if (closeeducationdetail) {
        closeeducationdetail.addEventListener("click", function(){
            educationdetailform.style.display = "none";
            toggleForm('/api/toggleEducationForm');
        });
    }

    if (addcertificatebtn) {
        addcertificatebtn.addEventListener("click", function(){
            if (certificatedetailform.style.display == "flex") {
                certificatedetailform.style.display = "none";
            }
            else {
                certificatedetailform.style.display = "flex";
            }
            if (educationdetailform.style.display == "flex") {
                educationdetailform.style.display = "none";
            }
            toggleForm('/api/toggleCertificateForm');
        });
    }

    if (closecertificatedetail) {
        closecertificatedetail.addEventListener("click", function(){
            certificatedetailform.style.display = "none";
            toggleForm('/api/toggleCertificateForm');
        });
    }

    if (menubtn) {
        menubtn.addEventListener('click', function(){
            navbar.classList.toggle('navbarshow');
            toggleForm('/api/toggleNavbar');
        });
    }

    if (xmarkicon) {
        xmarkicon.addEventListener('click', function(){
            navbar.classList.remove('navbarshow');
            toggleForm('/api/toggleNavbar');
        });
    }
});
