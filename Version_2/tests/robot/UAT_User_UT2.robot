*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}          http://127.0.0.1:8000/
${RESEARCHER_NAME}    Prof. Sartra Wongthanavasu, Ph.D."
${Education R1}      2526 วท.บ. (คณิตศาสตร์) มหาวิทยาลัยขอนแก่น
${Education R2}      2528 พบ.ม. (สถิติประยุกต์) สถาบันบัณฑิตพัฒนบริหารศาสตร์
${Education R3}      2544 D.Tech.Sc. (Computer Science) Asian Institute of Technology, Thailand"
${Email}    wongsar@kku.ac.th"

*** Test Cases ***
๊UT2.1 Test Home Page Can Be Accessed
    Open Browser    ${URL}    ${BROWSER}

UT2.2 Test Profile CS
    Click Element    xpath=//a[@id='navbarDropdown']
    Wait Until Element Is Visible    xpath=//a[@href='http://127.0.0.1:8000/researchers/1']    timeout=10s
    Click Element    xpath=//a[@href='http://127.0.0.1:8000/researchers/1']
    Wait Until Location Contains    /researchers/1    timeout=10s
    Page Should Contain    Computer Science

UT2.3 Test Pusadee
    Wait Until Page Contains    Pusadee Seresangtakul, Ph.D.    timeout=10s
    Click Element    xpath=//a[div//h5[contains(text(), "Pusadee Seresangtakul, Ph.D.")]]
    Wait Until Location Contains   /detail    timeout=10s
    Page Should Contain    Pusadee Seresangtakul, Ph.D.
    Page Should Contain    E-mail: pusadee@kku.ac.th
    Page Should Contain    2529 วท.บ. (ฟิสิกส์) มหาวิทยาลัยขอนแก่น
    Page Should Contain    2535 วท.ม. (วิทยาการคอมพิวเตอร์) จุฬาลงกรณ์มหาวิทยาลัย
    Page Should Contain    2548 Ph.D. (Interdisciplinary Intelligent Systems Engineering) University of the Ryukyus, Japan

 
