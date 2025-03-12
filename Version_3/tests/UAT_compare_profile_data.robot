*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    OperatingSystem
Library    BuiltIn
Library    String
Library    JSONLibrary

*** Variables ***
${OUTPUT_FILE}    paper_details.json
${PB_FILE}    D:/653380263-0/SoftwareEngineer/git-group-repository-group-6-sec-2/Version_3/tests/pb.json
${RESULT_FILE}    comparison_profile_data_results.json


*** Test Cases ***
TC01 Compare Paper Details with pb
    ${paper_data}=    Get File    ${OUTPUT_FILE}
    ${paper_list}=    Evaluate    json.loads($paper_data)    modules=json

    ${pb_data}=    Get File    ${PB_FILE}
    ${pb_list}=    Evaluate    json.loads($pb_data)    modules=json

    # สร้างตัวแปรเก็บผลลัพธ์การเปรียบเทียบ
    ${comparison_results}=    Create List

    # วนลูปเปรียบเทียบเอกสารทีละฉบับ
    FOR    ${paper}    IN    @{paper_list}
        ${paper_name}=    Set Variable    ${paper["paper_name"]}
        ${found_match}=    Set Variable    False
        ${differences}=    Create Dictionary

        # ค้นหาเอกสารที่ตรงกันใน pb_list
        FOR    ${pb}    IN    @{pb_list}
            ${pb_name}=    Set Variable    ${pb["paper_name"]}
            IF    '${paper_name}' == '${pb_name}'
                ${found_match}=    Set Variable    True

                # รายชื่อฟิลด์ที่ต้องตรวจสอบ
                ${fields_to_check}=    Create List    paper_name

                # วนลูปตรวจสอบแต่ละฟิลด์
                FOR    ${field}    IN    @{fields_to_check}
                    ${paper_value}=    Get From Dictionary    ${paper}    ${field}    default=None
                    ${pb_value}=    Get From Dictionary    ${pb}    ${field}    default=None

                    # ถ้าค่าไม่ตรงกันให้บันทึกความแตกต่าง
                    IF    '${paper_value}' != '${pb_value}'
                        Set To Dictionary    ${differences}    ${field}=${paper_value} (Expected: ${pb_value})
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
