fetch('product.html')
.then(response => response.text())
        .then(data => {
            document.getElementById("bed24").innerHTML = data;         
});
function bill(str)
{
    if(document.getElementById(str+'qty').value==0)
       alert('Please select quantity');
    if(document.getElementById(str+'model').value=='Size')
       alert('Please select size'); 
    
}
