function onlyNumbers(fieldId) {
    var letters = /^[0-9.]+$/;
    var inputtext = document.getElementById(fieldId).value;
    if(inputtext.match(letters))
    {
        return true;
    } else {
        var myString = inputtext.substring(0, inputtext.length - 1);
        alert("Only numbers are allowed.");
        document.getElementById(fieldId).value = myString;
        return false;
    }
}