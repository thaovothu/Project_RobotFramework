*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot

*** Test Cases ***
[Module 1-1] Đăng ký với Email và Mật khẩu hợp lệ
    [Tags]    dangky    hop_le

    Open Browser To Login Page
    Enter Signup Info
    Check Text At XPath    //h2/b        ENTER ACCOUNT INFORMATION
    Fill Account Information
    Click Create Account Button
    Check Text At XPath    //h2/b        ACCOUNT CREATED!
    Location Should Be     https://automationexercise.com/account_created
    Check Text At XPath    //p[text()="Congratulations! Your new account has been successfully created!"]        
    ...                    Congratulations! Your new account has been successfully created!
    Check Text At XPath    //p[text()="You can now take advantage of member privileges to enhance your online shopping experience with us."]
    ...                    You can now take advantage of member privileges to enhance your online shopping experience with us.
    Close Browser

[Module 1-2] Đăng ký với Email đã tồn tại
    [Tags]    dangky    ton_tai
    
    Open Browser To Login Page
    Enter Signup Info
    Check Error Message Should Appear    Email Address already exist!
    Close Browser

[Module 1-3] Đăng ký với email sai định dạng
    [Tags]    dangky    sai_dinh_dang
    Open Browser To Login Page
    Input Text      name=name                             ${VALID_dk_U}
    Input Text      css=input[data-qa="signup-email"]     ${VALID_dk_G2}
    Click Button    css=button[data-qa="signup-button"]
    Check Error Message Should Appear    Invalid email address
    Close Browser
