fetch('product.html')
.then(response => response.text())
        .then(data => {
            document.getElementById("bed24").innerHTML = data;         
});
alert('hi');