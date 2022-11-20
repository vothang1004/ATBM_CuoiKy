/************* chart 1********* */
const xValues1 = ["Sơ mi nam", "Áo thun nam", "Áo Polo nam", "Áo khoác nam"];
const yValues1 = [55, 49, 24, 44];
const barColors1 = '#F5DF4D';

new Chart("chart1", {
    type: "bar",
    data: {
    labels: xValues1,
    datasets: [{
        backgroundColor: barColors1,
        data: yValues1,
        hoverBorderWidth: 1,
        hoverBorderColor: '#000'
    }]
    },
    options:{
        title: {
            display: true,
            text: 'ÁO NAM ĐÃ BÁN',
            fontSize: 14,
        },
        legend: {
            display: false
        }
    }
});
/************* chart 2********* */
const xValues2 = ["Quần jean nam", "Quân kaki nam", "Quần jogger nam", "Quần short nam"];
const yValues2 = [34, 60, 12, 46];
const barColors2 = '#0072B5';

new Chart("chart2", {
    type: "bar",
    data: {
    labels: xValues2,
    datasets: [{
        backgroundColor: barColors2,
        data: yValues2,
        hoverBorderWidth: 1,
        hoverBorderColor: '#000'
    }]
    },
    options:{
        title: {
            display: true,
            text: 'QUẦN NAM ĐÃ BÁN',
            fontSize: 14,
        },
        legend: {
            display: false
        }
    }
});
/************* chart 3********* */
const xValues3 = ["Sơ mi nữ", "Áo thun nữ", "Áo Polo nữ", "Áo khoác nữ"];
const yValues3 = [75, 54, 24, 30];
const barColors3 = '#A0DAA9';

new Chart("chart3", {
    type: "bar",
    data: {
    labels: xValues3,
    datasets: [{
        backgroundColor: barColors3,
        data: yValues3,
        hoverBorderWidth: 1,
        hoverBorderColor: '#000'
    }]
    },
    options:{
        title: {
            display: true,
            text: 'ÁO NỮ ĐÃ BÁN',
            fontSize: 14,
        },
        legend: {
            display: false
        }
    }
});
/************* chart 4********* */
const xValues4 = ["Quần jean nữ", "Quân kaki nữ", "Quần xuông nữ", "Quần short nữ"];
const yValues4 = [80, 40, 53, 34];
const barColors4 = '#E9897E';

new Chart("chart4", {
    type: "bar",
    data: {
    labels: xValues4,
    datasets: [{
        backgroundColor: barColors4,
        data: yValues4,
        hoverBorderWidth: 1,
        hoverBorderColor: '#000'
    }]
    },
    options:{
        title: {
            display: true,
            text: 'QUẦN NỮ ĐÃ BÁN',
            fontSize: 14,
        },
        legend: {
            display: false
        }
    }
});