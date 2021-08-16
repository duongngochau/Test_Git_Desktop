*** Settings ***
Variables   ../Locators/Common_Locators.py
Variables   ../Locators/Suppliers_Locators.py
Variables   ../Data/SuppliersData.yaml

*** Keywords ***

####   Suppliers Menu  ####

Navigate To Suppliers Page And Verify The Suppliers Page Appears

    Menu - Click on the Suppliers menu

Navigate To Create Suppliers Page

    Common - Click on an element    ${Suppliers_btn_Create}

    Common - Wait until the loading icon loads successfully   ${loader_icon_locator}

    Wait Until Page Contains Element    ${Suppliers_cbx_Country}   ${TIMEOUT}

Verify The Create Suppliers Page Appears successfully

    [Arguments]  ${Data_tle_Create}

    ${CreateSupp_Title}     Common - Get text an element    ${Suppliers_tle_Create}

    Should Be Equal    ${Data_tle_Create}    ${CreateSupp_Title}

Input Code for the supplier

    [Return]    ${Suppliers_Code}

    ${Suppliers_Code}    Generate Random String  7  [NUMBERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_Code}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_Code}   ${Suppliers_Code}

Supplier - Verify data all fields when user created a supplier successfully

    [Arguments]   ${supplier_code}   ${data_input}   ${item_list}

    ${data_update}   Create List

    Common - Search data    ${supplier_code}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

    Common - Click on an element    ${suppliers_table_code.replace('supplier_code','${supplier_code}')}

    ${detail_supplier_code}         Common - Get text an element    ${supplier_detail_label.replace('number','1')}
    Append To List    ${data_update}   ${detail_supplier_code}

    ${detail_supplier_name}         Common - Get text an element    ${supplier_detail_label.replace('number','2')}
    Append To List    ${data_update}   ${detail_supplier_name}

    ${detail_supplier_website}         Common - Get text an element    ${supplier_detail_label.replace('number','3')}
    Append To List    ${data_update}   ${detail_supplier_website}

    ${detail_supplier_tax_number}         Common - Get text an element    ${supplier_detail_label.replace('number','4')}
    Append To List    ${data_update}   ${detail_supplier_tax_number}

    ${detail_supplier_account_number}      Common - Get text an element    ${supplier_detail_label.replace('number','8')}
    Append To List    ${data_update}   ${detail_supplier_account_number}

    ${detail_supplier_currency}      Common - Get text an element    ${supplier_detail_label.replace('number','9')}
    Append To List    ${data_update}   ${detail_supplier_currency}

    ${detail_supplier_paymethod}      Common - Get text an element    ${supplier_detail_label.replace('number','10')}
    Append To List    ${data_update}   ${detail_supplier_paymethod}

    ${detail_supplier_due_to}      Common - Get text an element    ${supplier_detail_label.replace('number','11')}
    Append To List    ${data_update}   ${detail_supplier_due_to}

    ${detail_supplier_address}      Common - Get text an element    ${supplier_detail_label.replace('number','5')}
    Append To List    ${data_update}   ${detail_supplier_address}

    ${detail_supplier_contact}      Common - Get text an element    ${supplier_detail_label.replace('number','12')}
    Append To List    ${data_update}   ${detail_supplier_contact}

    ${detail_supplier_phone}        Common - Get text an element    ${supplier_detail_label.replace('number','13')}
    Append To List    ${data_update}   ${detail_supplier_phone}

    ${detail_supplier_email}        Common - Get text an element    ${supplier_detail_label.replace('number','14')}
    Append To List    ${data_update}   ${detail_supplier_email}

    Should Be Equal    ${data_update}   ${data_input}

    Navigate To Items Tab

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

    ${detail_item_list}     Common - Get data from a column    ${suppliers_table}    1

    Should Be Equal    ${detail_item_list}    ${item_list}

    Common - Click on an element       ${homepage_menu_suppliers}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

