*** Settings ***
Variables  ../Locators/Quote_Order_Locators.py
Variables  ../Locators/Common_Locators.py
Resource    Common_Keywords.robot
Resource    Products_Keywords.robot

*** Variables ***
${form_title}       TẠO BÁO GIÁ

*** Keywords ***
Navigate to the Quote Order list

    Menu - Click on the Sales Management menu

    Sleep   1s

    Menu - Click on the Quote Order menu

Click on the Save button - Create a new customer form

    Common - Click on an element        ${quote_order_btn_save_customer_draft}

Click on the "Create a new Quote order" button

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element    ${quote_order_btn_create}

    ${get_title}     Common - Get text an element    ${quote_order_title_page}

    should be equal    ${form_title}      ${get_title}

Click on the Create new customer button

    Common - Click on an element    ${quote_order_btn_create_new_customer_draft}

Input name customer

    [Arguments]   ${i_name}

    Common - Input text to element      ${quote_order_txt_name_customer}        ${i_name}

Input phone customer

    [Arguments]   ${i_phone}

    Common - Input text to element      ${quote_order_txt_phone_number}        ${i_phone}

Input email customer

    [Arguments]   ${i_email}

    Common - Input text to element      ${quote_order_txt_email}        ${i_email}

Click on the Address tab

    Common - Click on an element        ${quote_order_tab_address}

Click on the Item tab

    Common - Click on an element        ${quote_order_tab_item}

Select a country

    [Arguments]    ${i_country}

    Common - Click on an element        ${quote_order_cbx_country}

    Common - Click on an element         ${quote_order_cbx_name_country.replace('value','${i_country}')}

Select a city

    [Arguments]  ${i_city}

    Common - Click on an element        ${quote_order_cbx_city}

    Common - Click on an element        ${quote_order_cbx_name_city.replace('value','${i_city}')}

Select a State

    [Arguments]    ${i_state}

    Common - Click on an element        ${quote_order_cbx_state}

    Common - Click on an element        ${quote_order_cbx_name_state.replace('value','${i_state}')}

Input Address customer

    [Arguments]  ${i_address}

    Common - Input text to element      ${quote_order_txt_address}      ${i_address}

Create a new customer draft
    [Arguments]    ${i_name_cus}   ${i_phone}   ${i_email}    ${i_address}    ${i_country}    ${i_city}    ${i_state}

    Click on the Create new customer button

    Input name customer     ${i_name_cus}

    Input phone customer   ${i_phone}

    Input email customer   ${i_email}

    Click on the Address tab

    Select a country     ${i_country}

    select a city       ${i_city}

    select a state      ${i_state}

    Input Address customer      ${i_address}

    Click on the Save button - Create a new customer form

Select a customer

    [Arguments]     ${i_name_cus}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element        ${quote_order_cbx_name_customer}

    sleep   1s

    Common - Click on an element         ${quote_order_cbx_cus_name.replace('value','${i_name_cus[1]}')}

Edit a customer

    [Arguments]     ${i_name_cus}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element        ${quote_order_cbx_name_customer}

    Common - Click on an element        ${quote_order_cbx_edit_cus_name.replace('value','${i_name_cus[1]}')}

# Add an item keyword
Add an item to the quote order

    [Arguments]   ${i_id_item}

    click on the item tab

    Add an item    ${i_id_item[0]}

    Verify the item added on the datagird successfully      ${i_id_item}

Verify the item added on the datagird successfully

    [Arguments]    ${i_id_item}

    ${get_name_item}        Get Table Cell      ${quote_order_item_data_grid}        1        1

    ${get_price_item}        Get Table Cell      ${quote_order_item_data_grid}        2        2

    ${item_data}        Set Variable        ${i_id_item[0]} - ${i_id_item[1]} - ${i_id_item[3]}

    should be equal     ${get_name_item}        ${item_data}
    should be equal    ${get_price_item}    ${i_id_item[4]}

Add an item

    [Arguments]    ${i_id_item}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Click on an element        ${quote_order_txt_add_item}
    Sleep  1s
    Common - Input text to element      ${quote_order_txt_add_item}     ${i_id_item}

    sleep  3s

    Common - Press a key on the keyboard        ${quote_order_txt_add_item}     ARROW_DOWN

    Common - Press a key on the keyboard        ${quote_order_txt_add_item}     ENTER

Get infomation of the item
    [Arguments]    ${i_id_item}

    [Return]   ${item_list}

    Menu - Click on the Items Management menu

    Sleep   1s

    Menu - Click on the Items menu

    search a quote order    ${i_id_item}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    sleep  1s

    ${get_id_item}       Get Table Cell      ${item_grid_locator}        1        2

    ${get_name_item}       Get Table Cell      ${item_grid_locator}        1        3

    ${get_type_item}       Get Table Cell      ${item_grid_locator}       1        4

    ${get_unit_item}       Get Table Cell      ${item_grid_locator}        1        5

    ${get_price_item}       Get Table Cell     ${item_grid_locator}       1        6

    ${item_list}        create list     ${get_id_item}   ${get_name_item}   ${get_type_item}    ${get_unit_item}    ${get_price_item}

    Log List         ${item_list}

