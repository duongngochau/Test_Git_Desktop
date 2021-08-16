*** Settings ***
Variables   ../Locators/Common_Locators.py
Variables   ../Locators/Transfer_in_Locators.py
Variables   ../Data/TransferInData.yaml
Library    Collections
Library    SeleniumLibrary
Resource    Common_Keywords.robot

*** Keywords ***

TI - Navigate to Transfer in list page

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Menu - Click on the Purchase Management Menu

    Menu - Click on the Transfer in Menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait until the data grid loaded successfully

Wait until the data grid loaded successfully

    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}

TI - Navigate to create transfer-in page

    Common - Click on an element    ${TI_btn_create}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

#    Wait Until Page Contains Element    //div[@class='s2-condition col-md-12']   ${TIMEOUT}


Verify the create transfer-in page appear

    [Arguments]   ${data_title_create_TI}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    ${title_create_TI}  Common - Get text an element    ${TI_tle_create}

    Should Be Equal    ${data_title_create_TI}    ${title_create_TI}

TI - Navigate to create new transfer-in page

    Wait Until Page Contains Element    ${TI_rad_new_TI}    ${TIMEOUT}

    Common - Click on an element    ${TI_rad_new_TI}
    
    Wait Until Page Contains Element    ${TI_btn_continue}   ${TIMEOUT}
    
    Common - Click on an element    ${TI_btn_continue}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}   ${TIMEOUT}

Navigate to create transfer-in page with option ADD ALL PRODUCT - ALL PRODUCT

    Common - Click on an element    ${TI_rad_add_all_item}
    
    Common - Click on an element    ${TI_rad_all_item}

    Common - Click on an element    ${TI_btn_continue}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}   ${TIMEOUT}

Navigate to create transfer-in page with option BASE ON ORDER INFORMATION - ALL PRODUCT

    Common - Click on an element    ${TI_rad_transfer_work_order}

    Common - Click on an element    ${TI_rad_all_item}

    Common - Click on an element    ${TI_btn_continue}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}   ${TIMEOUT}

Navigate to create transfer-in page with option PRODUCT SOLD IN PERIOD - ALL PRODUCT

    Common - Click on an element    ${TI_rad_all_item}

    Common - Click on an element    ${TI_btn_continue}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}   ${TIMEOUT}

Clicking on ADD ALL PRODUCT IN GROUP radio button

    Common - Click on an element    ${TI_rad_add_all_item}

Clicking on BASE ON ORDER INFORMATION radio button

    Common - Click on an element    ${TI_rad_transfer_work_order}

Clicking on PRODUCT SOLD IN PERIOD radio button

    Common - Click on an element    ${TI_rad_item_inventory}

