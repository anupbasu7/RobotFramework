*** Settings ***
Documentation   To validate the login form
Library  SeleniumLibrary
Library    Telnet
Test Setup      open the browser with the Mortgage payment url
Test Teardown       Close Browser Session
Resource        ./resource.robot

*** Variables ***
${Error_Message_Login}      css:.alert-danger
${shop_page_load}           css: .nav-link

*** Test Cases ***
TC To Validate Login form
    Fill the login form     ${username}     ${invalid_password}
    wait until element is located in the page       ${Error_Message_Login}
    verify error message is correct

TC To Validate Cards display in the Shopping Page
    Fill the login form     ${user_name}    ${valid_password}
    wait until element is located in the page       ${shop_page_load}
    Verify Card titles in the Shop page



*** Keywords ***

Fill the login form
    [Arguments]     ${username}     ${password}
#    Set Selenium Speed    1
    Input Text    id:username    ${username}
    #or can use Input Password - if we use this will be not save in log file or report file
    Input Text    id:password    ${password}
#    Click Button    id:signInBtn   OR
    Click Button    signInBtn

#Wait until it checks and display error message
#    #Synchronization Robot Keywords
#    Wait Until Element Is Visible    ${Error_Message_Login}
    
wait until element is located in the page
    [Arguments]     ${element}
    Wait Until Element Is Visible    ${element}

verify error message is correct
    #validate and Create variable and store
    ${result}=      Get Text    ${Error_Message_Login}
    #compare between values in actual result with expected result to validate-using builtin keyword
    Should Be Equal As Strings    ${result}    Incorrect username/password.
    #OR we can use the below keyword
#    Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

Verify Card titles in the Shop page
    #create a list
    @{expectedList}=   Create List     iphone X    Samsung Note 8      Nokia Edge      Blackberry
    ${elementList}=   Get WebElements    css:.card-title
    FOR    ${elements}    IN   @{elementList}
    #python syntax
        log     ${elements.text}
    END
    