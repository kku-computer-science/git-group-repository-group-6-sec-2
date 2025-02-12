*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}       Chrome
${URL}           https://cssegroup6sec267.cpkkuhost.com/
${RESEARCHER_NAME}    Somjit Arch-int, Ph.D
${Education R1}      2526 วท.บ. (สถิติ) มหาวิทยาลัยขอนแก่น
${Education R2}    2533 พบ.ม. (สถิติประยุกต์) สถาบันบัณฑิตพัฒนบริหารศาสตร์
${Email}    somjit@kku.ac.th

*** Test Cases ***
UT3.1 Test Home Page Can Be Accessed
    Open Browser    ${URL}    ${BROWSER}

UT2.1 Test Profile Pusadee
    Click Element    xpath=//a[@href='/researchers/all']
    Wait Until Location Contains    /researchers/all    timeout=10s
    Page Should Contain    Researchers
    Wait Until Page Contains Element    xpath=//button[text()='Infomation Technology']
    Click Element    xpath=//button[text()='Infomation Technology']
    Wait Until Location Contains    /researchers/2   timeout=10s 


UT2.3 Test Pusadee
    Wait Until Page Contains    Somjit Arch-int, Ph.D    timeout=10s
    Click Element    xpath=//a[div//h5[contains(text(), "Somjit Arch-int, Ph.D")]]
    Wait Until Location Contains   /detail    timeout=10s
    Page Should Contain    ${RESEARCHER_NAME}
    Page Should Contain    ${Email}
    Page Should Contain    ${Education R1} 
    Page Should Contain    ${Education R2}
    Page Should Contain    A conceptual framework for privacy preserving of association rule mining in e-commerce
 

 
UT3.5 click publications graph
    Sleep    3    # รอให้หน้าโหลด
    Click Element    css=a.btn-dark.btn-lg   
    Go Back
    Wait Until Location Contains   /detail 
    
UT3.6 click citation graph
    Sleep    3
    Click Element    css=a.btn-primary  
    Wait Until Location Contains   /citation-h-index