Input FROM DATE for PRODUCT SOLD IN PERIOD option

    [Arguments]   ${day}   ${month}   ${year}

    Common - Click on an element    ${TI_btn_from_date}

    Wait Until Page Contains Element    ${TI_header_from_date}   ${TIMEOUT}

    Common - Click on an element    ${TI_header_from_date}

    Common - Click on an element    ${TI_header_from_date}
    
    Wait Until Page Contains Element    ${TI_date_view.replace('date','${year}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_date_view.replace('date','${year}')}
    
    Wait Until Page Contains Element    ${TI_date_view.replace('date','Thg${month}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_date_view.replace('date','Thg${month}')}    ### Month format: Thg+Month ###
    
    Wait Until Page Contains Element    ${TI_date_view.replace('date','Thg${month}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_date_view.replace('date','${day}')}

Input TO DATE for PRODUCT SOLD IN PERIOD option

    [Arguments]   ${day}   ${month}   ${year}

    Common - Click on an element    ${TI_btn_to_date}

    Common - Click on an element    ${TI_header_to_date}

    Common - Click on an element    ${TI_header_to_date}

    Wait Until Page Contains Element    ${TI_date_view.replace('date','${year}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_date_view.replace('date','${year}')}

    Wait Until Page Contains Element    ${TI_date_view.replace('date','Thg${month}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_date_view.replace('date','Thg${month}')}    ### Month format: Thg+Month ###

    Wait Until Page Contains Element    ${TI_to_date_view_day.replace('day','${day}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_to_date_view_day.replace('day','${day}')}

Clicking on Choose department radio button

    Common - Click on an element    ${TI_rad_select_department}

Clicking on Choose category radio button

    Common - Click on an element    ${TI_rad_select_category}

Clicking on filter by condition radio button

    Common - Click on an element    ${TI_rad_select_condition}

Input cost condition for add all product option

    [Arguments]    ${cost_condition}

    Common - Double click on an element    ${TI_txt_cost_condition}

    Common - Press a key on the keyboard    ${TI_txt_input_cost_condition}    CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_input_cost_condition}    ${cost_condition}

Select department to filter item for new TI

    [Arguments]   ${department}

    Common - Choose a value from combobox    ${TI_cbx_department}    ${TI_cbx_input_department.replace('department','${department}')}
    
    Sleep   1s

Select category to filter item for new TI

    [Arguments]   ${category}

    Common - Choose a value from combobox    ${TI_cbx_category}    ${TI_cbx_input_category.replace('category','${category}')}

    Sleep   1s

Navigate to create transfer-in page after select option

    Common - Click on an element    ${TI_btn_continue}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}    ${TIMEOUT}

Navigate to edit transfer-in page

    [Arguments]   ${TI_code}

    Common - Search data    ${TI_code}
    
    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}
    
    Product - Click on action button to open the menu list
    
    Common - Click on an element    ${TI_menu_update}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}   ${TIMEOUT}

Verify the edit TI page appear

    [Arguments]   ${data_title}

    ${title_edit_TI}    Common - Get text an element    ${TI_tle_edit}

    Should Be Equal    ${data_title}    ${title_edit_TI}

Input code for the transfer-in

    [Return]   ${code}

    ${code}   Generate Random String  7  123456789

    Common - Press a key on the keyboard    ${TI_txt_code}    CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_code}    ${code}

Input name for the transfer-in

    [Return]   ${name}

    ${name}   Generate Random String  10  [LETTERS]

    Common - Press a key on the keyboard    ${TI_txt_name}    CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_name}    ${name}

Input location id for the transfer-in

    [Arguments]   ${data_location}

    [Return]   ${data_location}

    Common - Choose a value from combobox    ${TI_cbx_location_TI}    ${TI_cbx_input_location_TI.replace('location','${data_location}')}

Random location id for transfer-in

    [Return]   ${location_id}

    ${num}  Generate Random String  1   12

    ${location_id}   Run Keyword If    ${num}==1    Set Variable   Kho Long Xuyên LĐT
    ...   ELSE   Set Variable   Long Xuyên - Phú Hoà của Thời trang Mom and Dad Long Xuyên

Update location id for the transfer-in

    [Arguments]   ${data_location}

    [Return]   ${data_location}

#    ${data_location}    Random location id for transfer-in

    Common - Choose a value from combobox    ${TI_cbx_location_TI}    ${TI_cbx_input_location_TI.replace('location','${data_location}')}

Input requisitioner for the transfer-in

    [Arguments]   ${data_requisitioner}

    [Return]   ${data_requisitioner}

    Common - Choose a value from combobox    ${TI_cbx_requisitioner}    ${TI_cbx_input_requisitioner.replace('requisitioner','${data_requisitioner}')}

Random requisitioner for the transfer-in

    [Return]   ${requisitioner}

    ${num}  Generate Random String  1   12

    ${requisitioner}   Run Keyword If    ${num}==1    Set Variable   Nhân viên bán hàng phụ
    ...   ELSE   Set Variable   user store

Update requisitioner for the transfer-in

    [Arguments]   ${data_requisitioner}

    [Return]   ${data_requisitioner}

#    ${data_requisitioner}   Random requisitioner for the transfer-in

    Common - Choose a value from combobox    ${TI_cbx_requisitioner}    ${TI_cbx_input_requisitioner.replace('requisitioner','${data_requisitioner}')}

Input terms for the the transfer-in

    [Arguments]   ${data_terms}

    [Return]   ${data_terms}

    Common - Choose a value from combobox    ${TI_cbx_terms}    ${TI_cbx_input_terms.replace('terms','${data_terms}')}

Input order license for the transfer-in

    [Return]   ${order_license}

    ${order_license}   Generate Random String  10  [LETTERS]

    Common - Press a key on the keyboard    ${TI_txt_order_license}    CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_order_license}    ${order_license}

Input delivery address for the the transfer-in

    [Arguments]   ${data_delivery_address}

    [Return]   ${data_delivery_address}

    Common - Choose a value from combobox    ${TI_cbx_delivery_address}    ${TI_cbx_input_delivery_address.replace('delivery_address','${data_delivery_address}')}

Random delivery address for the transfer-in

    [Return]   ${delivery_address}

    ${num}  Generate Random String  1   12

    ${delivery_address}   Run Keyword If    ${num}==1    Set Variable   Thời trang LĐT
    ...   ELSE   Set Variable   Thời trang Mom and Dad Long Xuyên

Update delivery address for the the transfer-in

    [Arguments]   ${data_delivery_address}

    [Return]   ${data_delivery_address}

#    ${data_delivery_address}   Random delivery address for the transfer-in

    Common - Choose a value from combobox    ${TI_cbx_delivery_address}    ${TI_cbx_input_delivery_address.replace('delivery_address','${data_delivery_address}')}

Input note for the transfer-in

    [Return]   ${note}

    ${note}   Generate Random String  10  [LETTERS]

    Common - Press a key on the keyboard    ${TI_txt_note}    CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_note}    ${note}
    
TI - Navigate to item information tab

    Wait Until Page Contains Element    ${TI_label_note}   ${TIMEOUT}

    Common - Click on an element    ${TI_tab_item_infor}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

TI - Add item pop-up - Add item for the transfer-in

    [Arguments]   ${item_code}

    [Return]   ${get_item_list}
    
    Wait Until Page Contains Element    ${TI_btn_search_item}   ${TIMEOUT}

    Common - Click on an element    ${TI_btn_search_item}

    Wait Until Page Contains Element    ${TI_txt_search_add_item}   ${TIMEOUT}

    Wait Until Page Contains Element    ${TI_cbx_choose_category}   ${TIMEOUT}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    Common - Input text to element    ${TI_txt_search_add_item}    ${item_code}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    Wait Until Page Contains Element    ${TI_sub_table_radio.replace('item_code','${item_code}')}   ${TIMEOUT}

    Common - Click on an element    ${TI_sub_table_radio.replace('item_code','${item_code}')}

    Common - Click on an element    ${TI_btn_add_item}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    Common - Click on an element    ${TI_table_comlumn.replace('number','3')}
    
    Common - Click on an element    ${TI_table_comlumn.replace('number','3')}

    Input item description for TI

    Input item quantity for TI

    Input item price for TI

    Input item tax percent for TI
    
    Common - Click on an element    ${TI_sub_table_grid}

    Common - Click on an element    ${TI_sub_table_grid}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1
    
    Log    ${get_item_list}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

Add item pop-up - Add all item for TI

    [Return]   ${get_item_list}

    Common - Click on an element    ${TI_btn_search_item}

    Wait Until Page Contains Element    ${TI_cbx_choose_category}   ${TIMEOUT}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    Add item pop-up - Checking on the checkbox to Select all item

    Common - Click on an element    ${TI_btn_add_item}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

Add item pop-up - Checking on the checkbox to Select all item

    Common - Click on an element    ${TI_chk_select_all_item}

Add item pop-up - Add item for the TI when filter by department

    [Arguments]   ${department}

    [Return]   ${get_item_list}

    Common - Click on an element    ${TI_btn_search_item}

    Wait Until Page Contains Element    ${TI_cbx_choose_category}   ${TIMEOUT}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    Common - Choose a value from combobox    ${TI_cbx_department_add_item}    ${TI_cbx_input_department_add_item.replace('department','${department}')}

    Add item pop-up - Checking on the checkbox to Select all item

    Common - Click on an element    ${TI_btn_add_item}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

Add item pop-up - Add item for the TI when filter by category

    [Arguments]   ${category}

    [Return]   ${get_item_list}

    Common - Click on an element    ${TI_btn_search_item}

    Wait Until Page Contains Element    ${TI_cbx_choose_category}   ${TIMEOUT}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    Common - Choose a value from combobox    ${TI_cbx_category_add_item}    ${TI_cbx_input_category_add_item.replace('category','${category}')}

    Add item pop-up - Checking on the checkbox to Select all item

    Common - Click on an element    ${TI_btn_add_item}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

TI - Item information tab - Update quantity for items

    [Arguments]   ${quantity}

    [Return]   ${get_item_list}
    
    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${count}   Get Element Count    ${TI_table_row}

    FOR    ${i}    IN RANGE    1    ${count} + 1

        Common - Double click on an element    ${TI_column_quantity.replace('number','${i}')}

        Common - Press a key on the keyboard    ${TI_txt_item_quantity}    CTRL+a+BACKSPACE

        Common - Input text to element    ${TI_txt_item_quantity}    ${quantity}

    END

    Common - Click on an element    ${TI_sub_table_grid}

    Common - Click on an element    ${TI_sub_table_grid}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

Get item list on item information tab

    [Return]   ${item_list}

    ${item_list}   Common - Get data from a column    ${TI_table}    1

Input item description for TI

    ${description}   Generate Random String   10   [LETTERS]

    Common - Press a key on the keyboard   ${TI_txt_item_description}   CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_item_description}    ${description}

    Common - Press a key on the keyboard    ${TI_txt_item_description}    TAB

Input item quantity for TI

    ${quantity}   Generate Random String   1   123456789

    Common - Press a key on the keyboard   ${TI_txt_item_quantity}   CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_item_quantity}    ${quantity}

    Common - Press a key on the keyboard    ${TI_txt_item_quantity}    TAB

Input item price for TI

    ${price}   Generate Random String   6   123456789

    Common - Press a key on the keyboard   ${TI_txt_item_price}   CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_item_price}    ${price}

    Common - Press a key on the keyboard    ${TI_txt_item_price}    TAB

Input item tax percent for TI

    ${tax}   Generate Random String   2  123

    Common - Press a key on the keyboard   ${TI_txt_item_tax}   CTRL+a+BACKSPACE

    Common - Input text to element    ${TI_txt_item_tax}    ${tax}

    Common - Press a key on the keyboard    ${TI_txt_item_tax}    TAB

Update item for the transfer-in

    [Arguments]   ${item_code}

    [Return]   ${get_item_list}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${count_item}  Get Element Count    //a[contains(text(),'Xóa')]

    FOR    ${counter}    IN RANGE    ${count_item}

        Common - Click on an element    //a[contains(text(),'Xóa')]

    END

    ${get_item_list}   TI - Add item pop-up - Add item for the transfer-in    ${item_code}

TI - Click on Save Edit button to Update for the transfer-in

    Common - Click on an element    ${TI_btn_save_edit}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}

