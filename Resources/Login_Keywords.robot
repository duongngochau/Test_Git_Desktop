*** Settings ***
Variables  ../Locators/Common_Locators.py

*** Keywords ***

Open the browser and go to the admin page
    [Arguments]     ${url}     ${browser}

    open browser    ${url}    ${browser.lower()}

    set selenium speed    ${SELENIUM_SPEED}

    Maximize Browser Window

    ${current_title}        Get Title

    should be equal     ${TITLE}    ${current_title}

The User Logins To the System
    [Arguments]     ${username}     ${password}

    Common - Input text to element      ${username_locator}     ${username}

    Common - Input text to element     ${password_locator}      ${password}

    Common - Click on a button          ${btn_login_locator}

    Verify the user logins to the Admin page successfully

Verify the user logins to the Admin page successfully

    ${title_current_page}       Common - Get the title on the current page      ${user_icon_locator}

    should be equal     ${TITLE}     ${title_current_page}

Close All Browsers

    Close browser

Click on the context menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element        ${bnt_context_menu}