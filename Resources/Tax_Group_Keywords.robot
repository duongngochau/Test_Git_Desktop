*** Settings ***
Variables  ../Locators/Common_Locators.py
Variables  ../Locators/Tax_Group_Locators.py
Library    SeleniumLibrary

*** Variables ***
${tax_group_title_form}      THÊM NHÓM THUẾ
${message}       Đã xóa dữ liệu được chọn

*** Keywords ***

Tax Group - Navigate to the Sales Tax Group page

    Menu - Click on the Finance Management menu

    Menu - Click on the Sales Tax Group List menu

Tax Group - Create a new Tax Group

    [Arguments]     ${code}      ${name}

    Tax Group - Click on the create button

    Tax Group - Input information for the Tax Group     ${code}      ${name}

Tax Group - Click on the create button

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element      ${tax_group_btn_create}

    Tax Group - Verify the title of the create form

Tax Group - Verify the title of the create form

    ${get_title_create_form}    Common - Get text an element        ${tax_group_title_create_form}

    should be equal      ${get_title_create_form}         ${tax_group_title_form}

Tax Group - Input information for the Tax Group

    [Arguments]    ${code}      ${name}

    Tax Group - Input the Tax Group Code        ${code}

    Tax Group - Input the Tax Group Name      ${name}

Tax Group - Input the Tax Group Code

    [Arguments]   ${code}

    Common - Input text to element      ${tax_group_txt_code}       ${code}

Tax Group - Input the Tax Group Name

    [Arguments]   ${name}

    Common - Input text to element      ${tax_group_txt_name}       ${name}

Tax Group - Click on the Save button

    Common - Click on an element      ${tax_group_btn_save}

Tax Group - Verify the successful message should be displayed on the page after creating a new ta group successfully

    [Arguments]  ${name}

    ${get_successful_message}    Common - Get text an element        ${tax_group_successful_message}

    should be equal      ${get_successful_message}         Nhóm thuế ${name} tạo thành công!

    Wait Until Page Does Not Contain Element    ${tax_group_successful_message}      ${TIMEOUT}

Tax Group - Verify the tax group created successfully after clicking on the Save button

    [Arguments]     ${code}     ${name}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Tax Group - Select a Tax Group     ${code}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_code}     Common - Get value an element       ${tax_group_txt_code_edit}

    ${get_name}     Common - Get value an element       ${tax_group_txt_name_edit}

    should be equal     ${get_code}     ${code}

    should be equal     ${get_name}     ${name}

    Tax Group - click on the Cancel button

Tax Group - Select a Tax Group

    [Arguments]     ${code}

    Common - Double click on an element      ${tax_group_link_code.replace('value','${code}')}

Tax Group - click on the Cancel button

    Common - Click on an element      ${tax_group_btn_cancel_edit}

Tax Group - Verify the tax group doesn't exist on the tax group list

    [Arguments]   ${code}=NULL   ${code_edit}=NULL

    ${status_code}         Run Keyword If      '${code}'!='NULL'      Run Keyword And Return Status   Wait Until Element Is Visible     ${tax_group_link_code.replace('value','${code}')}      ${TIMEOUT}
    ...   ELSE       Set Variable    Fail

    ${status_code_edit}         Run Keyword If      '${code_edit}'!='NULL'      Run Keyword And Return Status   Wait Until Element Is Visible     ${tax_group_link_code.replace('value','${code_edit}')}      ${TIMEOUT}
    ...   ELSE       Set Variable    Fail

    Run Keyword If     '${status_code}'=='Fail' and '${status_code_edit}'=='True'       Tax Group - click on the delete button        ${code_edit}

    ...    ELSE IF      '${status_code}'=='True' and '${status_code_edit}'=='Fail'    Tax Group - click on the delete button        ${code}

    ...    ELSE IF      '${status_code}'=='False' and '${status_code_edit}'=='True'    Tax Group - click on the delete button        ${code_edit}

    ...    ELSE IF      '${status_code}'=='True' and '${status_code_edit}'=='False'    Tax Group - click on the delete button        ${code}

    ...    ELSE IF      '${status_code}'=='True' and '${status_code_edit}'=='True'     Run Keywords      Tax Group - click on the delete button        ${code}

    ...    AND      Tax Group - click on the delete button        ${code_edit}

    ...    ELSE      Log    The unit of measurement doesn't exist on the UOM list

Tax Group - click on the delete button

    [Arguments]     ${code}   ${message}

    Sleep   1s

    Tax Group - Checkbox a UOM        ${code}

    Common - Click on an element      ${tax_group_btn_delete}

    Common - Click on an element      ${tax_group_btn_confirm_delete}

    Tax Group - Verify the tax group deleted successfully        ${code}     ${message}

Tax Group - Checkbox a UOM

    [Arguments]   ${code}

    Common - Click on an element      ${tax_group_checkbox_code.replace('value','${code}')}

Tax Group - Verify the tax group deleted successfully

    [Arguments]   ${code}       ${message}

    ${get_delete_message}    Common - Get text an element        ${tax_group_delete_message}

    should be equal      ${get_delete_message}        ${message}

    Wait Until Page Does Not Contain Element   ${tax_group_delete_message}      ${TIMEOUT}

#    Wait Until Element Is Not Visible       ${tax_group_delete_message}      ${TIMEOUT}

    ${status}    Run Keyword And Return Status      Wait Until Element Is Not Visible     ${tax_group_checkbox_code.replace('value','${code}')}      ${TIMEOUT}

    Run Keyword If     '${status}'=='True'       Log    passed

    ...    ELSE         Log    failed