TI - Click on Save button to create the transfer-in

    Common - Click on an element    ${TI_btn_save}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}

View detail a transfer-in for verify

    [Arguments]   ${TI_code}

    Common - Search data    ${TI_code}

    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}
    
    Common - Click on an element    ${TI_table_code.replace('TI_code','${TI_code}')}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
    Wait Until Page Contains Element    ${TI_detail_label.replace('number','3')}   ${TIMEOUT}

Verify the user created TI successfully

    [Arguments]   ${create_TI_code}   ${create_TI_location}   ${create_TI_terms}   ${create_TI_name}   ${create_TI_requisitioner}   ${create_TI_address_company}   ${create_TI_item_list}

    Common - Search data    ${create_TI_code}

    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}

    Common - Click on an element    ${TI_table_code.replace('TI_code','${create_TI_code}')}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_detail_label.replace('number','3')}    ${TIMEOUT}

    ${detail_TI_code}                Common - Get text an element    ${TI_detail_label.replace('number','1')}

    ${detail_TI_location}            Common - Get text an element    ${TI_detail_label.replace('number','3')}

    ${detail_TI_terms}               Common - Get text an element    ${TI_detail_label.replace('number','4')}

    ${detail_TI_name}                Common - Get text an element    ${TI_detail_label.replace('number','5')}

    ${detail_TI_requisitioner}       Common - Get text an element    ${TI_detail_label.replace('number','6')}

    ${detail_TI_address_company}     Common - Get attribute an element    ${TI_address_in_company}    value

    Navigate to item information tab
    
    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${detail_TI_item_list}    Common - Get data from a column    ${TI_table}    1

    Should Be Equal    ${detail_TI_code}                ${create_TI_code}

    Should Be Equal    ${detail_TI_location}            ${create_TI_location}

    Should Be Equal    ${detail_TI_terms}               ${create_TI_terms}

    Should Be Equal    ${detail_TI_name}                ${create_TI_name}

    Should Be Equal    ${detail_TI_requisitioner}       ${create_TI_requisitioner}

    Should Be Equal    ${detail_TI_address_company}     ${create_TI_address_company}

    Lists Should Be Equal    ${detail_TI_item_list}    ${create_TI_item_list}     ignore_order=True

    Common - Click on an element    ${homepage_menu_transfer_in}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}

