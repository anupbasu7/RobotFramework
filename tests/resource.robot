*** Settings ***
Documentation   A resource file with reusable keywords and variables.
...
...             The system specific keywords created here from our own domain specific language.
...             They utilize keywords provided by the imported SeleniumLibrary.
Library         SeleniumLibrary

*** Variables ***
${user_name}        Anup
${invalid_password}     LetGo
${url}          https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***

open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=/webdriver/chromedriver.exe
    Go To    ${url}
#    Set Selenium Implicit Wait    5

Close Browser Session
    Close Browser