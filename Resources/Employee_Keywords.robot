*** Settings ***
Variables  ../Locators/Employee_Locators.py
Variables  ../Locators/Common_Locators.py
Resource    Common_Keywords.robot

*** Variables ***
${title_create_employee_form}       TẠO TÀI KHOẢN NHÂN VIÊN

*** Keywords ***

Employee - Navigate to the Employee list

    Menu - Click on the Management menu

    Menu - Click on the Employee menu

Employee - Create a new employee with type is store employee

    [Arguments]    ${code}  ${name}  ${user_account}  ${birth_day}  ${phone_number}  ${email}  ${country}  ${city}  ${state}  ${ward}  ${address}

    Employee - Click on the Create button

    Employee - Input employee information    ${code}  ${name}  ${user_account}  ${birth_day}  ${phone_number}  ${email}  ${country}  ${city}  ${state}  ${ward}  ${address}

    Employee - Verify the title of the create form

Employee - Verify the title of the create form

    ${get_title_create_form}    Common - Get text an element        ${employee_title_create_form}

    should be equal      ${get_title_create_form}         ${title_create_employee_form}

Employee - Input employee information

    [Arguments]    ${code}  ${name}  ${user_account}  ${birth_day}  ${phone_number}  ${email}  ${country}  ${city}  ${state}  ${ward}  ${address}

    Employee - Input employee code   ${code}

    Employee - Input employee name    ${name}

    Employee - Input user account  ${user_account}

    Employee - Select a birth day    ${birth_day}

    Employee - Select the type user is store employee

    Employee - Select a start day

    Employee - Input phone number   ${phone_number}

    Employee - Input Email  ${email}

    Employee - Select a country   ${country}

    Employee - Select a city    ${city}

    Employee - Select a state   ${state}

    Employee - select a ward   ${ward}

    Employee - Input address   ${address}

Employee - Input employee code

    [Arguments]     ${code}

    Common - Input text to element      ${employee_txt_code_user}       ${code}

Employee - Input employee name

    [Arguments]     ${name}

    Common - Input text to element      ${employee_txt_name_user}       ${name}

Employee - Input user account

    [Arguments]  ${user_account}

    Common - Input text to element      ${employee_txt_name_account}       ${user_account}

Employee - Select a birth day

    [Arguments]   ${birth_day}

    Common - Input text to element      ${employee_txt_birth_date}       ${birth_day}

Employee - Select a start day

    ${get_current_date}    Get Current Date     result_format=%d-%m-%Y

#    ${get_current_date}    Convert Date     ${get_current_date}     date_format=%d.%m.%Y

    Common - Input text to element      ${employee_txt_start_date}       ${get_current_date}

Employee - Input phone number

    [Arguments]   ${phone_number}

    Common - Input text to element      ${employee_txt_phone_number}       ${phone_number}

Employee - Input Email

    [Arguments]   ${email}

    Common - Input text to element      ${employee_txt_email}       ${email}

Employee - Select a country

    [Arguments]   ${country}

    Common - Choose a value from combobox    ${employee_cbx_country}    ${employee_input_country.replace('value','${country}')}

    Sleep   1s

Employee - Select a city

    [Arguments]   ${city}

    Common - Choose a value from combobox    ${employee_cbx_city}    ${employee_input_city.replace('value','${city}')}

    Sleep   1s

Employee - Select a state

    [Arguments]   ${state}

    Common - Choose a value from combobox    ${employee_cbx_state}    ${employee_input_state.replace('value','${state}')}

    Sleep   1s

Employee - select a ward

    [Arguments]   ${ward}

    Common - Choose a value from combobox   ${employee_cbx_ward}    ${employee_input_ward.replace('ward','${ward}')}

Employee - Input address

    [Arguments]   ${address}

    Common - Input text to element      ${employee_txt_address}       ${address}

Employee - Select the type user is store employee

    Common - Click on an element      ${employee_rad_store_employee}

Employee - Select the type user is central employee

    Common - Click on an element      ${employee_rad_central_employee}

Employee - Click on the Create button

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element      ${employee_btn_create}

Employee - Click on the Save button

    Common - Click on an element      ${employee_btn_save}