TI - Remove a transfer-in

    [Arguments]   ${transfer_in_code}

    Common - Search data    ${transfer_in_code}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${TI_menu_delete}
    
    Common - Click on an element    ${TI_btn_delete_TI}

    Reload Page

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}     ${TIMEOUT}

Open the print preview pop-up for verify

    [Arguments]   ${TI_code}

    Common - Search data    ${TI_code}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${TI_menu_view_printout}

TI - Open the print preview pop-up for verify and Verify the print preview data

    [Arguments]   ${TI_code}

    View detail a transfer-in for verify   ${TI_code}

    ${detail_TI_code}                Common - Get text an element    ${TI_detail_label.replace('number','1')}

    ${detail_TI_data_placed}         Common - Get text an element    ${TI_detail_label.replace('number','8')}

    ${detail_TI_location}            Common - Get text an element    ${TI_detail_label.replace('number','3')}
    
    ${detail_TI_address_out}         Common - Get text an element    ${TI_detail_address_out}

    ${detail_TI_address_company}     Common - Get attribute an element    ${TI_detail_address_company}   value

    ${detail_TI_address_in}          Common - Get attribute an element    ${TI_detail_address_in}   value

    ${detail_TI_phone_number}        Common - Get attribute an element    ${TI_detail_phone_number}   value

    ${detail_TI_terms}               Common - Get text an element    ${TI_detail_label.replace('number','4')}

    ${detail_TI_name}                Common - Get text an element    ${TI_detail_label.replace('number','5')}

    ${detail_TI_requisitioner}       Common - Get text an element    ${TI_detail_label.replace('number','6')}

    ${detail_TI_address_company}     Common - Get attribute an element    ${TI_address_in_company}    value
    
    Common - Click on an element    ${TI_btn_edit_TI}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_cbx_delivery_address}   ${TIMEOUT}

    Navigate to item information tab

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${detail_TI_item_list}    Common - Get data from a column    ${TI_table}    1

    ${detail_TI_total_price}   Common - Get attribute an element    ${TI_txt_total_price}    title

    # Back to the transfer in list page and open the print preview pop-up
    
    Common - Click on an element    ${homepage_menu_transfer_in}
    
    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    Open the print preview pop-up for verify   ${TI_code}

    ${print_TI_code}   Common - Get text an element    ${TI_print_view_code}

    ${print_TI_company}   Common - Get text an element    ${TI_print_view_infor.replace('number','4')}

    ${print_TI_location}        Common - Get text an element    ${TI_print_view_infor.replace('number','5')}

    ${print_TI_phone_number}    Common - Get text an element    ${TI_print_view_infor.replace('number','6')}

    ${print_TI_address_out}     Common - Get text an element    ${TI_print_view_infor.replace('number','7')}

    ${print_TI_address_in}      Common - Get text an element    ${TI_print_view_infor.replace('number','10')}

    Should Be Equal    ${print_TI_code}    ${detail_TI_code}

