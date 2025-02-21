*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${URL}        https://cssegroup6sec267.cpkkuhost.com/


*** Test Cases ***
TC01 Open Event Registration Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains    text=RESEARCH DOCUMENT MANAGEMENT SYSTEM
    Page Should Contain    text=RESEARCH DOCUMENT MANAGEMENT SYSTEM


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
    Sleep    5s
    Wait Until Page Contains    Manage Publications    timeout=60s
    Scroll Element Into View    xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Click Element               xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Sleep    2s
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Manage Publications')]    timeout=60s

TC05 Published Research Page
    [Documentation]    ตรวจสอบว่าหน้า Published Research เปิดขึ้นสำเร็จ
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Published research')]    timeout=60s
    Scroll Element Into View         xpath=//a[contains(text(),'Published research')]
    Wait Until Element Is Enabled    xpath=//a[contains(text(),'Published research')]    timeout=10s
    Click Element                    xpath=//a[contains(text(),'Published research')]
    Sleep    2s  # ป้องกันโหลดช้า
    Log To Console    * Checking URL *
    Wait Until Location Contains     /papers    timeout=60s
    Wait Until Page Contains         Published Research    timeout=60s

TC06 Call Papers
    Wait Until Element Is Visible    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]    timeout=30s
    Scroll Element Into View    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]
    Click Element    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]
    Sleep    2s
    Switch Window    NEW
    Wait Until Element Is Visible    name=username    timeout=30s

[Teardown]    Close Browser