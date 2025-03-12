*** Settings ***
Library    OperatingSystem
Library    test_DataCitationGraph.py    # Import Python script

*** Test Cases ***
Test Get Cited Data
    ${url}=    Set Variable    http://127.0.0.1:8000/detail/eyJpdiI6IjNWVDFuU1F3WWg3WXhPemtoTjdDM3c9PSIsInZhbHVlIjoiYS9OZlNXYVYrU1pDRWVld3RDNC9TUT09IiwibWFjIjoiNjE5MmMyOTkzOTBjNWNmZGExZTVmMjcwYmQ5NzMwMWEzZjA3OGEyMTEzZDNkZTQ1NTMwZTZlNDMwMjY1YTVmNCIsInRhZyI6IiJ9    # เปลี่ยนเป็น URL จริง
    ${cited_data}=    Get Cited Data From Console    ${url}
    Log To Console    \nCited Data:
    :FOR    ${entry}    IN    @{cited_data}
    \    Log To Console    Year: ${entry['cited_year']}, Count: ${entry['cited_count']}