*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}          http://127.0.0.1:8000/
${RESEARCHER_NAME}    Punyaphol Horata, Ph.D.
${Education R1}    2528 วท.บ. (คณิตศาสตร์) มหาวิทยาลัยขอนแก่น 
${Education R2}    2535 วท.ม. (วิทยาศาสตร์คอมพิวเตอร์) จุฬาลงกรณ์มหาวิทยาลัย
${Education R3}    2555 ปร.ด. (วิทยาการคอมพิวเตอร์) มหาวิทยาลัยขอนแก่น
${Email}    punhor1@kku.ac.th
${SCOPUS_TAB}   id=scopus-tab
${SCOPUS_SECTION}   id=scopus

# เหลือกดปุ่ม show more และเช็คข้อมูลที่แสดง

*** Test Cases ***
UT1.1Test Home Page Can Be Accessed
    Open Browser    ${URL}    ${BROWSER}

UT1.2Test Chart Is See
    # Open Browser    ${URL}    ${BROWSER}
    Wait Until Element Is Visible    css:#barChart1    timeout=10s
    Page Should Contain Element    css:#barChart1

# UT13 testClick Researchers Button
#     Click Element    xpath=//a[@href='/researchers/all']
#     Wait Until Location Contains    /researchers/all    timeout=10s
#     Page Should Contain    Researchers
#     Close Browser

UT1.3 Test Profile Sartra
    Click Element    xpath=//a[@id='navbarDropdown']
    Wait Until Element Is Visible    xpath=//a[@href='http://127.0.0.1:8000/researchers/1']    timeout=10s
    Click Element    xpath=//a[@href='http://127.0.0.1:8000/researchers/1']
    Wait Until Location Contains    /researchers/1    timeout=10s
    Page Should Contain    Computer Science

UT1.4 Test View Researcher Profile
    Wait Until Page Contains    ${RESEARCHER_NAME}    timeout=10s
    Click Element    xpath=//a[div//h5[contains(text(), "${RESEARCHER_NAME}")]]
    Wait Until Location Contains   /detail    timeout=10s
    Page Should Contain    ${RESEARCHER_NAME}
    Page Should Contain    ${Email}
    Page Should Contain    ${Education R1}
    Page Should Contain    ${Education R2}  
    Page Should Contain    ${Education R3}  
     
    # รอให้ค่าของ Summary เปลี่ยนเป็น 28
    Wait Until Element Contains    xpath=//div[@id='all']/h2    28    timeout=10s
    # ดึงค่าของ Summary อีกครั้งหลังจากรอ
    ${summary} =    Get Text    xpath=//div[@id='all']/h2
    # ตรวจสอบว่าค่าตรงกับที่คาดหวัง (28)
    Should Be Equal As Strings    ${summary}    28
    
     # รอให้ค่าของ scopus เปลี่ยนเป็น 28
    Wait Until Element Contains    xpath=//div[@id='scopus_sum']/h2    23    timeout=10s
    # ดึงค่าของ scopus อีกครั้งหลังจากรอ
    ${summary} =    Get Text    xpath=//div[@id='scopus_sum']/h2
    # ตรวจสอบว่าค่าตรงกับที่คาดหวัง (28)
    Should Be Equal As Strings    ${summary}    23

      # รอให้ค่าของ wos เปลี่ยนเป็น 0
    Wait Until Element Contains    xpath=//div[@id='wos_sum']/h2    0    timeout=10s
    # ดึงค่าของ Summary อีกครั้งหลังจากรอ
    ${summary} =    Get Text    xpath=//div[@id='wos_sum']/h2
    # ตรวจสอบว่าค่าตรงกับที่คาดหวัง (0)
    Should Be Equal As Strings    ${summary}    0

    # รอให้ค่าของ Tci เปลี่ยนเป็น 3
    Wait Until Element Contains    xpath=//div[@id='tci_sum']/h2    3    timeout=10s
    # ดึงค่าของ Tci อีกครั้งหลังจากรอ
    ${summary} =    Get Text    xpath=//div[@id='tci_sum']/h2
    # ตรวจสอบว่าค่าตรงกับที่คาดหวัง (3)
    Should Be Equal As Strings    ${summary}    3
UT1.5 Click Scopus Tab
     Wait Until Element Is Visible    ${SCOPUS_TAB}    timeout=10s

    # คลิกปุ่ม SCOPUS
    Click Element    ${SCOPUS_TAB}

    # รอให้ SCOPUS Section ปรากฏ (เนื้อหาหลังจากกดปุ่ม)
    Wait Until Element Is Visible    ${SCOPUS_SECTION}    timeout=10s

    Page Should Contain    No.
    Page Should Contain    Year
    Page Should Contain    Paper Name
    Page Should Contain    Author
    Page Should Contain    Document Type
    Page Should Contain    Page
    Page Should Contain    Journals/Transactions
    Page Should Contain    Ciations
    Page Should Contain    Doi


 
