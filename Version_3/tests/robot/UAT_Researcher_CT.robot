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

CT1.2 Click Login 
    Click Element    xpath=//a[contains(@class, "btn-solid-sm")]
    Wait Until Location Contains    /login    timeout=10s
    Page Should Contain    Account Login
CT1.3 Test Login
    Input Text    id=username    ${EMAIL} 
    Input Text    id=password    ${PASSWORD}
    Click Element    xpath=//button[@type='submit']
    Wait Until Location Contains    /    timeout=10s
    Page Should Contain    Dashboard