Supplier - Verify data all required fields when user created a supplier successfully

    [Arguments]   ${supplier_code}   ${data_input}  ${item_list}

    ${data_update}   Create List

    Common - Search data    ${supplier_code}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

    Common - Click on an element    ${suppliers_table_code.replace('supplier_code','${supplier_code}')}

    ${detail_supplier_code}         Common - Get text an element    ${supplier_detail_label.replace('number','1')}
    Append To List    ${data_update}   ${detail_supplier_code}

    ${detail_supplier_name}         Common - Get text an element    ${supplier_detail_label.replace('number','2')}
    Append To List    ${data_update}   ${detail_supplier_name}

    ${detail_supplier_account_number}      Common - Get text an element    ${supplier_detail_label.replace('number','8')}
    Append To List    ${data_update}   ${detail_supplier_account_number}

    ${detail_supplier_currency}      Common - Get text an element    ${supplier_detail_label.replace('number','9')}
    Append To List    ${data_update}   ${detail_supplier_currency}

    ${detail_supplier_paymethod}      Common - Get text an element    ${supplier_detail_label.replace('number','10')}
    Append To List    ${data_update}   ${detail_supplier_paymethod}

    ${detail_supplier_due_to}      Common - Get text an element    ${supplier_detail_label.replace('number','11')}
    Append To List    ${data_update}   ${detail_supplier_due_to}

    ${detail_supplier_address}      Common - Get text an element    ${supplier_detail_label.replace('number','5')}
    Append To List    ${data_update}   ${detail_supplier_address}

    ${detail_supplier_contact}      Common - Get text an element    ${supplier_detail_label.replace('number','12')}
    Append To List    ${data_update}   ${detail_supplier_contact}

    ${detail_supplier_phone}        Common - Get text an element    ${supplier_detail_label.replace('number','13')}
    Append To List    ${data_update}   ${detail_supplier_phone}

    Should Be Equal    ${data_update}   ${data_input}

    Navigate To Items Tab

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

    ${update_item_list}     Common - Get data from a column    ${suppliers_table}    1

    Should Be Equal    ${update_item_list}    ${item_list}

    Common - Click on an element       ${homepage_menu_suppliers}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

Verify Create Suppliers Successfully

    [Arguments]   ${supplier_code}   ${data_input}  ${item_list}

    ${data_update}   Create List
    
    Common - Search data    ${supplier_code}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}
    
    Common - Click on an element    ${suppliers_table_code.replace('supplier_code','${supplier_code}')}
    
    ${detail_supplier_code}         Common - Get text an element    ${supplier_detail_label.replace('number','1')}
    Append To List    ${data_update}   ${detail_supplier_code}

    ${detail_supplier_name}         Common - Get text an element    ${supplier_detail_label.replace('number','2')}
    Append To List    ${data_update}   ${detail_supplier_name}

    ${detail_supplier_website}      Common - Get text an element    ${supplier_detail_label.replace('number','3')}
    Append To List    ${data_update}   ${detail_supplier_website}

    ${detail_supplier_tax}      Common - Get text an element    ${supplier_detail_label.replace('number','4')}
    Append To List    ${data_update}   ${detail_supplier_tax}

    ${detail_supplier_account_number}      Common - Get text an element    ${supplier_detail_label.replace('number','8')}
    Append To List    ${data_update}   ${detail_supplier_account_number}

    ${detail_supplier_currency}      Common - Get text an element    ${supplier_detail_label.replace('number','9')}
    Append To List    ${data_update}   ${detail_supplier_currency}

    ${detail_supplier_paymethod}      Common - Get text an element    ${supplier_detail_label.replace('number','10')}
    Append To List    ${data_update}   ${detail_supplier_paymethod}

    ${detail_supplier_due_to}      Common - Get text an element    ${supplier_detail_label.replace('number','11')}
    Append To List    ${data_update}   ${detail_supplier_due_to}

    ${detail_supplier_address}      Common - Get text an element    ${supplier_detail_label.replace('number','5')}
    Append To List    ${data_update}   ${detail_supplier_address}

    ${detail_supplier_contact}      Common - Get text an element    ${supplier_detail_label.replace('number','12')}
    Append To List    ${data_update}   ${detail_supplier_contact}

    ${detail_supplier_phone}        Common - Get text an element    ${supplier_detail_label.replace('number','13')}
    Append To List    ${data_update}   ${detail_supplier_phone}

    ${detail_supplier_email}        Common - Get text an element    ${supplier_detail_label.replace('number','14')}
    Append To List    ${data_update}   ${detail_supplier_email}

    Should Be Equal    ${data_update}   ${data_input}
    
    Navigate To Items Tab

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

    ${update_item_list}     Common - Get data from a column    ${suppliers_table}    1

    Should Be Equal    ${update_item_list}    ${item_list}

    Common - Click on an element       ${homepage_menu_suppliers}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

