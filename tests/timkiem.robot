*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot
*** Test Cases ***
[Module 4-1] Tìm kiếm 3 sản phẩm có ký tự T đăng nhập thành công
    [Tags]    timkiem    3sp1kt_co_dangnhap

    Open Browser To Login Page
    Enter Login Info
    Click Link    xpath=//a[contains(text(), 'Products')]
    Location Should Be     https://automationexercise.com/products
    Input Text    id=search_product    T
    Wait Until Element Is Visible    id=submit_search    10s
    Click Button    id=submit_search
    Wait Until Element Is Visible    xpath=//img[contains(@src, '/get_product_picture/1')]    10s
    Element Should Be Visible        xpath=//img[contains(@src, '/get_product_picture/1')]
    Wait Until Element Is Visible    xpath=//img[contains(@src, '/get_product_picture/2')]    10s
    Element Should Be Visible        xpath=//img[contains(@src, '/get_product_picture/2')]
    Wait Until Element Is Visible    xpath=//img[contains(@src, '/get_product_picture/4')]    10s
    Element Should Be Visible        xpath=//img[contains(@src, '/get_product_picture/4')]
    Check Logo Image Is Displayed
    Close Browser

[Module 4-2] Tìm kiếm toàn bộ sản phẩm có ký tự T đăng nhập thành công
    [Tags]    timkiem    toanbo1kt_co_dangnhap

    Open Browser To Login Page
    Enter Login Info
    Click Link    xpath=//a[contains(text(), 'Products')]
    Location Should Be     https://automationexercise.com/products
    Input Text    id=search_product    T
    Wait Until Element Is Visible    id=submit_search    10s
    Click Button    id=submit_search
    Wait Until Element Is Visible    xpath=//img[contains(@src, '/get_product_picture')]    10s
    Element Should Be Visible        xpath=//img[contains(@src, '/get_product_picture')]
    Check Logo Image Is Displayed
    Close Browser

[Module 1-3] Tìm kiếm toàn bộ sản phẩm có chữ Top đăng nhập thành công
    [Tags]    timkiem    toanbochu_co_dangnhap
    
    Open Browser To Login Page
    Enter Login Info

    Click Link    xpath=//a[contains(text(), 'Products')]
    Location Should Be     https://automationexercise.com/products
    Input Text    id=search_product    Top
    Wait Until Element Is Visible    id=submit_search    10s
    Click Button    id=submit_search
    Wait Until Element Is Visible    xpath=//img[contains(@src, '/get_product_picture')]    10s
    Element Should Be Visible        xpath=//img[contains(@src, '/get_product_picture')]

    Check Logo Image Is Displayed
    Close Browser

[Module 1-4] Tìm kiếm sản phẩm không có trong cửa hành khi đăng nhập thành Công
    [Tags]    timkiem    khongtontai_co_dangnhap

    Open Browser To Login Page
    Enter Login Info
    Click Link    xpath=//a[contains(text(), 'Products')]
    Location Should Be     https://automationexercise.com/products
    Input Text    id=search_product    Váy trắng
    Wait Until Element Is Visible    id=submit_search    10s
    Click Button    id=submit_search
    Wait Until Element Is Visible    xpath=//h2[text()='Searched Products']    10s
    ${product_count}=    Get Element Count    xpath=//div[@class='product-image-wrapper']
    Should Be Equal As Integers    ${product_count}    0
    Check Logo Image Is Displayed
    Close Browser
