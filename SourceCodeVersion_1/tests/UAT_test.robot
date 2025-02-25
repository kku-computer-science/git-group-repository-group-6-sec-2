*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://cssegroup6sec267.cpkkuhost.com/


*** Test Cases ***
TC01 Open Event Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'RESEARCH DOCUMENT MANAGEMENT SYSTEM')]    timeout=30s
    Page Should Contain    RESEARCH DOCUMENT MANAGEMENT SYSTEM

TC02 Login Button
    Wait Until Element Is Visible    xpath=//a[contains(@class,'btn-solid-sm') and text()='Login']    timeout=30s
    Scroll Element Into View    xpath=//a[contains(@class,'btn-solid-sm') and text()='Login']
    Click Element    xpath=//a[contains(@class,'btn-solid-sm') and text()='Login']
    Sleep    2s
    Switch Window    NEW
    Wait Until Element Is Visible    name=username    timeout=30s

TC03 Login System
    Input Text    name=username    punhor1@kku.ac.th
    Input Text    name=password    123456789
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard    timeout=30s

TC04 Manage Publications
    Sleep    2s
    Wait Until Page Contains    Manage Publications    timeout=60s
    Scroll Element Into View    xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Click Element               xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Sleep    2s
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Manage Publications')]    timeout=60s

TC05 Published Research Page
    [Documentation]    ตรวจสอบว่าหน้า Published Research เปิดขึ้นสำเร็จ
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Published research')]    timeout=15s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element                    xpath=//a[contains(text(),'Published research')]
    Wait Until Location Contains     /papers    timeout=10s
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Published Research')]    timeout=10s

TC06 Call Papers
    [Documentation]    กดปุ่ม Call Paper และตรวจสอบว่าหน้า login เปิดขึ้นเร็วที่สุด
    Wait Until Element Is Visible    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]    timeout=15s
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]
    Wait Until Element Is Visible    xpath=//button[contains(@class,'swal-button--confirm')]    timeout=5s
    Click Element    xpath=//button[contains(@class,'swal-button--confirm')]
    Wait Until Element Is Visible    name=username    timeout=10s

[Teardown]    Close Browser