Input Name for the supplier

    [Return]    ${supp_name}

    ${supp_name}   Generate Random String  10  [LETTERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_Name}    CTRL+a+BACKSPACE

    Common - Input text to element  ${Suppliers_txt_Name}   ${supp_name}

Input Account Number for the supplier

    [Return]   ${AccountNumber}

    ${AccountNumber}     Generate Random String  10  [NUMBERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_AccountNumber}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_AccountNumber}    ${AccountNumber}

Input The Currency for the supplier

    [Arguments]  ${supp_currency}

    [Return]   ${supp_currency}

    Common - Choose a value from combobox    ${Suppliers_cbx_Currency}    ${Suppliers_input_Currency.replace('currency','${supp_currency}')}

Input Payment Methods for the supplier

    [Arguments]  ${data_pay_method}

    [Return]   ${data_pay_method}

    Common - Choose a value from combobox    ${Suppliers_cbx_PayMethod}    ${Suppliers_input_PayMethod.replace('pay_method','${data_pay_method}')}

Input DueTo for the supplier

    [Return]   ${DueTo}
    
    Common - Double click on an element    ${Suppliers_cell_DueTo}

    ${DueTo}   Generate Random String  2   123

    Common - Press a key on the keyboard     ${Suppliers_txt_DueTo}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_DueTo}    ${DueTo}

Choose Country for address information

    [Arguments]  ${address_country}

    [Return]   ${address_country}

    Common - Choose a value from combobox    ${Suppliers_cbx_Country}    ${Suppliers_input_Country.replace('country','${address_country}')}

Choose City for address information

    [Arguments]   ${address_city}

    [Return]   ${address_city}

    Common - Choose a value from combobox    ${Suppliers_cbx_City}    ${Suppliers_input_City.replace('city','${address_city}')}

Choose District for address information

    [Arguments]  ${address_district}

    [Return]   ${address_district}

    Common - Choose a value from combobox    ${Suppliers_cbx_district}    ${Suppliers_input_district.replace('district','${address_district}')}

Choose Ward for address information

    [Arguments]   ${address_ward}

    [Return]   ${address_ward}

    Common - Choose a value from combobox    ${Suppliers_cbx_ward}    ${Suppliers_input_ward.replace('ward','${address_ward}')}

Input Address for the supplier

    [Return]   ${address}

    ${address}  Generate Random String  20  [LETTERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_Address}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_Address}    ${address}

Input Contact Name for contact information

    [Return]   ${contact_name}

    ${contact_name}  Generate Random String     10  [LETTERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_ContactName}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_ContactName}    ${contact_name}

Input Phone Number for contact information

    [Return]   ${PhoneNumber}

    ${PhoneNumber}     Generate Random String  10  [NUMBERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_PhoneNumber}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_PhoneNumber}    ${PhoneNumber}

Random domain

    [Return]  ${afterAT}
    ${num}    Generate random string   1     123
    ${afterAT}   Run keyword if  '${num}'=='1'  set variable  .com
    ...   ELSE  Run keyword if  '${num}'=='2'  set variable  .vn
    ...   ELSE  set variable  .org
    log  ${afterAT}

