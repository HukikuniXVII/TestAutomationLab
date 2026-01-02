*** Settings ***
Library     SeleniumLibrary
Resource    ../resource.resource

*** Test Cases ***

TC_001
    [Documentation]    Register Success
    Open Workshop Registration Page
    Input First Name      Somyod
    Input Last Name       Sodsai
    Input Organization    CS KKU
    Input Email           somyod@kkumail.com
    Input Phone No        091-001-1234
    Submit Registration
    Verify Success Page
    [Teardown]    Close Browser

TC_002
    [Documentation]    No Organization Info
    Open Workshop Registration Page
    Input First Name      Somyod
    Input Last Name       Sodsai
    
    Input Email           somyod@kkumail.com
    Input Phone No        091-001-1234
    Submit Registration
    Verify Success Page
    [Teardown]    Close Browser