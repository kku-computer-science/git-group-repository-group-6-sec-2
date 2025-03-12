*** Settings ***
Documentation       Test automation for verifying researcher profile data.
Library            SeleniumLibrary

*** Variables ***
${BROWSER}         Firefox
${URL}            https://cssegroup6sec267.cpkkuhost.com/

# Researcher Statistics
${H_INDEX}         10
${CITATION}        465
${I10_INDEX}       10
${SUMMARY}         27
${SCOPUS}          23
${WOS}             0
${TCI}             2
${GOOGLE_SCHOLAR}  2

*** Test Cases ***
TC01 Verify Researcher Profile Statistics
    [Documentation]    Open the web page, navigate to the researcher profile, and validate statistics.
    Open Researcher Profile
    Validate Researcher Statistics
    [Teardown]    Close Browser

*** Keywords ***
Open Researcher Profile
    [Documentation]    Navigate to the researcher's profile page.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//a[@href='/researchers/all']
    Click Element    xpath=//button[text()='Computer Science']
    Click Element    xpath=//h5[contains(@class, 'card-title') and contains(text(), 'Punyaphol Horata')]

Validate Researcher Statistics
    [Documentation]    Validate researcher statistics on the profile page.
    Sleep    10s
    Element Text Should Be    id=h-index-result            ${H_INDEX}
    Element Text Should Be    id=i10-index-result          ${I10_INDEX}
    Element Text Should Be    id=total-citations-result    ${CITATION}

    Element Should Contain    id=scopus_sum                ${SCOPUS}
    Element Should Contain    id=wos_sum                   ${WOS}
    Element Should Contain    id=tci_sum                   ${TCI}
    Element Should Contain    id=google_scholar            ${GOOGLE_SCHOLAR}
    Element Should Contain    id=all                       ${SUMMARY}