Input The Link Website Of the Supplier

    [Return]   ${link_website}

    ${Domain}    Random domain

    ${Domain}    set variable  ${Domain}

    ${website}   Generate Random String     10    [LETTERS]

    ${link_website}   Set Variable   ${website}${Domain}

    Common - Press a key on the keyboard    ${Suppliers_txt_WebSite}    CTRL+a+BACKSPACE

    Common - Input text to element  ${Suppliers_txt_WebSite}   ${link_website}

Input Tax Number OF the Supplier

    [Return]   ${Tax}

    ${Tax}     Generate Random String  10  [NUMBERS]

    Common - Press a key on the keyboard    ${Suppliers_txt_TaxNumber}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_TaxNumber}    ${Tax}

Input Email for contact information

    [Return]   ${supplier_email}

    ${@Gmail}  Set Variable    @gmail.com

    ${email}    Generate Random String    10    [LETTERS]

    ${supplier_email}   Set Variable   ${email}${@Gmail}

    Common - Press a key on the keyboard    ${Suppliers_txt_Email}    CTRL+a+BACKSPACE

    Common - Input text to element    ${Suppliers_txt_Email}    ${supplier_email}

Navigate To Items Tab

    Common - Click on an element    ${Suppliers_tab_Items}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

Add an item for the supplier

    [Arguments]    ${item_input}

    [Return]   ${item_list}

    Clicking on add item button

    Common - Choose a value from combobox    ${Suppliers_cbx_Items}    ${Suppliers_Input_Items.replace('item_code','${item_input}')}

    Add Last Receipt Cost for the item
    
    Wait Until Page Contains Element    ${suppliers_table_row}   ${TIMEOUT}

    ${item_list}   Common - Get data from a column    ${suppliers_table}    1

Clicking on add item button

    Common - Click on an element    ${Suppliers_btn_AddItems}

    Sleep   1s
    
    Common - Click on an element    ${Suppliers_btn_AddItems}

Add Last Receipt Cost for the item

    Common - Click on an element    ${Suppliers_cell_Cost}

    ${Cost}  Generate Random String    4   [NUMBERS]

    Common - Input text to element    ${Suppliers_txt_Cost}    ${Cost}

    Common - Press a key on the keyboard    ${Suppliers_txt_Cost}    TAB

    ${quantity}  Generate Random String  1  1234

    Common - Press a key on the keyboard    ${supplier_txt_quantity}    CTRL+a+BACKSPACE
    
    Common - Input text to element    ${supplier_txt_quantity}    ${quantity}

#    Common - Press a key on the keyboard    ${supplier_txt_quantity}    ENTER
    
    Common - Click on an element    ${supplier_div_add_item}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

Click On Save Button To Create A Suppliers

    Common - Click on an element    ${Suppliers_cbx_Save}

    Common - Click on an element    ${Suppliers_cbx_Save}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Click on Save button to update for suppliers

    Common - Click on an element    ${suppliers_btn_save_update}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Click on Delete Button to remove item of suppliers

    Common - Click on an element     ${Suppliers_icon_DelItem}

Remove the supplier after create suppliers successfully

    [Arguments]   ${supplier_code}
    
#    Search a supplier    ${supplier_code}

    Common - Search data    ${supplier_code}

    Click on action button to open the menu list

    # Open the edit supplier page to update data

    Common - Click on an element    ${Suppliers_menu_EditSupp}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${Suppliers_cbx_district}    ${TIMEOUT}

    Navigate To Items Tab

    Sleep   1s

    Click on Delete Button to remove item of suppliers

    # Click on Save Button To update for Suppliers

    Common - Click on an element    ${Suppliers_btn_SaveEdit}

    # Delete Suppliers
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
#    Search a supplier    ${supplier_code}

    Common - Search data    ${supplier_code}

    Click on action button to open the menu list

    Common - Click on an element    ${Suppliers_menu_DelSupp}

    Wait Until Page Contains Element    ${Suppliers_btn_DeleteSupp}   ${TIMEOUT}

    Common - Click on an element    ${Suppliers_btn_DeleteSupp}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