Get information of the customer

    [Arguments]   ${i_name_cus}

    [Return]    ${cus_list}

    Menu - Click on the Customers Management menu

    Sleep   1s

    Menu - Click on the Customers menu

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Search a Quote Order        ${i_name_cus}

    Click on the context menu

    View detail a customer

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_id_cus}       Common - Get text an element    ${id_cus_locator}

    ${get_name_cus}      Common - Get text an element     ${name_cus_locator}

    ${get_phone_cus}      Common - Get text an element     ${phone_cus_locator}

    ${get_email_cus}       Common - Get text an element     ${email_cus_locator}

    Navigate to the Delivery address tab

    ${get_country}       Common - Get text an element     ${country_locator}

    ${get_city}      Common - Get text an element     ${city_locator}

    ${get_state}       Common - Get text an element     ${state_locator}

    ${get_address}      Common - Get text an element    ${address_locator}

    ${cus_list}    create list     ${get_id_cus}    ${get_name_cus}    ${get_phone_cus}    ${get_email_cus}   ${get_country}   ${get_city}    ${get_state}   ${get_address}

    Log List         ${cus_list}

Click on the Save button - Quote Order
    [Return]    ${text}

    Common - Click on an element      ${btn_save_quote_order_locator}

    ${text}    Common - Get text an element        ${message_locator}

    ${text}     Remove String      ${text}      Báo giá [

    ${text}     Remove String      ${text}      ] tạo thành công

Cancel a Quote order

    [Arguments]  ${id_order}

    Menu - Click On The Quote Order Menu

    Common - Search data    ${id_order}

    Click on action button to open the menu list
    
    Common - Click on an element        ${btn_cancel_context_menu}

    Common - Click on an element        ${btn_confirm_cancel_quote_order_locator}

    Common - Get text an element        ${message_locator}

Navigate to Cancel QO list page

    [Arguments]   ${status}
    
    Common - Choose a value from combobox    ${QO_cbx_status}    ${QO_input_status.replace('status','${status}')}
    
    Wait Until Page Contains Element    ${quote_order_table_row}   ${TIMEOUT}

Remove a Quote order

    [Arguments]  ${id_order}

#    Menu - Click On The Quote Order Menu

    Common - Search data    ${id_order}

    Click on action button to open the menu list

    Common - Click on an element        ${btn_remove_context_menu}

    Common - Click on an element        ${btn_confirm_remove_quote_order_locator}

    Common - Get text an element        ${message_locator}

Search a Quote Order

    [Arguments]    ${id_quote_order}

    Common - Input text to element      ${quote_order_txt_search}       ${id_quote_order}

    Common - Press a key on the keyboard        ${quote_order_txt_search}      ENTER

Store - Verify the quote order created successfully

    [Arguments]     ${id_quote}     ${cus_list}     ${item_list}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Search data   ${id_quote}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

#    ${rows}      Get Element Count        Xpath=//*[@id="grdQuote"]/div[3]/table/tbody/tr
#    ${cols}      Get Element Count        Xpath=//*[@id="grdQuote"]/div[3]/table/tbody/tr[1]/td
#
#    Log   ${cols}
#    Log   ${rows}

    Sleep  1s

    ${get_id}       Get Table Cell      ${quote_grid_locator}       1        2

    ${get_name_cus}       Get Table Cell     ${quote_grid_locator}       1        3

    should be equal     ${get_id}       ${id_quote}

    should be equal     ${get_name_cus}     ${cus_list[1]}

    Common - Double click on an element     ${quote_order_link_id_cus.replace('value','${get_id}')}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_name_cus}     Common - Get text an element      ${name_cus_view_detail_quote_locator}

    ${get_phone_cus}     Common - Get text an element      ${phone_cus_view_detail_quote_locator}

    ${get_email_cus}     Common - Get text an element      ${email_cus_view_detail_quote_locator}

    ${get_address_cus}     Common - Get text an element      ${address_cus_view_detail_quote_locator}

    should be equal     ${cus_list[1]}       ${get_name_cus}

    should be equal     ${cus_list[2]}     ${get_phone_cus}

    should be equal     ${cus_list[3]}       ${get_email_cus}

Central - Verify the quote order created successfully

    [Arguments]     ${id_quote}     ${cus_list}     ${item_list}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Search data    ${id_quote}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

#    ${rows}      Get Element Count        Xpath=//*[@id="grdQuote"]/div[3]/table/tbody/tr
#    ${cols}      Get Element Count        Xpath=//*[@id="grdQuote"]/div[3]/table/tbody/tr[1]/td
#
#    Log   ${cols}
#    Log   ${rows}

    Sleep  1s

    ${get_id}       Get Table Cell      ${quote_grid_locator}        1        2

    ${get_name_cus}       Get Table Cell      ${quote_grid_locator}        1        3

    should be equal     ${get_id}       ${id_quote}

    should be equal     ${get_name_cus}     ${cus_list[1]}

    Common - Double click on an element     ${quote_order_link_id_cus.replace('value','${get_id}')}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    ${get_name_cus}     Common - Get text an element      ${name_cus_view_detail_quote_locator}

    ${get_phone_cus}     Common - Get text an element      ${phone_cus_view_detail_quote_locator}

    ${get_email_cus}     Common - Get text an element      ${email_cus_view_detail_quote_locator}

    ${get_address_cus}     Common - Get text an element      ${address_cus_view_detail_quote_locator}

    should be equal     ${cus_list[1]}       ${get_name_cus}

    should be equal     ${cus_list[2]}     ${get_phone_cus}

    should be equal     ${cus_list[3]}       ${get_email_cus}
    
    Common - Click on an element    ${homepage_menu_quote_order}
    
    Wait Until Page Contains Element    ${quote_order_table_row}   ${TIMEOUT}

Edit the quote order

    [Arguments]    ${get_id}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Search a Quote Order    ${get_id}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}

    Common - Double click on an element     ${quote_order_link_id_cus.replace('value','${get_id}')}
    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}
    Common - Click on an element        ${btn_edit_quote_locator}