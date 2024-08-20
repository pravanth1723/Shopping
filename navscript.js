    fetch('navbar.html')
        .then(response => response.text())
        .then(data => {
            // Inject the navigation bar into the desired element
            // alert(data);
            document.getElementById("navbar").innerHTML = data;
        });


        fetch('foot.html')
        .then(response => response.text())
        .then(data => {
            // Inject the navigation bar into the desired element
            // alert(data);
            document.getElementById("foot").innerHTML = data;
        });
        // document.getElementById('cartqty').textContent=3;
// });
