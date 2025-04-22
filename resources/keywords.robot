*** Settings ***
Library           SeleniumLibrary
Variables         ./variables.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${URL}      ${BROWSER}

Enter Login Info
    Wait Until Element Is Visible    css=input[data-qa="login-email"]    timeout=10s
    Input Text    css=input[data-qa="login-email"]    ${VALID_dk_G}
    Input Text      css=input[data-qa="login-password"]    ${VALID_dk_P}
    Click Button    css=button[data-qa="login-button"]
    Sleep    1s
Enter Login Info Wrong
    Input Text      css=input[data-qa="login-email"]       ${VALID_dk_G}
    Input Text      css=input[data-qa="login-password"]    {VALID_P}
    Click Button    css=button[data-qa="login-button"]

Enter Login Email Wrong
    Input Text      css=input[data-qa="login-email"]       ${VALID_dn_G3}
    Input Text      css=input[data-qa="login-password"]    ${VALID_dn_P2}
    Click Button    css=button[data-qa="login-button"]

Check Text At XPath
    [Arguments]    ${xpath}    ${expected_text}
    Wait Until Element Is Visible    ${xpath}    10s
    ${text}=       Get Text    ${xpath}
    Should Be Equal As Strings    ${text}    ${expected_text}

Check Error Message Should Appear
    [Arguments]    ${expected_text}
    Wait Until Page Contains    ${expected_text}    timeout=10s
    ${txt}=    Get Text    xpath=//p[contains(text(),"${expected_text}")]
    Should Be Equal As Strings    ${txt}    ${expected_text}
    
Check Logo Image Is Displayed
    Element Should Be Visible    xpath=//img[@alt="Website for automation practice"]
    ${src}=    Get Element Attribute    xpath=//img[@alt="Website for automation practice"]    src
    Should Contain    ${src}    /static/images/home/logo.png

Enter Signup Info
    Input Text      name=name                             ${VALID_dk_U}
    Input Text      css=input[data-qa="signup-email"]     ${VALID_dk_G}
    Click Button    css=button[data-qa="signup-button"]

Fill Account Information
    Input Text    id=password        ${VALID_dk_P}
    Input Text    id=first_name      ${VALID_dk_F}
    Input Text    id=last_name       ${VALID_dk_L}
    Input Text    id=company         ${VALID_dk_C}
    Input Text    id=address1        ${VALID_dk_A1}
    Input Text    id=address2        ${VALID_dk_A2}
    Input Text    id=state           ${VALID_dk_S}
    Input Text    id=city            ${VALID_dk_Ci}
    Input Text    id=zipcode         ${VALID_dk_Z}
    Input Text    id=mobile_number   ${VALID_dk_M}

Click Create Account Button
    Wait Until Element Is Visible    css=button[data-qa="create-account"]    15s
    Scroll Element Into View         css=button[data-qa="create-account"]
    Sleep    2s
    Click Button                     css=button[data-qa="create-account"]
