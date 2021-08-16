*** Settings ***
Variables  ../Locators/Common_Locators.py
Variables  ../Locators/Unit_Of_Measurement_Locators.py

*** Variables ***
${delete_message}       Đã xóa đơn vị được chọn
${title_create_form}        TẠO ĐƠN VỊ TÍNH
*** Keywords ***
UOM - Create a new unit of measurement

    [Arguments]     ${code}   ${name}   ${description}

    UOM - Click on the Create new unit of measurement

    UOM - Input information for the unit of measurement     ${code}   ${name}   ${description}

    UOM - Click on the Save button

UOM - Navigate to the unit of measurement list

    Menu - Click on the Category Management menu

    Menu - Click on the unit of measurement menu

UOM - Click on the Create new unit of measurement

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element      ${uom_btn_create}

    UOM - Verify the title of the create form

UOM - Verify the title of the create form

    ${get_title_create_form}    Common - Get text an element        ${uom_title_create_form}

    should be equal      ${get_title_create_form}         ${title_create_form}

UOM - Input information for the unit of measurement

    [Arguments]     ${code}   ${name}   ${description}

    UOM - Input code        ${code}

    UOM - Input name        ${name}

    UOM - Input description     ${description}

UOM - Input code

    [Arguments]    ${code}

    Sleep   1s

    Common - Input text to element      ${uom_txt_code}       ${code}

UOM - Input name

    [Arguments]    ${name}
    sleep  1s
    Common - Input text to element      ${uom_txt_name}       ${name}

UOM - Input description

    [Arguments]    ${description}
    sleep  1s
    Common - Input text to element      ${uom_txt_description}       ${description}

UOM - Click on the Save button

    Common - Click on an element      ${uom_btn_save}

UOM - click on the Cancel button

    Common - Click on an element      ${uom_btn_edit_cancel}

UOM - Verify the success message should be displayed on the page after creating a new unit of measurement

    [Arguments]  ${name}

    ${get_success_message}    Common - Get text an element        ${uom_success_message}

    should be equal      ${get_success_message}         Đơn vị tính ${name} tạo thành công

    Wait Until Element Is Not Visible       ${uom_success_message}      ${TIMEOUT}

UOM - Verify the success message should be displayed on the page after editing a new unit of measurement

    [Arguments]  ${name}

    ${get_success_message}    Common - Get text an element        ${uom_success_message}

    should be equal      ${get_success_message}         Đơn vị tính ${name} sửa thành công

    Wait Until Element Is Not Visible       ${uom_success_message}      ${TIMEOUT}

UOM - Verify the UOM created successfully after clicking on the Save button

    [Arguments]     ${code}     ${name}     ${description}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    UOM - Select a UOM Code      ${code}

    Sleep   1s

    ${get_code}     Common - Get value an element       ${uom_txt_edit_code}

    ${get_name}     Common - Get value an element       ${uom_txt_edit_name}

    ${get_description}    Common - Get text an element        ${uom_txt_edit_description}

    should be equal     ${get_code}     ${code}

    should be equal     ${get_name}     ${name}

    should be equal     ${get_description}     ${description}

    UOM - click on the Cancel button

UOM - Select a UOM Code

    [Arguments]   ${code}
    sleep  1s
    Common - Double click on an element      ${uom_link_code.replace('value','${code}')}

URM - Checkbox a UOM

    [Arguments]   ${code}
    sleep  1s
    Common - Click on an element      ${uom_checkbox_code.replace('value','${code}')}

UOM - click on the delete button

    [Arguments]     ${code}

    URM - Checkbox a UOM        ${code}

    Common - Click on an element      ${uom_btn_delete}

    Common - Click on an element      ${uom_btn_confirm_delete}

    UOM - Verify the unit of measfurement deleted successfully        ${code}     ${delete_message}

UOM - Verify the unit of measfurement deleted successfully

    [Arguments]   ${code}       ${delete_message}

    ${get_delete_message}    Common - Get text an element        ${uom_delete_message}

    should be equal      ${get_delete_message}        ${delete_message}

    Wait Until Element Is Not Visible       ${uom_delete_message}      ${TIMEOUT}

    ${status}    Run Keyword And Return Status      Wait Until Element Is Not Visible     ${uom_checkbox_code.replace('value','${code}')}      ${TIMEOUT}

    Run Keyword If     '${status}'=='True'       Log    passed

    ...    ELSE         Log    failed

UOM - Verify the unit of measurement doesn't exist on the UOM list

    [Arguments]   ${code}=NULL   ${code_edit}=NULL

    ${status_code}         Run Keyword If      '${code}'!='NULL'      Run Keyword And Return Status   Wait Until Element Is Visible     ${uom_link_code.replace('value','${code}')}      ${TIMEOUT}
    ...   ELSE       Set Variable    Fail

    ${status_code_edit}         Run Keyword If      '${code_edit}'!='NULL'      Run Keyword And Return Status   Wait Until Element Is Visible     ${uom_link_code.replace('value','${code_edit}')}      ${TIMEOUT}
    ...   ELSE       Set Variable    Fail

    Run Keyword If     '${status_code}'=='Fail' and '${status_code_edit}'=='True'       UOM - click on the delete button        ${code_edit}

    ...    ELSE IF      '${status_code}'=='True' and '${status_code_edit}'=='Fail'    UOM - click on the delete button        ${code}

    ...    ELSE IF      '${status_code}'=='False' and '${status_code_edit}'=='True'    UOM - click on the delete button        ${code_edit}

    ...    ELSE IF      '${status_code}'=='True' and '${status_code_edit}'=='False'    UOM - click on the delete button        ${code}

    ...    ELSE IF      '${status_code}'=='True' and '${status_code_edit}'=='True'     Run Keywords      UOM - click on the delete button        ${code}

    ...    AND      UOM - click on the delete button        ${code_edit}

    ...    ELSE      Log    The unit of measurement doesn't exist on the UOM list

UOM - Edit the unit of measurement

    [Arguments]     ${code}     ${edit_code}     ${edit_name}    ${edit_description}

    UOM - Select a UOM Code      ${code}

    UOM - Verify the title of the edit form     ${code}

    UOM - Edit code     ${edit_code}

    UOM - Edit name     ${edit_name}
    
    UOM - Edit description     ${edit_description}

    UOM - Click on the Save button on the edit form

UOM - Verify the title of the edit form

    [Arguments]     ${code}

    ${get_title_edit_form}    Common - Get text an element        ${uom_title_edit_form}

    should be equal      ${get_title_edit_form}         SỬA ĐƠN VỊ TÍNH - ${code}

UOM - Edit code

    [Arguments]     ${code}

    Sleep   1s

    Common - Input text to element      ${uom_txt_edit_code}       ${code}

UOM - Edit name

    [Arguments]     ${name}

    Sleep   1s

    Common - Input text to element      ${uom_txt_edit_name}       ${name}

UOM - Edit description

    [Arguments]     ${description}

    Sleep   1s

    Common - Input text to element      ${uom_txt_edit_description}       ${description}

UOM - Click on the Save button on the edit form

    Common - Click on an element      ${uom_btn_edit_save}

UOM - Verify the validation message when creating a new unit of measurement with empty code

    [Arguments]     ${validation_message}

    ${get_validation_message}    Common - Get text an element        ${uom_msg_code_create}

    should be equal      ${get_validation_message}        ${validation_message}

UOM - Verify the validation message when creating a new unit of measurement with empty name

    [Arguments]     ${validation_message}

    ${get_validation_message}    Common - Get text an element        ${uom_msg_name_create}

    should be equal      ${get_validation_message}        ${validation_message}