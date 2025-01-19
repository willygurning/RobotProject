*** Keywords ***
Login
    Click Element    xpath=//*[@id="btn-make-appointment"]
    Input Text    id=txt-username    ${username}
    Input Password    id=txt-password    ${password}
    Click Button    id=btn-login

Open Web
    Open Browser    ${url}    chrome

*** Variables ***
${url}            https://katalon-demo-cura.herokuapp.com/
${username}       John Doe
${password}       ThisIsNotAPassword

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
TestCase1
    [Tags]    test1
    Open Browser    ${url}    chrome
    Click Element    xpath=//*[@id="btn-make-appointment"]
    Input Text    id=txt-username    ${username}
    Input Password    id=txt-password    ${password}
    Click Button    id=btn-login
    Click Element    id=combo_facility
    Click Element    xpath=//*[@id="combo_facility"]/option[1]
    Click Element    id=chk_hospotal_readmission
    Click Element    id=radio_program_medicaid
    Click Element    id =txt_visit_date
    Input Text    id=txt_visit_date    27/01/2025
    Sleep    3s
    Click Element    id=txt_comment
    Input Text    id=txt_comment    Ini merupakan teks
    Click Button    id=btn-book-appointment
    Page Should Contain    \    Appointment Confirmation
    Sleep    5s

TestCase2
    [Tags]    test2
    [Setup]    Open Web
    Login
    Click Element    id=combo_facility
    Click Element    xpath=//*[@id="combo_facility"]/option[1]
    Click Element    id=chk_hospotal_readmission
    Click Element    id=radio_program_medicaid
    Click Element    id =txt_visit_date
    Input Text    id=txt_visit_date    27/01/2025
    Sleep    3s
    Click Element    id=txt_comment
    Input Text    id=txt_comment    Ini merupakan teks
    Click Button    id=btn-book-appointment
    Page Should Contain    \    Appointment Confirmation
    Sleep    5s
    Close All Browsers
