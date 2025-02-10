<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citation Overview</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        .container {
            max-width: 1100px;
        }

        .summary-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 2px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .chart-container {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        #chartWrapper {
            flex-grow: 1;
            height: 400px;
        }

        .summary-right {
            width: 150px;
            text-align: right;
        }

        .summary-item {
            font-size: 16px;
            color: #555;
        }

        .summary-value {
            font-size: 28px;
            font-weight: bold;
            color: black;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h3 class="text-center">CITATION OVERVIEW</h3>

    <div class="summary-box">
        <div></div> <!-- Spacer -->
        <div class="summary-right">
            <div class="summary-item">
                <span class="summary-value" id="totalCitations">0</span> Citations
            </div>
            <div class="summary-item">
                <span class="summary-value" id="hIndexValue">0</span> h-index
            </div>
        </div>
    </div>

    <!-- Chart + Summary -->
    <div class="chart-container">
        <div id="chartWrapper">
            <canvas id="citationChart"></canvas>
        </div>
    </div>

</div>

<script>
    var ctx = document.getElementById("citationChart").getContext("2d");

    // Citation and H-index data from backend
    var citationData = @json($citations ?? []);
    var hIndexData = @json($hIndex ?? []);
    var yearLabels = @json($year2 ?? []);

    // Calculate total citations
    var totalCitations = citationData.reduce((acc, val) => acc + val, 0);
    var maxHIndex = Math.max(...hIndexData);

    // Update summary values
    document.getElementById("totalCitations").textContent = totalCitations;
    document.getElementById("hIndexValue").textContent = maxHIndex;

    var citationChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: yearLabels,
            datasets: [
                {
                    label: "Citations",
                    data: citationData,
                    backgroundColor: "rgba(255, 255, 0, 0.6)",
                    borderColor: "rgba(255, 255, 0, 0.6)",
                    borderWidth: 1
                }
            ]
        },
        options: {
            responsive: true,
            maintainAspectRatio: false,
            scales: {
                y: { beginAtZero: true }
            },
            plugins: {
                legend: { display: false } // Hide legend for cleaner UI
            }
        }
    });
</script>

</body>
</html>
