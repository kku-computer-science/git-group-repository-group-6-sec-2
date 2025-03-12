<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comparison Results</title>
    <style>
        body {
            font-family: "Arial", sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            color: #333;
            margin: 0;
            padding: 40px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 18px;
        }
        .container {
            width: 95%;
            max-width: 1000px;
            background: white;
            padding: 20px 25px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            border-left: 6px solid #1E3A8A;
        }
        h2 {
            text-align: center;
            font-size: 26px;
            margin-bottom: 20px;
            background: #1E3A8A;
            color: white;
            padding: 10px;
            border-radius: 6px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background: white;
            border-radius: 6px;
            overflow: hidden;
        }
        th, td {
            padding: 12px 15px;
            text-align: left;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #1E3A8A;
            color: white;
            font-weight: bold;
        }
        tr:nth-child(even) {
            background-color: #f1f5f9;
        }
        .status-matched {
            color: #28a745;
            font-weight: bold;
        }
        .status-missing {
            color: #dc3545;
            font-weight: bold;
        }
        .btn-back {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 24px;
            background-color: #1E3A8A;
            color: white;
            font-size: 18px;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.3s ease-in-out;
            box-shadow: 2px 4px 8px rgba(0, 0, 0, 0.15);
        }
        .btn-back:hover {
            background-color: #0f2557;
            box-shadow: 2px 6px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Data from API (Total: {{ count($apiCollection) }})</h2>
    <p><strong>Missing in Database:</strong> {{ count($missingInDB) }}</p>
    <table>
        <thead>
        <tr>
            <th>No.</th>
            <th>Document Name</th>
            <th>DOI</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($apiCollection as $index => $publication)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $publication['paper_name'] }}</td>
                <td>{{ $publication['paper_doi'] ?? 'N/A' }}</td>
                <td class="{{ $missingInDB->contains(fn($missing) => $missing['paper_name'] === $publication['paper_name']) ? 'status-missing' : 'status-matched' }}">
                    {{ $missingInDB->contains(fn($missing) => $missing['paper_name'] === $publication['paper_name']) ? 'Not Found in Database' : 'Exists in Database' }}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

<div class="container">
    <h2>Data from Database (Total: {{ count($publicationsDB) }})</h2>
    <p><strong>Missing in API:</strong> {{ count($missingInAPI) }}</p>
    <table>
        <thead>
        <tr>
            <th>No.</th>
            <th>Document Name</th>
            <th>DOI</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($publicationsDB as $index => $publication)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $publication['paper_name'] }}</td>
                <td>{{ $publication['paper_doi'] ?? 'N/A' }}</td>
                <td class="{{ $missingInAPI->contains(fn($missing) => $missing['paper_name'] === $publication['paper_name']) ? 'status-missing' : 'status-matched' }}">
                    {{ $missingInAPI->contains(fn($missing) => $missing['paper_name'] === $publication['paper_name']) ? 'Not Found in API' : 'Exists in API' }}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

<div class="container">
    <h2>Cited Data Comparison</h2>
    <p><strong>Missing Cited Data in Database:</strong> {{ count($citedMissing) }}</p>
    <table>
        <thead>
        <tr>
            <th>No.</th>
            <th>Cited Year</th>
            <th>Cited Count</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($citedMissing as $index => $item)
            <tr>
                <td>{{ $index + 1 }}</td>
                <td>{{ $item['cited_year'] }}</td>
                <td>{{ $item['cited_count'] }}</td>
                <td class="status-missing">Not Found in Database</td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

<a href="./dashboard" class="btn-back">Back to Dashboard</a>

</body>
</html>
