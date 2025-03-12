<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publication History</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- FontAwesome for Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        #chartContainer {
            width: 90%;
            height: 450px; /* เพิ่มความสูงกราฟ */
            margin: auto;
        }

        .btn-group {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .btn-group button {
            margin: 5px;
            font-size: 16px;
            padding: 10px 20px;
            transition: background-color 0.3s ease;
        }

        .btn-group button:hover {
            background-color: #333;
            color: #fff;
        }

        .summary-card {
            margin-top: 30px;
        }

        .summary-card .card-body {
            font-size: 16px;
        }

        .card-header {
            text-align: center;
            font-size: 18px;
        }

        .btn-primary { background-color: #007bff; }
        .btn-danger { background-color: #dc3545; }
        .btn-info { background-color: #17a2b8; }
        .btn-warning { background-color: #ffc107; }
        .btn-success { background-color: #28a745; }
    </style>
</head>
<body>

<div class="container mt-4">
    <h3 class="text-center">Publication History</h3>

    <!-- ปุ่มสำหรับเลือกแหล่งตีพิมพ์ -->
    <div class="btn-group">
        <button class="btn btn-success" onclick="updateChart('summary')" title="Show Summary"><i class="fas fa-chart-pie"></i> Summary</button>
        <button class="btn btn-primary" onclick="updateChart('scopus')" title="Show Scopus Publications"><i class="fas fa-book"></i> Scopus</button>
        <button class="btn btn-danger" onclick="updateChart('wos')" title="Show WOS Publications"><i class="fas fa-book"></i> WOS</button>
        <button class="btn btn-info" onclick="updateChart('google')" title="Show Google Scholar Publications"><i class="fas fa-search"></i> Google Scholar</button>
        <button class="btn btn-warning" onclick="updateChart('tci')" title="Show TCI Publications"><i class="fas fa-bookmark"></i> TCI</button>
    </div>

    <!-- Canvas สำหรับแสดงกราฟ -->
    <div id="chartContainer">
        <canvas id="publicationChart"></canvas>
    </div>

    <!-- Summary Card -->
    <div id="summaryCard" class="summary-card">
        <div class="card">
            <div class="card-header">Summary of Publications</div>
            <div class="card-body" id="summaryContent">
                <!-- Summary content will be updated dynamically -->
            </div>
        </div>
    </div>

</div>

<script>
    var ctx = document.getElementById("publicationChart").getContext("2d");

    // ข้อมูลตีพิมพ์จาก Blade
    var chartData = {
        labels: {!! json_encode($years) !!},  // ปี
        scopus: {!! json_encode($paper_scopus_s) !!},
        wos: {!! json_encode($paper_wos_s) !!},
        google: {!! json_encode($paper_google_s) !!},
        tci: {!! json_encode($paper_tci_s) !!},
    };

    // เรียงข้อมูลจากปีน้อยไปมาก
    var sortedData = chartData.labels
        .map(function(year, index) {
            return {
                year: year,
                scopus: chartData.scopus[index],
                wos: chartData.wos[index],
                google: chartData.google[index],
                tci: chartData.tci[index],
            };
        })
        .sort(function(a, b) {
            return a.year - b.year;
        });

    // รีเซ็ตข้อมูลเรียงลำดับใหม่
    chartData.labels = sortedData.map(function(item) { return item.year; });
    chartData.scopus = sortedData.map(function(item) { return item.scopus; });
    chartData.wos = sortedData.map(function(item) { return item.wos; });
    chartData.google = sortedData.map(function(item) { return item.google; });
    chartData.tci = sortedData.map(function(item) { return item.tci; });

    // สีของแต่ละแหล่งตีพิมพ์
    var colors = {
        scopus: "rgba(0, 0, 255, 0.6)",      // สีน้ำเงิน
        wos: "rgba(255, 0, 0, 0.6)",         // สีแดง
        google: "rgba(0, 191, 255, 0.6)",    // สีฟ้า
        tci: "rgba(255, 255, 0, 0.6)",       // สีเหลือง
        summary: "rgba(0, 128, 0, 0.6)",     // สีเขียวสำหรับ Summary
    };

    // ฟังก์ชันคำนวณค่าสูงสุดและเพิ่ม 1 สำหรับ suggestedMax
    function calculateSuggestedMax() {
        var maxValue = Math.max(
            ...chartData.scopus.concat(chartData.wos, chartData.google, chartData.tci)
        );
        return Math.ceil(maxValue) + 1;
    }

    // กราฟเริ่มต้น (Summary)
    var publicationChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: chartData.labels,
            datasets: [{
                label: "Summary of Publications",
                data: chartData.labels.map(function(_, index) {
                    return chartData.scopus[index] + chartData.wos[index] + chartData.google[index] + chartData.tci[index];
                }),
                backgroundColor: colors.summary,
                borderColor: colors.summary,
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,  // ปรับสัดส่วนกราฟได้
            scales: {
                y: {
                    beginAtZero: true,
                    suggestedMax: calculateSuggestedMax()+1,  // ใช้ค่าที่คำนวณแล้ว
                }
            },
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function(tooltipItem) {
                            return tooltipItem.raw + " publications";
                        }
                    }
                }
            }
        }
    });

    // ฟังก์ชันเปลี่ยนกราฟตามแหล่งตีพิมพ์ที่เลือก
    function updateChart(source) {
        var data;
        var label;
        var backgroundColor;
        var borderColor;

        // ตรวจสอบว่าหากเลือก "Summary" จะรวมข้อมูลจากทุกแหล่ง
        if (source === 'summary') {
            data = chartData.labels.map(function(_, index) {
                return chartData.scopus[index] + chartData.wos[index] + chartData.google[index] + chartData.tci[index];
            });
            label = "Summary of Publications";
            backgroundColor = colors.summary;
            borderColor = colors.summary;
        } else {
            data = chartData[source];
            label = source.charAt(0).toUpperCase() + source.slice(1);
            backgroundColor = colors[source];
            borderColor = colors[source];
        }

        // อัพเดตข้อมูลกราฟ
        publicationChart.data.datasets[0].data = data;
        publicationChart.data.datasets[0].label = label;
        publicationChart.data.datasets[0].backgroundColor = backgroundColor;
        publicationChart.data.datasets[0].borderColor = borderColor;
        publicationChart.update();

        // อัพเดตเนื้อหาของ Summary Card
        updateSummaryCard(label, data);
    }

    // อัพเดตเนื้อหาใน Summary Card
    function updateSummaryCard(label, data) {
        var total = data.reduce((sum, value) => sum + value, 0);
        var summaryContent = `
            <p><strong>${label}:</strong></p>
            <p>Total Publications: ${total}</p>
        `;
        document.getElementById("summaryContent").innerHTML = summaryContent;
    }

    // เริ่มต้นด้วยแสดงข้อมูล Summary
    updateChart('summary');
</script>


</body>
</html>