#    Should Be Equal    ${print_TI_company}    ${detail_TI_address_company}

    Should Be Equal    ${print_TI_location}    ${detail_TI_location}

    Should Be Equal    ${print_TI_phone_number}    ${detail_TI_phone_number}

    Should Be Equal    ${print_TI_address_out}    ${detail_TI_address_out}

    Should Be Equal    ${print_TI_address_in}    ${detail_TI_address_in}
    
    ${print_TI_item_list}   Common - Get data from a column    ${TI_print_view_table_item}    2

    Remove From List    ${print_TI_item_list}    0
    
    ${print_TI_total_price}     Common - Get text an element    ${TI_print_view_end_bill.replace('number','5')}
    
    Should Be Equal    ${detail_TI_item_list}       ${print_TI_item_list}

    Should Be Equal    ${detail_TI_total_price}     ${print_TI_total_price}

    Reload Page

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

Filling all required fields to create a TI

    [Arguments]   ${data_location}   ${data_terms}   ${data_requisitioner}   ${data_delivery_address}

    [Return]   ${data_input}

    ${data_input}   Create List

    ${TI_code}  Input code for the transfer-in

    Append To List   ${data_input}   ${TI_code}

    ${TI_location}  Input location id for the transfer-in   ${data_location}

    Append To List   ${data_input}   ${TI_location}

    ${TI_terms}  Input terms for the the transfer-in    ${data_terms}

    Append To List   ${data_input}   ${TI_terms}

    ${TI_name}  Input name for the transfer-in

    Append To List   ${data_input}   ${TI_name}

    ${TI_requisitioner}  Input requisitioner for the transfer-in   ${data_requisitioner}

    Append To List   ${data_input}   ${TI_requisitioner}

    ${TI_delivery_address}  Input delivery address for the the transfer-in  ${data_delivery_address}

    Append To List   ${data_input}   ${TI_delivery_address}

    Log    ${data_input}

