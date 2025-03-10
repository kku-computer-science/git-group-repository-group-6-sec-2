*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    String
Library    JSONLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://cssegroup6sec267.cpkkuhost.com/login
${OUTPUT_FILE}    paper_details.json
${PUNPUN_FILE}    D:/653380263-0/SoftwareEngineer/git-group-repository-group-6-sec-2/Version_3/code/public/punpun.json
${RESULT_FILE}    comparison_results.json

*** Test Cases ***

TC01 Login System
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    name=username    punhor1@kku.ac.th
    Input Text    name=password    123456789
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard

TC02 Manage Publications
    Wait Until Page Contains    Manage Publications
    Scroll Element Into View    xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Click Element               xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Manage Publications')]

TC03 Published Research Page
    [Documentation]    ตรวจสอบว่าหน้า Published Research เปิดขึ้นสำเร็จ
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Published research')]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element                    xpath=//a[contains(text(),'Published research')]
    Wait Until Location Contains     /papers

TC04 Collect All Paper Details
    [Documentation]    วนลูปเก็บข้อมูลเอกสารทั้งหมดโดยคลิกปุ่ม View ด้วย JavaScript และบันทึกเป็น JSON ด้วย null สำหรับฟิลด์ว่าง
    # Create a list to store all paper details
    ${all_papers}=    Create List
    
    # Get all View buttons
    ${view_buttons}=    Get WebElements    xpath=//li[@class='list-inline-item']/a[@class='btn btn-outline-primary btn-sm' and contains(@href,'/papers/')]
    ${total_buttons}=   Get Length    ${view_buttons}
    
    # Loop through each View button using an index
    FOR    ${index}    IN RANGE    ${total_buttons}
        # Re-fetch View buttons after each navigation to avoid stale elements
        ${view_buttons}=    Get WebElements    xpath=//li[@class='list-inline-item']/a[@class='btn btn-outline-primary btn-sm' and contains(@href,'/papers/')]
        ${button}=          Set Variable    ${view_buttons}[${index}]
        
        # Get the href to use in navigation verification
        ${href}=    Get Element Attribute    ${button}    href
        Wait Until Element Is Visible    ${button}
        Scroll Element Into View         ${button}
        # Click using JavaScript
        Execute JavaScript    arguments[0].click();    ARGUMENTS    ${button}
        Wait Until Location Contains     ${href}
        
        # Collect paper details with error handling (null for missing or empty values)
        ${status}    ${paper_name}=       Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9'][1]
        ${paper_name}=                    Set Variable If    '${status}' == 'PASS'    ${paper_name}    ${None}
        ${paper_name}=                    Set Variable If    '${paper_name}' == ''    ${None}    ${paper_name}
        ${status}    ${abstract}=         Run Keyword And Ignore Error    Get Text    xpath=(//p[@class='card-text col-sm-9'])[2]
        ${abstract}=                      Set Variable If    '${status}' == 'PASS'    ${abstract}    ${None}
        ${abstract}=                      Set Variable If    '${abstract}' == ''    ${None}    ${abstract}
        ${status}    ${keyword}=          Run Keyword And Ignore Error    Get Text    xpath=(//p[@class='card-text col-sm-9'])[3]
        ${keyword}=                       Set Variable If    '${status}' == 'PASS'    ${keyword}    ${None}
        ${keyword}=                       Set Variable If    '${keyword}' == ''    ${None}    ${keyword}
        ${status}    ${paper_type}=       Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9 paper_type']
        ${paper_type}=                    Set Variable If    '${status}' == 'PASS'    ${paper_type}    ${None}
        ${paper_type}=                    Set Variable If    '${paper_type}' == ''    ${None}    ${paper_type}
        ${status}    ${paper_subtype}=    Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9 paper_subtype']
        ${paper_subtype}=                 Set Variable If    '${status}' == 'PASS'    ${paper_subtype}    ${None}
        ${paper_subtype}=                 Set Variable If    '${paper_subtype}' == ''    ${None}    ${paper_subtype}
        ${status}    ${publication}=      Run Keyword And Ignore Error    Get Text    xpath=(//p[@class='card-text col-sm-9 publication'])
        ${publication}=                   Set Variable If    '${status}' == 'PASS'    ${publication}    ${None}
        ${publication}=                   Set Variable If    '${publication}' == ''    ${None}    ${publication}
        # ${status}    ${authors}=          Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9' and .//b[contains(text(),'First Author:')]]
        # ${authors}=                       Set Variable If    '${status}' == 'PASS'    ${authors}    ${None}
        # ${authors}=                       Set Variable If    '${authors}' == ''    ${None}    ${authors}
        ${status}    ${paper_sourcetitle}=    Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9 sourcetitle']
        ${paper_sourcetitle}=             Set Variable If    '${status}' == 'PASS'    ${paper_sourcetitle}    ${None}
        ${paper_sourcetitle}=             Set Variable If    '${paper_sourcetitle}' == ''    ${None}    ${paper_sourcetitle}
        ${status}    ${paper_yearpub}=    Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9' and contains(text(), '20')]
        ${paper_yearpub}=                 Set Variable If    '${status}' == 'PASS'    ${paper_yearpub}    ${None}
        ${paper_yearpub}=                 Set Variable If    '${paper_yearpub}' == ''    ${None}    ${paper_yearpub}
        ${status}    ${paper_volume}=     Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9 volume']
        ${paper_volume}=                  Set Variable If    '${status}' == 'PASS'    ${paper_volume}    ${None}
        ${paper_volume}=                  Set Variable If    '${paper_volume}' == ''    ${None}    ${paper_volume}
        ${status}    ${paper_issue}=      Run Keyword And Ignore Error    Get Text    xpath=(//p[@class='card-text col-sm-9 issue'])
        ${paper_issue}=                   Set Variable If    '${status}' == 'PASS'    ${paper_issue}    ${None}
        ${paper_issue}=                   Set Variable If    '${paper_issue}' == ''    ${None}    ${paper_issue}
        ${status}    ${paper_page}=       Run Keyword And Ignore Error    Get Text    xpath=(//p[@class='card-text col-sm-9 page'])
        ${paper_page}=                    Set Variable If    '${status}' == 'PASS'    ${paper_page}    ${None}
        ${paper_page}=                    Set Variable If    '${paper_page}' == ''    ${None}    ${paper_page}
        ${status}    ${paper_doi}=        Run Keyword And Ignore Error    Get Text    xpath=//p[@class='card-text col-sm-9 doi' and contains(text(), '10.')]
        ${paper_doi}=                     Set Variable If    '${status}' == 'PASS'    ${paper_doi}    ${None}
        ${paper_doi}=                     Set Variable If    '${paper_doi}' == ''    ${None}    ${paper_doi}
        ${status}    ${paper_url}=        Run Keyword And Ignore Error    Get Text    xpath=//a[@class='card-text col-sm-9 paper_url']
        ${paper_url}=                     Set Variable If    '${status}' == 'PASS'    ${paper_url}    ${None}
        ${paper_url}=                     Set Variable If    '${paper_url}' == ''    ${None}    ${paper_url}

        # Create dictionary for this paper
        ${paper_details}=    Create Dictionary
        ...    paper_name=${paper_name}
        ...    abstract=${abstract}
        ...    paper_type=${paper_type}
        ...    paper_subtype=${paper_subtype}
        ...    paper_sourcetitle=${paper_sourcetitle}
        ...    keyword=${keyword}
        ...    paper_url=${paper_url}
        ...    publication=${publication}
        ...    paper_yearpub=${paper_yearpub}
        ...    paper_volume=${paper_volume}
        ...    paper_issue=${paper_issue}
        ...    paper_page=${paper_page}
        ...    paper_doi=${paper_doi}
        ...    paper_url=${paper_url}
        # ...    authors=${authors}

        # Append to list
        Append To List    ${all_papers}    ${paper_details}
        
        # Click the Back button
        Wait Until Element Is Visible    xpath=//a[@class='btn btn-primary mt-5' and @href='https://cssegroup6sec267.cpkkuhost.com/papers']
        Scroll Element Into View         xpath=//a[@class='btn btn-primary mt-5' and @href='https://cssegroup6sec267.cpkkuhost.com/papers']
        Click Element                    xpath=//a[@class='btn btn-primary mt-5' and @href='https://cssegroup6sec267.cpkkuhost.com/papers']
        Wait Until Location Contains     /papers
    END
    
    # Save all papers to JSON file
    ${json_string}=    Evaluate    json.dumps($all_papers, ensure_ascii=False, indent=4)    modules=json
    Create File    ${OUTPUT_FILE}    ${json_string}
    
    # Log to console to confirm
    Log To Console    \nSaved all paper details to ${OUTPUT_FILE}\n


TC05 Compare Paper Details with Punpun
    [Documentation]    เปรียบเทียบค่าจากไฟล์ JSON ที่ได้จาก TC04 กับไฟล์ Punpun JSON

    # อ่านไฟล์ paper_details.json
    ${paper_data}=    Get File    ${OUTPUT_FILE}
    ${paper_list}=    Evaluate    json.loads($paper_data)    modules=json

    # อ่านไฟล์ punpun.json
    ${punpun_data}=    Get File    ${PUNPUN_FILE}
    ${punpun_list}=    Evaluate    json.loads($punpun_data)    modules=json

    # สร้างตัวแปรเก็บผลลัพธ์การเปรียบเทียบ
    ${comparison_results}=    Create List

    # วนลูปเปรียบเทียบเอกสารทีละฉบับ
    FOR    ${paper}    IN    @{paper_list}
        ${paper_name}=    Set Variable    ${paper["paper_name"]}
        ${found_match}=    Set Variable    False
        ${differences}=    Create Dictionary

        # ค้นหาเอกสารที่ตรงกันใน punpun_list
        FOR    ${punpun}    IN    @{punpun_list}
            ${punpun_name}=    Set Variable    ${punpun["paper_name"]}
            IF    '${paper_name}' == '${punpun_name}'
                ${found_match}=    Set Variable    True

                # รายชื่อฟิลด์ที่ต้องตรวจสอบ
                ${fields_to_check}=    Create List    paper_name    abstract    paper_type    paper_subtype    paper_sourcetitle    keyword    
                ...    paper_url    publication    paper_yearpub    paper_volume    paper_issue    paper_page    paper_doi

                # วนลูปตรวจสอบแต่ละฟิลด์
                FOR    ${field}    IN    @{fields_to_check}
                    ${paper_value}=    Get From Dictionary    ${paper}    ${field}    default=None
                    ${punpun_value}=    Get From Dictionary    ${punpun}    ${field}    default=None

                    # ถ้าค่าไม่ตรงกันให้บันทึกความแตกต่าง
                    IF    '${paper_value}' != '${punpun_value}'
                        Set To Dictionary    ${differences}    ${field}=${paper_value} (Expected: ${punpun_value})
                    END
                END
                BREAK
            END
        END

        # บันทึกผลลัพธ์ของการเปรียบเทียบ
        ${result}=    Create Dictionary    paper_name=${paper_name}    match_status=${found_match}    differences=${differences}
        Append To List    ${comparison_results}    ${result}
    END

    # บันทึกผลลัพธ์เป็น JSON
    ${result_json}=    Evaluate    json.dumps($comparison_results, ensure_ascii=False, indent=4)    modules=json
    Create File    ${RESULT_FILE}    ${result_json}

    # แสดงผลลัพธ์ใน Console
    Log To Console    \nผลการเปรียบเทียบถูกบันทึกใน ${RESULT_FILE}\n


[Teardown]    Close Browser