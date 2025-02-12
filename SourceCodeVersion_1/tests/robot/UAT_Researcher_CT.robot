*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}          http://127.0.0.1:8000/
${PASSWORD}    123456789
${EMAIL}     punhor1@kku.ac.th
*** Test Cases ***
CT1.1 Test Home Page Can Be Accessed
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

CT1.2 Click Login 
    Click Element    xpath=//a[@class='btn-solid-sm' and @href='/login']    # ค้นหาปุ่มจาก class และ href
    Sleep    3    # รอให้หน้าโหลด
    Wait Until Location Contains    /login    timeout=10s
    Page Should Contain    Account Login

CT1.3 Test Login
    Wait Until Element Is Visible    id=username    timeout=10s 
    Input Text    id=username    ${EMAIL} 
    Input Text    id=password    ${PASSWORD}
    Sleep    10
    Click Element    xpath=//button[@type='submit']
    Wait Until Location Contains    /    timeout=10s
    Page Should Contain    Dashboard

