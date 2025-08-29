*** Settings ***
Library           SeleniumLibrary
Variables         ./variables.robot

*** Keywords ***
Open Browser To Login Page
    Open Browser        ${URL}      ${BROWSER}

Enter Login Info
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_UP}
    Input Text                       id=password_l    ${VALID_dn_PP}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info Wrong_WW
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_UW}
    Input Text                       id=password_l    ${VALID_dn_PW}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info Wrong_PW
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_UP}
    Input Text                       id=password_l    ${VALID_dn_PW}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info Wrong_EW
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_UE}
    Input Text                       id=password_l    ${VALID_dn_PP}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info Wrong_PE
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_UP}
    Input Text                       id=password_l    ${VALID_dn_PE}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info Wrong_EE
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_UE}
    Input Text                       id=password_l    ${VALID_dn_PE}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info Wrong_SP
    Wait Until Element Is Visible    id=username_l    timeout=10s
    Input Text                       id=username_l    ${VALID_dn_US}
    Input Text                       id=password_l    ${VALID_dn_PP}
    Click Element    id=btn_login
    Sleep    1s

Enter Login Info IconEyes
    Input Text                       id=password_l    ${VALID_dn_PP}
    ${type_before}=    Get Element Attribute    id=password_l    type
    Should Be Equal As Strings    ${type_before}    password

    Click Element    css=i.btn_show_hide_passw
    Sleep    1s

    ${type_after}=    Get Element Attribute    id=password_l    type
    Should Be Equal As Strings    ${type_after}    text
    Sleep    1s

Check Error Message Should Appear
    [Arguments]    ${expected_text}
    Wait Until Page Contains Element    xpath=//div[contains(@class,"tooltipster-content")]/span    timeout=10s
    Element Text Should Be    xpath=//div[contains(@class,"tooltipster-content")]/span    ${expected_text}


Check Logo Is Displayed
    Element Should Be Visible    xpath=//a[@class="sidebar-brand d-flex align-items-center justify-content-center"]
    ${text}=    Get Text    xpath=//a[@class="sidebar-brand d-flex align-items-center justify-content-center"]/div
    Should Be Equal As Strings    ${text}    VRTOURISM


Check Sidebar Menus
    Wait Until Page Contains Element    xpath=//a[@class="sidebar-brand d-flex align-items-center justify-content-center"]/div[contains(text(),'VRTOURISM')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Bảng điều khiển')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Thống kê')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Tour du lịch ảo')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Đa phương tiện')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Xuất bản')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Dữ liệu được thu thập')]    10s
    Wait Until Page Contains Element    xpath=//span[contains(text(),'Quản trị viên')]    10s