Supplier list - Open the product list pop-up to verify

    Click on action button to open the menu list

    Common - Click on an element    ${suppliers_menu_item_list}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Sleep   1s

Supplier list - Get data in product list pop-up

    [Return]    ${item_list}

    Wait Until Page Contains Element    ${suppliers_sub_table_row}      ${TIMEOUT}

    Common - Click on an element    ${suppliers_sub_table_title.replace('number','2')}

    ${item_list}    Common - Get data from a column    ${suppliers_sub_table}    2

    # Close the pop-up
    
    Common - Press a key on the keyboard    ${suppliers_sub_table_title.replace('number','2')}    ESC

Supplier list - Get data in add product pop-up

    [Return]    ${item_list}

    Wait Until Page Contains Element    ${suppliers_sub_table_row}      ${TIMEOUT}
    
    Common - Click on an element    ${suppliers_sub_table_title.replace('number','2')}

    Sleep   2s

    ${item_list}    Common - Get data from a column    ${suppliers_sub_table}    2

    # Close the pop-up

    Common - Press a key on the keyboard    ${suppliers_sub_table_title.replace('number','2')}    ESC

Navigate to item page for verify

    Common - Click on an element   ${homepage_menu_items}

    Common - Click on an element   ${homepage_menu_items}

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

Verify product data of the supplier

    [Arguments]   ${supplier_item_list}

    Common - Click on an element    ${suppliers_table_title.replace('number','1')}

    ${products_item_list_supplier}      Common - Get data from a column    ${suppliers_table}    2

    Should Be Equal    ${products_item_list_supplier}    ${supplier_item_list}

Supplier list - Open the add product pop-up to verify

    Click on action button to open the menu list

    Common - Click on an element    ${suppliers_menu_add_item}

Supplier list - Add a item for the supplier

    [Arguments]   ${data_item_code}     ${data_item_unit}

    Common - Click on an element    ${suppliers_btn_add_item}

    Common - Click on an element    ${suppliers_btn_add_item}

    Common - Choose a value from combobox    ${suppliers_cbx_item}    ${suppliers_cbx_input_item.replace('item','${data_item_code}')}

    Common - Choose a value from combobox    ${supplier_cbx_unit}    ${supplier_cbx_input_unit.replace('unit','${data_item_unit}')}

    Common - Press a key on the keyboard    ${suppliers_tle_add_item}   TAB

    ${cost}     Generate Random String      4       123456789

    Common - Press a key on the keyboard    ${suppliers_txt_cost_id}    CTRL+a+BACKSPACE

    Common - Input text to element    ${suppliers_txt_cost_id}    ${cost}

    Common - Press a key on the keyboard    ${suppliers_tle_add_item}    TAB

    ${quantity}     Generate Random String   1   123456789

    Common - Press a key on the keyboard    ${suppliers_txt_quantity_id}    CTRL+a+BACKSPACE

    Common - Input text to element    ${suppliers_txt_quantity_id}    ${quantity}

    Common - Click on an element    ${suppliers_pop_up_add_item}

    Common - Click on a button    ${suppliers_btn_save}

Remove a product from the supplier

    [Arguments]     ${item_code}    ${supplier}

    Common - Search data    ${supplier}

    Supplier list - Open the add product pop-up to verify
    
    Common - Click on an element    //td[contains(text(),'${item_code}')]

    Common - Press a key on the keyboard    ${suppliers_tle_add_item}    TAB

    Common - Press a key on the keyboard    ${suppliers_tle_add_item}    TAB

    Common - Press a key on the keyboard    ${suppliers_tle_add_item}    TAB

    Common - Click on an element    ${suppliers_btn_delete}

    Common - Click on a button    ${suppliers_btn_save}

