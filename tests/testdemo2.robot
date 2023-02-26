*** Settings ***
Documentation   To validate the login form
Library  SeleniumLibrary
Library    Telnet
Test Setup      open the browser with the Mortgage payment url
Test Teardown       Close Browser Session
Resource        ./resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger

*** Test Cases ***
TC To Validate Login form
    Fill the login form
    Wait until it checks and display error message
    verify error message is correct

*** Keywords ***

Fill the login form
#    Set Selenium Speed    1
    Input Text    id:username    ${user_name}
    #or can use Input Password - if we use this will be not save in log file or report file
    Input Text    id:password    ${invalid_password}
#    Click Button    id:signInBtn   OR
    Click Button    signInBtn

Wait until it checks and display error message
    #Synchronization Robot Keywords
    Wait Until Element Is Visible    ${Error_Message_Login}

verify error message is correct
    #validate and Create variable and store
    ${result}=      Get Text    ${Error_Message_Login}
    #compare between values in actual result with expected result to validate-using builtin keyword
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    #OR we can use the below keyword
#    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

