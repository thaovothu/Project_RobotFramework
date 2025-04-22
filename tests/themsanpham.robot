*** Settings ***
Resource    ../resources/keywords.robot
Resource    ../resources/variables.robot


*** Test Cases ***
[Module 3-1]Thêm Sản Phẩm Vào Giỏ Hàng Thành Công khi đăng nhập thành công
    [Tag]   themasanpham    co_dangnhap

    Open Browser To Login Page
    Enter Login Info
    Click Link    xpath=//a[contains(text(), 'Products')]
    Location Should Be     https://automationexercise.com/products
    Execute JavaScript    document.querySelectorAll('iframe, div[id^="aswift"], ins.adsbygoogle').forEach(e => e.style.display = 'none');
    Sleep    1s
    Scroll Element Into View    xpath=//a[@data-product-id='1']
    Click Element    xpath=//a[@data-product-id='1']
    Wait Until Element Is Visible    xpath=//div[@class="modal-content"]    10s
    Element Should Contain    xpath=//h4[contains(@class, "modal-title")]    Added!
    Element Should Contain    xpath=//div[@class="modal-body"]/p    Your product has been added to cart.
    Click Button    xpath=//button[contains(text(), 'Continue Shopping')]
    Check Logo Image Is Displayed
    Close Browser

[Module 3-2]Thêm Sản Phẩm Vào Giỏ Hàng khi không đăng nhập
    [Tag]   themasanpham    khong_dangnhap
    
    Open Browser To Login Page
    Click Link    xpath=//a[contains(text(), 'Products')]
    Location Should Be     https://automationexercise.com/products
    Execute JavaScript    document.querySelectorAll('iframe, div[id^="aswift"], ins.adsbygoogle').forEach(e => e.style.display = 'none');
    Sleep    1s
    Scroll Element Into View    xpath=//a[@data-product-id='1']
    Click Element    xpath=//a[@data-product-id='1']
    Wait Until Element Is Visible    xpath=//div[@class="modal-content"]    10s
    Element Should Contain    xpath=//h4[contains(@class, "modal-title")]    Added!
    Element Should Contain    xpath=//div[@class="modal-body"]/p    Your product has been added to cart.
    Click Button    xpath=//button[contains(text(), 'Continue Shopping')]
    Check Logo Image Is Displayed
    Close Browser
