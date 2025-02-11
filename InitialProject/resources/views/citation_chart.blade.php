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
    var paperScopus = @json($paper_scopus_s ?? []);
    var paperWos = @json($paper_wos_s ?? []);
    var paperGoogle = @json($paper_google_s ?? []);
    var paperTci = @json($paper_tci_s ?? []);
    var yearLabels = @json($years ?? []);
    var hIndex = @json($h_index ?? []);

    // Sort yearLabels and citationData by year in ascending order
    var sortedYearsData = yearLabels.map((year, index) => ({
        year: year,
        citations: paperScopus[index] + paperWos[index] + paperGoogle[index] + paperTci[index]
    })).sort((a, b) => a.year - b.year);

    // Extract sorted data for chart
    var sortedYears = sortedYearsData.map(item => item.year);
    var sortedCitationData = sortedYearsData.map(item => item.citations);

    // Calculate total citations and h-index
    var totalCitations = sortedCitationData.reduce((acc, val) => acc + val, 0);
    var maxHIndex = Math.max(...hIndex);

    // Update summary values (handle if no data is available)
    document.getElementById("totalCitations").textContent = totalCitations || 0;
    document.getElementById("hIndexValue").textContent = maxHIndex || 0;

    // Calculate suggestedMax for y-axis scaling
    var suggestedMax = Math.max(...sortedCitationData) + 1;

    var citationChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: sortedYears,
            datasets: [
                {
                    label: "Citations",
                    data: sortedCitationData,
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
                y: {
                    beginAtZero: true,
                    suggestedMax: suggestedMax,
                    title: {
                        display: true,
                        text: 'Citations Count'
                    }
                }
            },
            plugins: {
                legend: {
                    display: false // Hide legend for cleaner UI
                }
            }
        }
    });
</script>


</body>
</html>
