*** Settings ***
Library    SeleniumLibrary
*** Keywords ***

Common - Click on an element

    [Documentation]   Click the element identified by locator.

    [Arguments]  ${locator}     ${modifier}=NULL     ${action_chain}=NULL

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Click Element    ${locator}     ${modifier}     ${action_chain}

Common - Choose a value from combobox

    [Documentation]  Click the combobox and choose a value identified by locator
    
    [Arguments]   ${combobox}    ${combobox_value}

    Wait Until Page Contains Element   ${combobox}    ${TIMEOUT}
    
    Wait Until Element Is Visible    ${combobox}    ${TIMEOUT}
    
    Click Element    ${combobox}
    
    Scroll Element Into View    ${combobox}
    
    Wait Until Page Contains Element    ${combobox_value}    ${TIMEOUT}
    
    Wait Until Element Is Visible    ${combobox_value}    ${TIMEOUT}
    
    Click Element    ${combobox_value}

Common - Click on a button

    [Documentation]  Clicks the button identified by locator.

    [Arguments]  ${locator}     ${modifier}=NULL

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Click Button    ${locator}      ${modifier}

Common - Input text to element

    [Documentation]   Types the given text into the text field identified by locator.

    [Arguments]  ${locator}     ${text}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Input Text      ${locator}      ${text}     clear=True
    
Common - Get text an element

    [Documentation]  Returns the text value of the element identified by locator.

    [Arguments]    ${locator}

    [Return]    ${get_text_element}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    ${get_text_element}     Get Text   ${locator}

Common - Get attribute an element

    [Documentation]  Returns the attribute of the element identified by locator.

    [Arguments]    ${locator}   ${attribute}

    [Return]    ${get_attribute_element}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    ${get_attribute_element}     Get Element Attribute     ${locator}    ${attribute}

Common - Press a key on the keyboard

    [Documentation]   Simulates the user pressing key(s) to an element or on the active browser.

    [Arguments]  ${locator}     ${name_key}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Press Keys     ${locator}     ${name_key}

Common - Get the title on the current page

    [Documentation]  Returns the title of the current page.

    [Arguments]  ${locator}

    [Return]   ${get_title_current_page}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    ${get_title_current_page}       Get Title

Common - Double click on an element

    [Documentation]  Double clicks the element identified by locator.

    [Arguments]  ${locator}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Double Click Element        ${locator}

Common - Clear text on an element

    [Documentation]  Clears the value of the text-input-element identified by locator.

    [Arguments]  ${locator}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Clear Element Text      ${locator}

Common - Click link

    [Documentation]   Clicks a link identified by locator.

    [Arguments]  ${locator}     ${modifier}=NULL

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    Click Link      ${locator}      ${modifier}

Common - Close a window

    [Documentation]  Closes currently opened and selected browser window/tab.

    Close Window

Common - Close the current browser

    [Documentation]  Closes the current browser.

    Close Browser

Common - Close all open browsers

    [Documentation]  Closes all open browsers and resets the browser cache.

    Close All Browsers

Common - Wait until the loading icon loads successfully

    [Documentation]    The loading icon loads when the user navigates to another page. This keyword will check the loading icon that loaded successfully.

    [Arguments]  ${locator}

    Wait Until Page Contains Element    ${locator}         ${TIMEOUT}

Common - Get value an element

    [Documentation]    Returns the value attribute of the element identified by locator.

    [Arguments]  ${locator}

    [Return]    ${get_value}

    Wait Until Element Is Visible    ${locator}    ${TIMEOUT}

    ${get_value}      Get Value        ${locator}

Common - Upload File

    [Arguments]  ${locator}  ${file_path}

    wait until page contains element    ${locator}    ${TIMEOUT}

    choose file    ${locator}    ${file_path}

Common - Get data from a column

    [Arguments]   ${table_locator}      ${column_number}

    [Return]    ${column_output_data}

    Wait Until Page Contains Element    ${table_locator}     ${TIMEOUT}

    ${xpath}    Set Variable    ${table_locator}//tr
    ${count}    Get Element Count    ${xpath}
    ${column_output_data}    Create List
    FOR    ${i}    IN RANGE    1    ${count} + 1

        ${name}     Get Table Cell    ${table_locator}     ${i}    ${column_number}
        Append To List    ${column_output_data}    ${name}

    END

    Log    ${column_output_data}

Common - Search data

    [Arguments]   ${text}

    Common - Input text to element    ${txt_search}    ${text}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${data_table_row}  ${TIMEOUT}

    Common - Press a key on the keyboard    ${txt_search}    TAB

Common - Element should be visible for at least
    [Arguments]  ${locator}  ${time}
    Wait until element is visible  ${locator}
    Sleep    ${time}
    Element should be visible  ${locator}  0.1s

Common - Currency format

    [Arguments]   ${data_input}

    [Return]   ${currstring}

	${number} = 		Set Variable	${data_input}

	${currstring} = 	Evaluate		"{:,.0f} ₫".format(${number})

	Log   ${currstring}
Common - Log out the current user
    Common - Click on an element    ${user_icon_locator}
    Common - Click on an element    ${logout_button}