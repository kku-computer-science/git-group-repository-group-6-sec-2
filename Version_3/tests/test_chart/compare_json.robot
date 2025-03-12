*** Settings ***
Library    JSONLibrary
Library    OperatingSystem
Library    Process

*** Variables ***

${REPORT_FILE}    report.txt
${ScrapeTable_SCRIPT}    ScrapeTable.py
${Clean_SCRIPT}    cleandata_file.py
${Console_SCRIPT}    console_log.py

*** Test Cases ***

Compare JSON Files And Generate Report
    sleep    10s
    ${json1}    Load Json From File    all_data.json
    ${json2}    Load Json From File    year_counts.json

    ${years1}    Get Value From Json    ${json1}    $.years
    ${years2}    Get Value From Json    ${json2}    $.years
    ${counts1}    Get Value From Json    ${json1}    $.counts
    ${counts2}    Get Value From Json    ${json2}    $.counts

    ${years_match}    Run Keyword And Return Status    Should Be Equal    ${years1}    ${years2}
    ${counts_match}    Run Keyword And Return Status    Should Be Equal    ${counts1}    ${counts2}

    Run Keyword If    ${years_match} and ${counts_match}    Report No Differences
    Run Keyword If    not ${years_match} or not ${counts_match}    Report Differences    ${years1}    ${years2}    ${counts1}    ${counts2}

*** Keywords ***
Report No Differences
    Log    ✅ ข้อมูลในไฟล์ทั้งสองเหมือนกัน 100%
    Append To File    ${REPORT_FILE}    ✅ ข้อมูลในไฟล์ทั้งสองเหมือนกัน 100%\n

Report Differences
    [Arguments]    ${years1}    ${years2}    ${counts1}    ${counts2}
    Log    ❌ ข้อมูลไม่ตรงกัน! ตรวจสอบความแตกต่าง
    Append To File    ${REPORT_FILE}    ❌ ข้อมูลไม่ตรงกัน! ตรวจสอบความแตกต่าง\n

    ${years_match}    Run Keyword And Return Status    Should Be Equal    ${years1}    ${years2}
    ${counts_match}    Run Keyword And Return Status    Should Be Equal    ${counts1}    ${counts2}

    Run Keyword If    not ${years_match}    Append To File    ${REPORT_FILE}    🔹 Years ไม่ตรงกัน:\n${years1}\n🔹 ไม่เท่ากับ\n${years2}\n\n
    Run Keyword If    not ${counts_match}    Append To File    ${REPORT_FILE}    🔹 Counts ไม่ตรงกัน:\n${counts1}\n🔹 ไม่เท่ากับ\n${counts2}\n\n