Update status for a supplier

    [Arguments]   ${supplier_code}  ${status}

    Common - Search data    ${supplier_code}
    
    Common - Click on an element    ${suppliers_chk_by_code.replace('supplier_code','${supplier_code}')}

    Common - Click on an element    ${supplier_btn_option_update_status}

    Sleep   1s
    
    Common - Click on an element    ${suppliers_update_status.replace('status','${status}')}
    
    Wait Until Page Contains Element    ${message}      ${TIMEOUT}

    Reload Page

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

Verify the data after update status

    [Arguments]     ${supplier_code}    ${status}

    Common - Choose a value from combobox    ${suppliers_cbx_status}    ${suppliers_cbx_input_status.replace('status','${status}')}

    Page Should Contain Element    ${suppliers_table_code.replace('supplier_code','${supplier_code}')}      ${TIMEOUT}

    Reload Page

    Wait Until Page Contains Element    ${suppliers_table_row}      ${TIMEOUT}

View detail a supplier for verify

    [Arguments]   ${supplier_code}

    Common - Search data    ${supplier_code}
    
    Common - Click on an element    ${suppliers_table_code.replace('supplier_code','${supplier_code}')}

Random currency

    [Return]    ${currency}

    ${num}  Generate Random String  1   12
    
    ${currency}   Run keyword if  '${num}'=='1'  set variable  Việt Nam Đồng
    ...   ELSE  set variable  Đô la Mỹ
    log  ${currency}

Random Payment Methods

    [Return]    ${payment_methods}

    ${num}  Generate Random String  1   1234

    ${payment_methods}   Run keyword if  '${num}'=='1'  set variable  Tiền mặt
    ...   ELSE  Run keyword if  '${num}'=='2'  set variable  Thanh toán qua thẻ nội địa
    ...   ELSE  Run keyword if  '${num}'=='3'  set variable  Chuyển khoản qua ngân hàng
    ...   ELSE  set variable  COD
    log  ${payment_methods}

Update all fields of a supplier

    [Arguments]     ${supplier_code}  ${data_currency}  ${data_pay_method}   ${data_country}   ${data_city}   ${data_district}  ${data_ward}

    [Return]   ${data_input}

    ${data_input}   Create List

    View detail a supplier for verify   ${supplier_code}

    Clicking on Edit button for navigate to edit item page

    ${update_supplier_code}   Common - Get attribute an element    ${Suppliers_txt_Code}    value
    Append To List    ${data_input}   ${update_supplier_code}

    ${update_supplier_name}     Input Name for the supplier
    Append To List    ${data_input}   ${update_supplier_name}

    ${update_website}    Input The Link Website Of the Supplier
    Append To List    ${data_input}   ${update_website}

    ${update_tax}        Input Tax Number OF the Supplier
    Append To List    ${data_input}   ${update_tax}

    ${update_account_number}    Input Account Number for the supplier
    Append To List    ${data_input}   ${update_account_number}

    ${update_currency}   Input The Currency for the supplier   ${data_currency}
    Append To List    ${data_input}   ${update_currency}

    ${update_pay_method}   Input Payment Methods for the supplier   ${data_pay_method}
    Append To List    ${data_input}   ${update_pay_method}

    ${update_pay_method}   Input DueTo for the supplier
    Append To List    ${data_input}   ${update_pay_method}

    ${update_country}   Choose Country for address information      ${data_country}

    ${update_city}      Choose City for address information         ${data_city}

    ${update_district}   Choose District for address information     ${data_district}

    ${update_ward}    Choose Ward for address information    ${data_ward}

    ${update_address}   Input Address for the supplier

    ${update_address}   Set Variable   ${update_address}, ${update_ward}, ${update_district}, ${update_city}, ${update_country}
    Append To List    ${data_input}   ${update_address}

    ${update_contact_name}     Input Contact Name for contact information
    Append To List    ${data_input}   ${update_contact_name}

    ${update_phone_number}   Input Phone Number for contact information
    Append To List    ${data_input}   ${update_phone_number}

    ${update_email}   Input Email for contact information
    Append To List    ${data_input}   ${update_email}

