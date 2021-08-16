*** Settings ***
Variables  ../Locators/Sales_Tax_Locators.py
Variables  ../Locators/Common_Locators.py

*** Variables ***
${title_form}       TẠO LOẠI THUẾ

*** Keywords ***
Sales Tax - Navigate to the Sales Tax List

    Menu - Click on the Finance Management menu

    Menu - Click on the Sales Tax menu

Sales Tax - Click on the create button

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element      ${sales_tax_btn_create_tax}

    Verify the "Create a Tax" form appears on the page

Sales Tax - Input information for the new tax

    [Arguments]     ${i_tax_name}       ${i_tax_level}

    Sales Tax - Input a tax name        ${i_tax_name}

    Sales Tax - Input a tax level       ${i_tax_level}

Sales Tax - Input a tax name

    [Arguments]     ${i_tax_name}

    Common - Input text to element      ${sales_tax_txt_tax_name}       ${i_tax_name}

Sales Tax - Input a tax level

    [Arguments]  ${i_tax_level}

    FOR    ${robot}    IN RANGE    ${i_tax_level}

        Log    ${robot}

        Common - Click on an element        ${sales_tax_btn_increase}

    END

Sales Tax - Click on the Save button
    Common - Click on a button      ${sales_tax_btn_save_tax}

Sales Tax - Click on the Cancel button

    Common - Click on an element      ${sales_tax_btn_cancel_tax}

Verify the Sales Tax created successfully

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element      ${sales_tax_code_column}

    Common - Click on an element      ${sales_tax_code_column}

Verify the "Create a Tax" form appears on the page

    Common - Wait until the loading icon loads successfully      ${sales_tax_txt_tax_name}

    ${get_title_form}     Common - Get text an element        ${sales_tax_title_create_a_tax_form}

    should be equal     ${get_title_form}       ${title_form}

Verify the message after creating a new sales tax

    [Arguments]    ${message}

    ${get_content_message}    Common - Get text an element        ${sales_tax_create_message_locator}

    should be equal     ${get_content_message}      ${message}