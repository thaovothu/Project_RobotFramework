*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot


*** Test Cases ***
[Module 2-1]Đăng nhập với Email và Mật khẩu hợp lệ
    [Tags]    dangnhap    hop_le

    Open Browser To Login Page
    Enter Login Info
    Check Logo Image Is Displayed
    Location Should Be     https://automationexercise.com/
    Wait Until Element Is Visible    xpath=//h1/span    timeout=10s
    Check Text At XPath              //h1/span          Automation
    Wait Until Element Is Visible    xpath=//h2[contains(text(),'Full-Fledged practice website for Automation Engineers')]    timeout=10s
    Check Text At XPath              //h2               Full-Fledged practice website for Automation Engineers
    Wait Until Page Contains Element    xpath=//h2[contains(text(),'Category')]    10s
    Wait Until Page Contains Element    xpath=//h2[contains(text(),'Brands')]    10s
    Wait Until Page Contains Element    xpath=//h2[contains(text(),'Features Items')]    10s
    Close Browser

[Module 2-2]Đăng nhập với Email hợp lệ nhưng sai mật khẩu
    [Tags]    dangnhap    sai_mat_khau

    Open Browser To Login Page
    Enter Login Info Wrong
    Check Error Message Should Appear    Your email or password is incorrect!
    Close Browser

[Module 2-3]Đăng nhập với Email sai định dạng, nhưng thành công đăng ký
    [Tags]    dangnhap    sai_dinh_dang
    
    Open Browser To Login Page
    Enter Login Email Wrong
    Check Error Message Should Appear    Your email is in the wrong format!
    Close Browser
