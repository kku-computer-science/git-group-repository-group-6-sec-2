*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}          http://127.0.0.1:8000/
${RESEARCHER_NAME}    Ngamnij Arch-int, Ph.D.
${Education R1}      2531 วท.บ. (สถิติ) มหาวิทยาลัยเกษตรศาสตร์
${Education R2}      2533 พบ.ม (สถิติประยุกต์) สถาบันบัณฑิตพัฒนบริหารศาสตร์
${Education R3}      2546 วท.ด. (วิทยาการคอมพิวเตอร์) จุฬาลงกรณ์มหาวิทยาลัย
${Email}    ngamnij@kku.ac.th

*** Test Cases ***
UT3.1 Test Home Page Can Be Accessed
    Open Browser    ${URL}    ${BROWSER}

UT3.2 Test Profile IT
    Click Element    xpath=//a[@id='navbarDropdown']
    Wait Until Element Is Visible    xpath=//a[@href='http://127.0.0.1:8000/researchers/2']    timeout=10s
    Click Element    xpath=//a[@href='http://127.0.0.1:8000/researchers/2']
    Wait Until Location Contains    /researchers/2    timeout=10s

UT3.3 Test Choose IT   
    Page Should Contain    Researchers
    Page Should Contain    Infomation Technology

UT3.4 Test Ngamnij
    Wait Until Page Contains    Ngamnij Arch-int, Ph.D.    timeout=10s
    Click Element    xpath=//a[div//h5[contains(text(), " Ngamnij Arch-int, Ph.D.")]]
    Wait Until Location Contains   /detail    timeout=10s
    Page Should Contain    ${RESEARCHER_NAME}
    Page Should Contain    ${Email}
    Page Should Contain    ${Education R1} 
    Page Should Contain    ${Education R2} 
    Page Should Contain    ${Education R3}
 