Navigate to item tab and remove item for supplier

    Navigate To Items Tab

    Common - Click on an element    ${suppliers_btn_delete}

Supplier - Create a supplier when filling all fields

    [Arguments]     ${data_currency}  ${data_pay_method}   ${data_country}   ${data_city}   ${data_district}  ${data_ward}

    [Return]   ${data_input}

    ${data_input}   Create List

    Navigate To Create Suppliers Page

    ${supplier_code}   Input Code for the supplier
    Append To List  ${data_input}   ${supplier_code}

    ${supplier_name}     Input Name for the supplier
    Append To List    ${data_input}   ${supplier_name}

    ${website}    Input The Link Website Of the Supplier
    Append To List    ${data_input}   ${website}

    ${tax}        Input Tax Number OF the Supplier
    Append To List    ${data_input}   ${tax}

    ${account_number}    Input Account Number for the supplier
    Append To List    ${data_input}   ${account_number}

    ${currency}   Input The Currency for the supplier   ${data_currency}
    Append To List    ${data_input}   ${currency}

    ${pay_method}   Input Payment Methods for the supplier   ${data_pay_method}
    Append To List    ${data_input}   ${pay_method}

    ${due_to}   Input DueTo for the supplier
    Append To List    ${data_input}   ${due_to}

    ${country}   Choose Country for address information      ${data_country}

    ${city}      Choose City for address information         ${data_city}

    ${district}   Choose District for address information     ${data_district}

    ${ward}    Choose Ward for address information    ${data_ward}

    ${input_address}   Input Address for the supplier

    ${address}   Set Variable   ${input_address}, ${ward}, ${district}, ${city}, ${country}
    Append To List    ${data_input}   ${address}

    ${contact_name}     Input Contact Name for contact information
    Append To List    ${data_input}   ${contact_name}

    ${phone_number}   Input Phone Number for contact information
    Append To List    ${data_input}   ${phone_number}

    ${email}   Input Email for contact information
    Append To List    ${data_input}   ${email}

Supplier - Create a supplier when filling all required fields

    [Arguments]   ${supp_currency}   ${supp_pay_method}   ${address_country}   ${address_city}   ${address_state}   ${address_ward}

    [Return]   ${data_input}

    ${data_input}  Create List

    Navigate To Create Suppliers Page

    ${supplier_code}   Input Code for the supplier
    Append To List  ${data_input}   ${supplier_code}

    ${supplier_name}   Input Name for the supplier
    Append To List    ${data_input}   ${supplier_name}

    ${supplier_account_number}   Input Account Number for the supplier
    Append To List    ${data_input}   ${supplier_account_number}

    ${supplier_currency}   Input The Currency for the supplier    ${supp_currency}
    Append To List    ${data_input}   ${supplier_currency}

    ${supplier_pay_method}   Input Payment Methods for the supplier    ${supp_pay_method}
    Append To List    ${data_input}   ${supplier_pay_method}

    ${supplier_due_to}   Input DueTo for the supplier
    Append To List    ${data_input}   ${supplier_due_to}

    ${supplier_address_country}   Choose Country for address information    ${address_country}

    ${supplier_address_city}   Choose City for address information    ${address_city}

    ${supplier_address_state}   Choose District for address information    ${address_state}

    ${supplier_address_ward}   Choose Ward for address information    ${address_ward}

    ${supplier_address}   Input Address for the supplier

    ${address}  Set Variable  ${supplier_address}, ${supplier_address_ward}, ${supplier_address_state}, ${supplier_address_city}, ${supplier_address_country}
    Append To List    ${data_input}   ${address}

    ${supplier_contact_name}  Input Contact Name for contact information
    Append To List    ${data_input}   ${supplier_contact_name}

    ${supplier_phone_number}   Input Phone Number for contact information
    Append To List    ${data_input}   ${supplier_phone_number}












    