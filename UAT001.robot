*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    Z:${/}SE${/}lab4${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}     Z:${/}SE${/}lab4${/}ChromeForTesting${/}chromedriver.exe
${URL}                    http://localhost:7272/Lab4/Registration.html

*** Test Cases ***
TC_002: Register Success
    # (ส่วน Test Case เหมือนเดิม)
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys, selenium.webdriver.chrome.service
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    
    Go To    ${URL}
    Input Text    id=firstname       Somyod
    Input Text    id=lastname        Sodsai
    Input Text    id=organization    CS KKU
    Input Text    id=email           somyod@kkumail.com
    Input Text    id=phone           091-001-1234
    Click Button    id=registerButton
    
    Wait Until Page Contains    Success
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.
    [Teardown]    Close Browser