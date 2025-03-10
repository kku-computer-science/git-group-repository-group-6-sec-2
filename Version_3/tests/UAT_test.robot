*** Settings ***
Library    SeleniumLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${BROWSER}    Chrome
# ${URL}        https://cssegroup6sec267.cpkkuhost.com/
${URL}        http://127.0.0.1:8000/
${JSON_FILE}  ..\Version_3\code\public\punpun.json


*** Test Cases ***
TC01 Open Event Registration Page
    [Documentation]    เปิดเว็บไซต์
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

TC02 Login Button
    [Documentation]    ปุ่ม Login
    Wait Until Element Is Visible    xpath=//a[contains(@class,'btn-solid-sm') and text()='Login']
    Scroll Element Into View    xpath=//a[contains(@class,'btn-solid-sm') and text()='Login']
    Click Element    xpath=//a[contains(@class,'btn-solid-sm') and text()='Login']
    Switch Window    NEW
    Wait Until Element Is Visible    name=username

TC03 Login System
    Input Text    name=username    punhor1@kku.ac.th
    Input Text    name=password    123456789
    Click Button    xpath=//button[@type='submit']
    Wait Until Page Contains    Dashboard

TC04 Manage Publications
    Wait Until Page Contains    Manage Publications    timeout=60s
    Scroll Element Into View    xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Click Element               xpath=//a[@data-bs-toggle='collapse' and @aria-controls='ManagePublications']
    Wait Until Element Is Visible    xpath=//span[contains(text(),'Manage Publications')]    timeout=60s

TC05 Published Research Page
    [Documentation]    ตรวจสอบว่าหน้า Published Research เปิดขึ้นสำเร็จ
    Wait Until Element Is Visible    xpath=//a[contains(text(),'Published research')]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Click Element                    xpath=//a[contains(text(),'Published research')]
    Wait Until Location Contains     /papers
    Wait Until Element Is Visible    xpath=//h1[contains(text(),'Published Research')]

TC06 Call Papers
    [Documentation]    กดปุ่ม Call Paper และตรวจสอบว่าหน้า login เปิดขึ้นเร็วที่สุด
    
    # รอให้ปุ่ม Call Paper แสดงและกดได้
    Wait Until Element Is Visible    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]    timeout=60s
    Wait Until Element Is Enabled    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]    timeout=60s
    # เลื่อนให้ปุ่ม Call Paper อยู่ในมุมมอง
    Scroll Element Into View    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]
    # กดปุ่ม Call Paper
    Click Element    xpath=//a[contains(@class,'btn btn-primary btn-icon-text btn-sm mb-3') and contains(text(),'Call Paper')]
    # รอให้ popup "Success!" ปรากฏขึ้น (ตรวจสอบจากตัวหนังสือ)
    Wait Until Page Contains    Success!    timeout=60s
    # รอให้ปุ่ม OK แสดงและกดได้
    Wait Until Element Is Visible    xpath=//button[contains(@class,'swal2-confirm')]    timeout=60s
    Wait Until Element Is Enabled    xpath=//button[contains(@class,'swal2-confirm')]    timeout=60s
    # คลิกปุ่ม OK
    sleep    2s
    Click Element    xpath=//button[contains(@class,'swal2-confirm')]
    # ตรวจสอบว่า popup ถูกปิดจริง
    Wait Until Element Is Not Visible    xpath=//button[contains(@class,'swal2-confirm')]    timeout=20s
    # จับภาพหน้าจอเพื่อดีบัก
    Capture Page Screenshot    path=./screenshot_after_popup.png

[Teardown]    Close Browser