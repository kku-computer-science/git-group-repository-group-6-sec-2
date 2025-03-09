<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Comparison Results</title>
    <style>
        /* Base Styles */
        body {
            font-family: "Arial", sans-serif;
            background: linear-gradient(135deg, #e3f2fd, #ffffff);
            color: #333;
            margin: 0;
            padding: 40px 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 20px;
        }

        .container {
            width: 95%;
            max-width: 1000px;
            background: white;
            padding: 25px 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            overflow: hidden;
            border-left: 8px solid #1E3A8A;
        }

        /* Headings */
        h2 {
            text-align: center;
            font-size: 30px;
            margin-bottom: 20px;
            background: #1E3A8A;
            color: white;
            padding: 12px;
            border-radius: 8px;
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            font-size: 20px;
            border-bottom: 2px solid #ddd;
        }

        th {
            background-color: #1E3A8A;
            color: white;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #f1f5f9;
        }

        tr:last-child td {
            border-bottom: none;
        }

        /* Status Colors */
        .status-matched {
            color: #28a745;
            font-weight: bold;
        }

        .status-missing {
            color: #dc3545;
            font-weight: bold;
        }

        /* Button */
        .btn-back {
            display: inline-block;
            margin-top: 20px;
            padding: 14px 28px;
            background-color: #1E3A8A;
            color: white;
            font-size: 20px;
            text-decoration: none;
            border-radius: 8px;
            transition: 0.3s ease-in-out;
            box-shadow: 2px 4px 10px rgba(0, 0, 0, 0.15);
        }

        .btn-back:hover {
            background-color: #0f2557;
            box-shadow: 2px 6px 12px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Data from API</h2>
    <table>
        <thead>
        <tr>
            <th>Document Name</th>
            <th>DOI</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($publicationsAPI as $publication)
            <tr>
                <td>{{ $publication->paper_name }}</td>
                <td>{{ $publication->paper_doi ?? 'N/A' }}</td>
                <td class="{{ $missingInDB->has(strtolower(trim($publication->paper_name))) ? 'status-missing' : 'status-matched' }}">
                    {{ $missingInDB->has(strtolower(trim($publication->paper_name))) ? 'Not Found in Database' : 'Exists in Database' }}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

<div class="container">
    <h2>Data from Database</h2>
    <table>
        <thead>
        <tr>
            <th>Document Name</th>
            <th>DOI</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        @foreach ($publicationsDB as $publication)
            <tr>
                <td>{{ $publication->paper_name }}</td>
                <td>{{ $publication->paper_doi ?? 'N/A' }}</td>
                <td class="{{ $missingInAPI->has(strtolower(trim($publication->paper_name))) ? 'status-missing' : 'status-matched' }}">
                    {{ $missingInAPI->has(strtolower(trim($publication->paper_name))) ? 'Not Found in API' : 'Exists in API' }}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>

<!-- Back to Dashboard Button -->
<a href="./dashboard" class="btn-back">Back to Dashboard</a>

</body>
</html>
