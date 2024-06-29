function calculateDaysAndRate() {
    var startDate = new Date(document.getElementById('startDate').value);
    var endDate = new Date(document.getElementById('endDate').value);
    var ratePerDay = parseFloat(document.getElementById('ratePerDay').value);

    if (startDate && endDate && !isNaN(ratePerDay)) {
        var timeDiff = endDate - startDate;
        var days = Math.ceil(timeDiff / (1000 * 3600 * 24));
        if (days > 0) {
            var totalRate = days * ratePerDay;
            document.getElementById('days').value = days;
            document.getElementById('totalRate').value = Math.floor(totalRate); // Adjust to display as an integer
        } else {
            document.getElementById('days').value = '';
            document.getElementById('totalRate').value = '';
        }
    }
}