Receive all serial item for TI note

    [Arguments]  ${TI_code}   ${serial_quantity}

    [Return]   ${get_item_list}

    Common - Search data    ${TI_code}
    
    Product - Click on action button to open the menu list
    
    Common - Click on an element    ${TI_menu_import}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${count_table_row}    Get Element Count    ${TI_table_row}

    FOR    ${i}    IN RANGE    1    ${count_table_row} + 1

        Wait Until Page Contains Element    ${TI_table_serial_quantity.replace('number','${i}')}   ${TIMEOUT}

        Common - Click on an element    ${TI_table_serial_quantity.replace('number','${i}')}
        
        Common - Click on an element    ${TI_btn_quantity_serial}

        Sleep   1s

        Add all serial item for TI    ${serial_quantity}

        Common - Click on an element    ${TI_sub_table_grid}

        Common - Click on an element    ${TI_sub_table_grid}

    END

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

TI - Receive partially for serial item

    [Arguments]  ${TI_code}   ${serial_quantity}

    [Return]   ${get_item_list}

    Common - Search data    ${TI_code}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${TI_menu_import}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${count_table_row}    Get Element Count    ${TI_table_row}

    FOR    ${i}    IN RANGE    1    ${count_table_row} + 1

        Wait Until Page Contains Element    ${TI_table_serial_quantity.replace('number','${i}')}   ${TIMEOUT}

        Common - Click on an element    ${TI_table_serial_quantity.replace('number','${i}')}

        Common - Click on an element    ${TI_btn_quantity_serial}

        Sleep   1s

        Add partially serial item for TI    ${serial_quantity}

    END

    Common - Click on an element    ${TI_sub_table_grid}

    Common - Click on an element    ${TI_sub_table_grid}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

TI - Receive partially for standar products

    [Arguments]  ${TI_code}   ${receive_quantity}

    [Return]   ${receive_quantity}

    Common - Search data    ${TI_code}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${TI_menu_import}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${count_table_row}    Get Element Count    ${TI_table_row}

    FOR    ${i}    IN RANGE    1    ${count_table_row} + 1

        Wait Until Page Contains Element    ${TI_table_serial_quantity.replace('number','${i}')}   ${TIMEOUT}

        Common - Click on an element    ${TI_table_serial_quantity.replace('number','${i}')}

#        ${quantity}   Common - Get attribute an element    ${TI_txt_quantity_standar.replace('number','${i}')}    aria-valuenow

