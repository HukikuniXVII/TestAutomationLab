*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHROME_BROWSER_PATH}    Z:${/}SE${/}lab4${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}     Z:${/}SE${/}lab4${/}ChromeForTesting${/}chromedriver.exe
${URL}                    http://localhost:7272/Lab4/Registration.html

*** Keywords ***
Open Workshop Registration Page
    [Documentation]    Open Workshop Registration Page
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}=    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}=    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys, selenium.webdriver.chrome.service
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${URL}

Input First Name
    [Arguments]    ${firstname}
    Input Text    id=firstname    ${firstname}

Input Last Name
    [Arguments]    ${lastname}
    Input Text    id=lastname    ${lastname}

Input Organization
    [Arguments]    ${org}
    Input Text    id=organization    ${org}

Input Email
    [Arguments]    ${email}
    Input Text    id=email    ${email}

Input Phone No
    [Arguments]    ${phone}
    Input Text    id=phone    ${phone}

Submit Registration
    Click Button    id=registerButton

Verify Success Page
    Wait Until Page Contains    Success
    Title Should Be    Success
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.

Verify Empty First Name Error
    Page Should Contain    Workshop Registration
    Page Should Contain    Please enter your first name!!

Verify Empty Name Error
    Page Should Contain    Workshop Registration
    Page Should Contain    Please enter your name!!

Verify Empty Email Error
    Page Should Contain    Workshop Registration
    Page Should Contain    Please enter your email!!

Verify Empty Phone Number Error
    Page Should Contain    Workshop Registration
    Page Should Contain    Please enter your phone number!!

Verify Invalid Phone Number Error
    Page Should Contain    Workshop Registration
    Page Should Contain    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678