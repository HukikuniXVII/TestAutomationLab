*** Settings ***
Library     SeleniumLibrary
Resource    ../resource.resource

*** Test Cases ***

TC_001
    [Documentation]    Empty First Name
    Open Workshop Registration Page

    Input Last Name       Sodyod
    Input Organization    CS KKU
    Input Email           somyod@kkumail.com
    Input Phone No        091-001-1234
    Submit Registration
    Verify Empty First Name Error
    [Teardown]    Close Browser

TC_002
    [Documentation]    Empty Last Name
    Open Workshop Registration Page
    Input First Name       Sodyod

    Input Organization    CS KKU
    Input Email           somyod@kkumail.com
    Input Phone No        091-001-1234
    Submit Registration
    Verify Empty First Name Error
    [Teardown]    Close Browser

TC_003
    [Documentation]    Empty First Name and Last Name
    Open Workshop Registration Page


    Input Organization    CS KKU
    Input Email           somyod@kkumail.com
    Input Phone No        091-001-1234
    Submit Registration
    Verify Empty Name Error
    [Teardown]    Close Browser

TC_004
    [Documentation]    Empty Email
    Open Workshop Registration Page
    Input First Name      Somyod
    Input Last Name       Sodsai
    Input Organization    CS KKU

    Input Phone No        091-001-1234
    Submit Registration
    Verify Empty Email Error
    [Teardown]    Close Browser

TC_005
    [Documentation]    Empty Phone Number
    Open Workshop Registration Page
    Input First Name      Somyod
    Input Last Name       Sodsai
    Input Organization    CS KKU
    Input Email           somyod@kkumail.com

    Submit Registration
    Verify Empty Phone Number Error
    [Teardown]    Close Browser

TC_006
    [Documentation]    Invalid Phone Number
    Open Workshop Registration Page
    Input First Name      Somyod
    Input Last Name       Sodsai
    Input Organization    CS KKU
    Input Email           somyod@kkumail.com
    Input Phone No        1234
    Submit Registration
    Verify Invalid Phone Number Error
    [Teardown]    Close Browser