#        Common - Click on an element    //*[@id="QuantityOrdered"]

        Common - Clear text on an element    //*[@id="QuantityOrdered"]

        Common - Click on an element    //span//input[contains(@class,'s2-textbox k')]

        Common - Input text to element    //*[@id="QuantityOrdered"]    ${receive_quantity}

        Common - Press a key on the keyboard     ${TI_txt_recieve_quantity}    TAB

        Common - Click on an element    ${TI_sub_table_grid}

        Common - Click on an element    ${TI_sub_table_grid}
        
        Log    ${receive_quantity}

    END

TI - Receive all for standar products

    [Arguments]  ${TI_code}

    Common - Search data    ${TI_code}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${TI_menu_import}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    TI - Clicking on Import full button to import full item of TI note

Receive exist serial item for TI note

    [Arguments]  ${TI_code}

    [Return]   ${get_item_list}

    Common - Search data    ${TI_code}

    Product - Click on action button to open the menu list

    Common - Click on an element    ${TI_menu_import}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${count_table_row}    Get Element Count    ${TI_table_row}

    FOR    ${i}    IN RANGE    1    ${count_table_row} + 1

        Wait Until Page Contains Element    ${TI_table_serial_quantity.replace('number','${i}')}   ${TIMEOUT}

        Common - Click on an element    ${TI_table_serial_quantity.replace('number','${i}')}

        ${get_quantity}   Common - Get attribute an element    ${TI_table_quantity.replace('number','${i}')}    aria-valuenow

        ${get_quantity_import}  Common - Get attribute an element    ${TI_table_quantity_import.replace('number','${i}')}    aria-valuenow

        ${quantity_exist}   Evaluate    ${get_quantity}-${get_quantity_import}

        Common - Click on an element    ${TI_btn_quantity_serial}

        Sleep   1s

        Add partially serial item for TI    ${quantity_exist}

        Log    ${quantity_exist}

    END

    Common - Click on an element    ${TI_sub_table_grid}

    Common - Click on an element    ${TI_sub_table_grid}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

    ${get_item_list}    Common - Get data from a column    ${TI_table}    1

Add all serial item for TI

    [Arguments]   ${serial_quantity}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    FOR    ${i}    IN RANGE    1    ${serial_quantity} + 1

        Wait Until Page Contains Element    ${TI_sub_table_select_item.replace('number','${i}')}   ${TIMEOUT}

        Common - Click on an element    ${TI_sub_table_select_item.replace('number','${i}')}

        Sleep   1s

    END
    
    Common - Click on an element    ${TI_btn_add_serial_item}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

Add partially serial item for TI

    [Arguments]   ${serial_quantity}

    Wait Until Page Contains Element    ${TI_sub_table_row}   ${TIMEOUT}

    ${1}    Set Variable   1

    ${partially_serial}   Evaluate    ${serial_quantity}-${1}

    FOR    ${i}    IN RANGE    1    ${partially_serial} + 1

        Common - Click on an element    ${TI_sub_table_select_item.replace('number','${i}')}

        Sleep   1s

    END

    Common - Click on an element    ${TI_btn_add_serial_item}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

TI - Clicking on Import full button to import full item of TI note

    Common - Click on an element    ${TI_btn_import_full}
    
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    
    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

TI - Clicking on Import partially button to import partially item of TI note

    Common - Click on an element    ${TI_btn_import_partial}

    Wait Until Page Contains Element    ${TI_btn_receive_partially}   ${TIMEOUT}

TI - Import partially item for TI when select Import partially radio button

    Common - Click on an element    ${TI_rad_import_partial}

    Common - Click on an element    ${TI_btn_receive_partially}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}

TI - Import partially item for TI when select Import partially and create new TI radio button

    Common - Click on an element    ${TI_rad_import_and_create}

    Common - Click on an element    ${TI_btn_receive_partially}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}
    
TI - Import partially item for TI when select Import partially and complete radio button

    Common - Click on an element    ${TI_rad_import_and_complete}

    Common - Click on an element    ${TI_btn_receive_partially}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Wait Until Page Contains Element    ${TI_table_row}   ${TIMEOUT}