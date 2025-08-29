*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot


*** Test Cases ***
[TC_LOGIN 01]Kiểm tra khi nhập thông tin đăng nhập hợp lệ
    [Tags]    dangnhap    tai_khoa_hop_le

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info
    Check Logo Is Displayed
    Location Should Be     https://vrtourism.vn/backend/index.php
    Check Sidebar Menus
    Close Browser


[TC_LOGIN 02]Kiểm tra khi nhập sai tên đăng nhập/ email và sai mật khẩu
    [Tags]    dangnhap    sai_tai_khoan_va_sai_mat_khau

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info Wrong_WW
    Check Error Message Should Appear    You have entered an invalid username or email
    Close Browser


[TC_LOGIN 03]Kiểm tra khi nhập đúng tên đăng nhập/ email và sai mật khẩu
    [Tags]    dangnhap    dung_tai_khoan_va_sai_mat_khau

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info Wrong_PW
    Check Error Message Should Appear    You have entered an invalid password
    Close Browser


[TC_LOGIN 04]Kiểm tra khi bỏ trống trường Tên người dùng/ email
    [Tags]    dangnhap    trong_tai_khoan_va_sai_mat_khau

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info Wrong_EW
    Check Error Message Should Appear    Please enter in this field
    Close Browser


[TC_LOGIN 05]Kiểm tra khi bỏ trống trường Mật khẩu 
    [Tags]    dangnhap    dung_tai_khoan_va_trong_mat_khau

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info Wrong_PE
    Check Error Message Should Appear   Please enter in this field
    Close Browser


[TC_LOGIN 06]Kiểm tra bỏ trống tất cả các trường  
    [Tags]    dangnhap    trong_tai_khoan_va_trong_sai_mat_khau

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info Wrong_EE
    Check Error Message Should Appear   Please enter in this field
    Close Browser


[TC_LOGIN 07]Kiểm tra khi nhập tên người dùng bằng ký tự không hợp lệ (ví dụ: <script>, Unicode)
    [Tags]    dangnhap    tai_khoan_ky_tu_khong_hop_le_va_dung_mat_khau

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info Wrong_SP
    Check Error Message Should Appear  You have entered an invalid username or email
    Close Browser

[TC_LOGIN 08]Kiểm tra khi nhấn vào icon con mắt (Hiển thị mật khẩu)
    [Tags]    dangnhap    nhap_mat_khau_va_nhan_mat

    Open Browser To Login Page
    Maximize Browser Window
    Enter Login Info IconEyes
    Close Browser
