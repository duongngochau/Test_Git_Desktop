*** Settings ***
Variables   ../Locators/Common_Locators.py
Variables   ../Locators/Transfer_out_Locators.py
Variables   ../Data/TransferOutData.yaml
Library    String
Library    Collections
Library    DateTime
Resource    Common_Keywords.robot
*** Variables ***
${Create_TO_title}       TẠO PHIẾU XUẤT KHO
${popup_confirm_delete_title}       XÓA PHIẾU XUẤT KHO
${Update_TO_title}       SỬA PHIẾU XUẤT KHO
${Viewde_details_TO_title}       XEM CHI TIẾT PHIẾU XUẤT KHO
${popup_preview_title}       BẢN IN
${Transfer_out_title}       XUẤT HÀNG
*** Keywords ***

TO - Navigate to Transfer out list page

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Menu - Click on the Purchase Management Menu

    Menu - Click on the Transfer out Menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

TO - Navigate to Transfer out history

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    Menu - Click on the Purchase Management Menu

    Menu - Click on the Transfer out history Menu

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

TO - Navigate to create transfer-out page

    Common - Click on an element    ${TO_btn_create_TO}

    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    ${get_title}  Common - Get text an element     ${TO_title_page}
    should be equal    ${Create_TO_title}      ${get_title}

TO - Input TO code
    [Arguments]     ${code}
    Common - Input text to element  ${TO_txt_code}  ${code}

TO - Input a random TO code
    [Return]  ${code}
    ${code}   Generate Random String  7  123456789
    Common - Input text to element      ${TO_txt_code}        ${code}

TO - Get TO code by TO name
    [Arguments]     ${i_TO_name}
    [Return]  ${code}
    ${code}  Common - Get text an element  ${TO_TOcode_ofTOname.replace('TOname','${i_TO_name}')}

TO - Select a warehouse to transfer-out
    [Arguments]     ${i_to_warehouse}
   Common - Choose a value from combobox  ${TO_cbb_warehouse}  ${TO_cbb_warehouse_option.replace('warehouse','${i_to_warehouse}')}

TO - Select a TO type
    [Arguments]     ${i_to_type}
   Common - Choose a value from combobox  ${TO_cbb_type}  ${TO_cbb_type_option.replace('type','${i_to_type}')}

TO - Input TO name
    [Arguments]     ${name}
    Common - Input text to element  ${TO_txt_name}  ${name}

TO - Input a random TO name
    [Return]  ${name}
    ${name}   Generate Random String  7  123456789
    Common - Input text to element      ${TO_txt_name}        ${name}

TO - Select the shipping address and edit address details
    [Arguments]     ${i_to_address}  ${i_to_address_details}  ${i_to_address_phone}
   Common - Choose a value from combobox  ${TO_cbb_shippingaddress}  ${TO_cbb_shippingaddress_option.replace('name','${i_to_address}')}
    Common - Clear text on an element  ${TO_input_shippingaddress_details}
    Common - Input text to element  ${TO_input_shippingaddress_details}  ${i_to_address_details}
    Common - Clear text on an element  ${TO_inputshippingaddress_phone}
    Common - Input text to element  ${TO_inputshippingaddress_phone}  ${i_to_address_phone}
TO - Select the shipping address
    [Arguments]     ${i_to_address}  ${i_to_address_details}  ${i_to_address_phone}
   Common - Choose a value from combobox  ${TO_cbb_shippingaddress}  ${TO_cbb_shippingaddress_option.replace('name','${i_to_address}')}
    ${get_address_details}  Get value  ${TO_input_shippingaddress_details}
    ${get_phone}  Get value  ${TO_inputshippingaddress_phone}
    Should be equal    ${get_address_details}  ${i_to_address_details}
    Should be equal    ${get_phone}  ${i_to_address_phone}

TO - Select the approver
    [Arguments]     ${i_approver}
   Common - Choose a value from combobox  ${TO_cbb_approver}  ${TO_cbb_approver_option.replace('name','${i_approver}')}

TO - Input transfer-out date
    [Arguments]     ${i_transferout_date}
    Common - Click on an element    ${TO_dtp_date}
    ${DATE}=  Convert Date  ${i_transferout_date}    datetime  date_format=%d-%m-%Y
    log   ${DATE}
    ${year}  Convert to Integer  ${DATE.year}
    ${month}  Convert to Integer  ${DATE.month}
    ${month}=  evaluate  ${month} - 1
    ${day}  Convert to Integer  ${DATE.day}
    ${i_transferout_date}  Set Variable  ${year}/${month}/${day}
    log  ${i_transferout_date}
    Common - Element should be visible for at least    ${TO_dtp_date_value.replace('date','${i_transferout_date}')}    0.1s
    Common - Click on an element    ${TO_dtp_date_value.replace('date','${i_transferout_date}')}
TO - Input required date
    [Arguments]     ${i_required_date}
    Common - Click on an element    ${TO_dtp_requiredday}
    ${DATE}=  Convert Date  ${i_required_date}    datetime  date_format=%d-%m-%Y
    log   ${DATE}
    ${year}  Convert to Integer  ${DATE.year}
    ${month}  Convert to Integer  ${DATE.month}
    ${month}=  evaluate  ${month} - 1
    ${day}  Convert to Integer  ${DATE.day}
   ${i_required_date}  Set Variable  ${year}/${month}/${day}
    log  ${i_required_date}
    Common - Element should be visible for at least    ${TO_txt_requiredday_value.replace('date','${i_required_date}')}    0.1s
    Common - Click on an element    ${TO_txt_requiredday_value.replace('date','${i_required_date}')}

TO - Input TO note
    [Arguments]     ${note}
    Common - Input text to element  ${TO_txt_note}  ${note}

TO - Input shipping cost
    [Arguments]     ${i_TO_shippingcost}
    Common - Click on an element    ${TO_txt_shippingcost1}
    Common - Press a key on the keyboard      ${TO_txt_shippingcost}  CTRL+a+BACKSPACE
    Common - Input text to element  ${TO_txt_shippingcost}  ${i_TO_shippingcost}
TO - Input other cost
    [Arguments]     ${i_TO_othercost}
    Common - Click on an element    ${TO_txt_othercost1}
    Common - Press a key on the keyboard      ${TO_txt_othercost}  CTRL+a+BACKSPACE
    Common - Input text to element  ${TO_txt_othercost}  ${i_TO_othercost}

TO - Navigate to the item tab
    Common - Click on an element    ${TO_tab_item}
    Wait until page contains element  ${TO_title_itemcode_column}

TO - Input an item code and add it to TO
    [Arguments]     ${i_item_code}
    Common - Click on an element    ${TO_txt_search}
    Common - Clear text on an element  ${TO_txt_search}
    Common - Input text to element  ${TO_txt_search}  ${i_item_code} 9
    ${status}  Run Keyword And Return Status  Element should be visible  ${TO_txt_search_result.replace('item_code','${i_item_code}')}
    IF  ${status}==True
        Common - Click on an element  ${TO_txt_search_result.replace('item_code','${i_item_code}')}
    END
    Common - Click on an element    ${TO_tab_item}
    Common - Click on an element    ${TO_table_item_quantity}
    ${get_quantity}  Get value  ${TO_txt_item_quantity}
    IF  ${get_quantity}==0
        Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
        Common - Input text to element  ${TO_txt_item_quantity}  1
    END
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    Element should be visible  ${TO_table_item_code.replace('itemcode','${i_item_code}')}

TO - Add a product to TO by button
    [Arguments]     ${i_item_code}
    Common - Click on an element  ${TO_txt_btn_search}
    Common - Click on an element  ${TO_cb_itemcode.replace('itemcode','${i_item_code}')}
    Common - Click on an element    ${TO_btn_add_selected_items}
    Sleep  1s
    Common - Click on an element    ${TO_table_item_quantity}
    ${get_quantity}  Get value  ${TO_txt_item_quantity}
    IF  ${get_quantity}==0
        Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
        Common - Input text to element  ${TO_txt_item_quantity}  1
    END
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    Wait until element is visible  ${TO_table_item_code.replace('itemcode','${i_item_code}')}

TO - Click on Save button
    Common - Click on an element  ${TO_btn_save}
     ${text}    Common - Get text an element        ${message_locator}
    log   ${text}

TO - Click on Save and approve button
    Common - Click on an element  ${TO_btn_save_approve}
     ${text}    Common - Get text an element        ${message_locator}
    log   ${text}

TO - Click on Save button and confirm
    Common - Click on an element  ${TO_btn_save}
    Common - Click on an element  ${TO_btn_confirm_create_TO}
     ${text}    Common - Get text an element        ${message_locator}
    log   ${text}

TO - Send TO to the approver
    [Arguments]     ${i_TO_code}
    Common - Click on an element  ${TO_actionmenu.replace('TOcode','${i_TO_code}')}
    Sleep   1s
    Common - Click on an element  ${TO_actionmenu_send_to_approver}
    ${message}  Common - Get text an element  ${message_locator}
    Should be equal  ${message}  Gửi duyệt thành công
    Reload Page
    ${status}  Common - Get text an element  ${TO_TOcode_status.replace('TOcode','${i_TO_code}')}
    Should be equal  ${status}  Chờ duyệt

TO - Reject and save TO
    [Arguments]     ${i_TO_code}
    TO - Navigate to the details page  ${i_TO_code}
    Common - Click on an element    ${TO_details_btn_reject_and_save}
    ${message}  Common - Get text an element  ${message_locator}
    Should be equal  ${message}  Phiếu xuất kho ${i_TO_code} đã từ chối
    ${status}  Common - Get text an element  ${TO_TOcode_status.replace('TOcode','${i_TO_code}')}
    Should be equal  ${status}  Từ chối

TO - Approve and save TO
    [Arguments]     ${i_TO_code}
    TO - Navigate to the details page  ${i_TO_code}
    Common - Click on an element    ${TO_details_btn_approve_and_save}
    ${message}  Common - Get text an element  ${message_locator}
    Should be equal  ${message}  Phiếu xuất kho ${i_TO_code} đã được duyệt
    ${status}  Common - Get text an element  ${TO_TOcode_status.replace('TOcode','${i_TO_code}')}
    Should be equal  ${status}  Đã duyệt

TO - Delete TO by button in the index page
    [Arguments]     ${i_TOcode}
    Common - Click on an element  ${TO_cb_TOcode.replace('TOcode','${i_TOcode}')}
    Common - Click on an element  ${TO_btn_delete_TO}
    ${text}  Common - Get text an element  ${TO_popup_confirm_delete_title}
    Should be equal     ${text}  ${popup_confirm_delete_title}
    Common - Click on an element  ${TO_btn_confirm_delete_TO}
    ${message}  Common - Get text an element  ${message_locator}
    Should be equal  ${message}  Xóa thành công phiếu xuất ${i_TO_code}
    TO - Verify TO does not display in the index page  ${i_TO_code}
#    Wait until page does not contain element  ${TO_cb_TOcode.replace('TOcode','${i_TOcode}')}
#    Common - Input text to element  ${TO_txt_search_TO}  ${i_TOcode}
#    Wait until page does not contain element  ${TO_cb_TOcode.replace('TOcode','${i_TOcode}')}

TO - Delete TO by action button
    [Arguments]     ${i_TO_code}
    Common - Click on an element  ${TO_actionmenu.replace('TOcode','${i_TO_code}')}
    Sleep   1s
    Common - Click on an element  ${TO_actionmenu_delete}
    ${text}  Common - Get text an element  ${TO_popup_confirm_delete_title}
    Should be equal     ${text}  ${popup_confirm_delete_title}
    Common - Click on an element  ${TO_btn_confirm_delete_TO}
    ${message}  Common - Get text an element  ${message_locator}
    Should be equal  ${message}  Xóa thành công phiếu xuất ${i_TO_code}
    TO - Verify TO does not display in the index page  ${i_TO_code}
TO - Verify the TO display in grid
    [Arguments]     ${i_to_code}  ${i_to_name}  ${i_PO_warehouse}  ${i_to_status}
    ${get_code}  Common - Get text an element  ${TO_TOcode.replace('TOcode','${i_to_code}')}
    ${get_name}  Common - Get text an element  ${TO_TOcode_TOname.replace('TOcode','${i_to_code}')}
    ${get_warehouse}  Common - Get text an element  ${TO_TOcode_warehouse.replace('TOcode','${i_to_code}')}
    ${get_created_day}  Common - Get text an element  ${TO_TOcode_created_day.replace('TOcode','${i_to_code}')}
    ${get_status}  Common - Get text an element  ${TO_TOcode_status.replace('TOcode','${i_to_code}')}
    ${today}=    Get Current Date    result_format=%d-%m-%Y
    Should be equal  ${get_code}  ${i_to_code}
    Should be equal  ${get_name}  ${i_to_name}
    Should be equal  ${get_warehouse}  ${i_PO_warehouse}
    Should be equal  ${get_created_day}  ${today}
    Should be equal  ${get_status}  ${i_to_status}

TO - Verify the TO display in grid after updating
    [Arguments]     ${i_to_code}  ${i_to_name}  ${i_PO_warehouse}  ${i_to_status}
    ${get_code}  Common - Get text an element  ${TO_TOcode.replace('TOcode','${i_to_code}')}
    ${get_name}  Common - Get text an element  ${TO_TOcode_TOname.replace('TOcode','${i_to_code}')}
    ${get_warehouse}  Common - Get text an element  ${TO_TOcode_warehouse.replace('TOcode','${i_to_code}')}
    ${get_updated_day}  Common - Get text an element  ${TO_TOcode_updated_day.replace('TOcode','${i_to_code}')}
    ${get_status}  Common - Get text an element  ${TO_TOcode_status.replace('TOcode','${i_to_code}')}
    ${today}=    Get Current Date    result_format=%d-%m-%Y
    Should be equal  ${get_code}  ${i_to_code}
    Should be equal  ${get_name}  ${i_to_name}
    Should be equal  ${get_warehouse}  ${i_PO_warehouse}
    Should be equal  ${get_updated_day}  ${today}
    Should be equal  ${get_status}  ${i_to_status}


TO - Input Description, Quantity, Price, Tax of an item
    [Arguments]     ${i_item}
    Common - Click on an element  ${TO_table_item_code.replace('itemcode','${i_item.code}')}
#    Verify if a  varible exists, if it exit, script will verify if it's null and then starting input element
    ${exist}  Run Keyword And Return Status  Variable Should Exist  ${i_item.description}
    Run keyword if  '${exist}' == 'True'  Run keyword if  '${i_item.description}' !=''  Common - Input text to element  ${TO_txt_item_description}  ${i_item.description}

    ${exist}  Run Keyword And Return Status  Variable Should Exist  ${i_item.quantity}
    Run keyword if  '${exist}' == 'True'  Run keyword if  '${i_item.quantity}' !=''  Run keywords  Common - Click on an element  ${TO_table_item_quantity.replace('itemcode','${i_item.code}')}
    ...  AND  Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
    ...  AND  Common - Input text to element  ${TO_txt_item_quantity}  ${i_item.quantity}

    Run keyword if  '${exist}' == 'False'  Run keywords  Common - Click on an element  ${TO_table_item_quantity.replace('itemcode','${i_item.code}')}
    ...  AND  Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
    ...  AND  Common - Input text to element  ${TO_txt_item_quantity}  1

    Run keyword if  '${exist}' == 'True'  Run keyword if  '${i_item.quantity}' ==''  Run keywords  Common - Click on an element  ${TO_table_item_quantity.replace('itemcode','${i_item.code}')}
    ...  AND  Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
    ...  AND  Common - Input text to element  ${TO_txt_item_quantity}  1

    ${exist}  Run Keyword And Return Status  Variable Should Exist  ${i_item.price}
    Run keyword if  '${exist}' == 'True'  Run keyword if  '${i_item.price}' !=''  Run keywords  Common - Click on an element  ${TO_table_item_price.replace('itemcode','${i_item.code}')}
    ...  AND  Common - Press a key on the keyboard      ${TO_txt_item_price}  CTRL+a+BACKSPACE
    ...  AND  Common - Input text to element  ${TO_txt_item_price}  ${i_item.price}

    ${exist}  Run Keyword And Return Status  Variable Should Exist  ${i_item.tax}
    Run keyword if  '${exist}' == 'True'  Run keyword if  '${i_item.tax}' !=''  Run keywords  Common - Click on an element  ${TO_table_item_tax.replace('itemcode','${i_item.code}')}
    ...  AND  Common - Press a key on the keyboard      ${TO_txt_item_tax}  CTRL+a+BACKSPACE
    ...  AND  Common - Input text to element  ${TO_txt_item_tax}  ${i_item.tax}

TO - Create a new TO
    [Arguments]    ${i_TO_warehouse}  ${i_list_item_code}
    [Return]     ${i_TO_code}
    TO - Navigate to create transfer-out page
    ${i_TO_code}  TO - Input a random TO code
    ${TO_name}  TO - Input a random TO name
    TO - Select a warehouse to transfer-out  ${i_TO_warehouse}
#    TO - Select the shipping address  ${i_TO_shipping_address}
    TO - Navigate to the item tab
    TO - Add items to the TO  ${i_list_item_code}
    TO - Click on Save button
    TO - Verify the TO display in grid  ${i_to_code}  ${TO_name}  ${i_TO_warehouse}  Tạo mới

TO - Navigate to update transfer-out page
    [Arguments]     ${i_TO_code}
    Common - Click on an element    ${TO_actionmenu.replace('TOcode', '${i_TO_code}')}
    Sleep  1s
    Common - Click on an element    ${TO_actionmenu_update}
    ${get_title}  Common - Get text an element     ${TO_title_page}
    should be equal    ${Update_TO_title}      ${get_title}
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    Common - Get text an element    ${TO_cbb_warehouse}

TO - Click save update button

    Common - Click on an element    ${TO_btn_save_edit}
#    ${i_TO_name}  Get value  ${TO_txt_name}
#    ${text}  Common - Get text an element  ${message_locator}
#    log  ${text}

TO - Add items to the TO
    [Arguments]     ${i_list_item_code}
    Common - Click on an element    ${TO_txt_btn_search}
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
    FOR    ${itemcode}    IN    @{i_list_item_code}
        Common - Click on an element    ${TO_cb_itemcode.replace('itemcode','${itemcode}')}
    END
    Common - Click on an element    ${TO_btn_add_selected_items}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    FOR    ${itemcode}    IN    @{i_list_item_code}
        ${code}  Run keyword and return status  Element should be visible  ${TO_table_item_code.replace('itemcode','${itemcode}')}
        IF  ${code}==True
            Common - Click on an element  ${TO_table_item_code.replace('itemcode','${itemcode}')}
            Common - Click on an element  ${TO_table_item_quantity}
            Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
            Common - Input text to element  ${TO_txt_item_quantity}  1
        ELSE
            Common - Click on an element  ${TO_table_item_quantity}
            Common - Press a key on the keyboard      ${TO_txt_item_quantity}  CTRL+a+BACKSPACE
            Common - Input text to element  ${TO_txt_item_quantity}  1
        END
    END

TO - Remove items from the TO
    [Arguments]     ${i_list_item_code}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    FOR    ${itemcode}    IN    @{i_list_item_code}
        Common - Click on an element    ${TO_button_delete_items.replace('itemcode','${itemcode}')}
    END
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]

TO - Get items code column
    ${list}  Common - Get data from a column  //*[@id="gridItem"]/div[2]/table  1
    Log   ${list}
#---------------View details----------------
TO - Navigate to the details page
    [Arguments]     ${i_TO_code}
    Common - Click on an element    ${TO_actionmenu.replace('TOcode', '${i_TO_code}')}
    Sleep  1s
    Common - Click on an element    ${TO_actionmenu_view_details}
    ${get_title}  Common - Get text an element     ${TO_title_page}
    should be equal    ${Viewde_details_TO_title}      ${get_title}
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
TO - Navigate to the details page by clicking on code
    [Arguments]     ${i_TO_code}
    Common - Click on an element    ${TO_TOcode.replace('TOcode', '${i_TO_code}')}
    ${get_title}  Common - Get text an element     ${TO_title_page}
    should be equal    ${Viewde_details_TO_title}      ${get_title}
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}
#    The below keyword verify the items tab of details page
TO - Verify the list items
    [Arguments]     ${i_list_item}  ${i_shipping_cost}  ${i_other_cost}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    ${List_items_codes}=  Create List
    ${total_tax_all_items}  Set Variable  0
    ${sub_total_tax_all_items}  Set Variable  0
    ${total_amount_all_items}  Set Variable  0
    FOR    ${item}    IN    @{i_list_item}
            append to list  ${List_items_codes}  ${item.code}
            ${Get_code}  Common - Get text an element  ${TO_details_item_code.replace('itemcode','${item.code}')}
            ${Get_name}  Common - Get text an element  ${TO_details_item_name.replace('itemcode','${item.code}')}
            ${Get_description}  Common - Get text an element  ${TO_details_item_description.replace('itemcode','${item.code}')}
            ${Get_quantity}  Common - Get text an element  ${TO_details_item_quantity.replace('itemcode','${item.code}')}
            ${Get_price}  Common - Get text an element  ${TO_details_item_price.replace('itemcode','${item.code}')}
            ${Get_price}  Remove string  ${Get_price}  ,
            ${Get_price}  Set Variable  ${Get_price.replace(' ₫','')}
            ${Get_tax_percent}  Common - Get text an element  ${TO_details_item_tax_percent.replace('itemcode','${item.code}')}
            ${Get_tax_percent}  Set Variable  ${Get_tax_percent.replace(' %','')}

            ${Get_subtotal}  Common - Get text an element  ${TO_details_item_subtotal.replace('itemcode','${item.code}')}
            ${Get_subtotal}  Remove string  ${Get_subtotal}  ,
            ${Get_subtotal}  Set Variable  ${Get_subtotal.replace(' ₫','')}
             ${Get_subtotal}  Convert to Integer  ${Get_subtotal}

            ${Get_item_tax}  Common - Get text an element  ${TO_details_item_tax.replace('itemcode','${item.code}')}
            ${Get_item_tax}  Remove string  ${Get_item_tax}  ,
            ${Get_item_tax}  Set Variable  ${Get_item_tax.replace(' ₫','')}
            ${Get_item_tax}  Convert to Integer  ${Get_item_tax}

            ${Get_item_total}  Common - Get text an element  ${TO_details_item_total.replace('itemcode','${item.code}')}
            ${Get_item_total}  Remove string  ${Get_item_total}  ,
            ${Get_item_total}  Set Variable  ${Get_item_total.replace(' ₫','')}
            ${Get_item_total}  Convert to Integer  ${Get_item_total}

            Should be equal     ${Get_code}  ${item.code}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.description}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.description}' != ''  Should be equal     ${Get_description}  ${item.description}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.quantity}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.quantity}' !=''   Should be equal     ${Get_quantity}  ${item.quantity}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.price}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.price}' !=''  Should be equal     ${Get_price}  ${item.price}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.tax}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.tax}' !=''  Should be equal     ${Get_tax_percent}  ${item.tax}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.name}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.name}' !=''  Should be equal     ${Get_name}  ${item.name}

            ${item_subtotal}=  Evaluate  ${Get_price}*${Get_quantity}
            ${item_subtotal}  Convert to Number  ${item_subtotal}  0
            ${item_subtotal}  Convert to Integer   ${item_subtotal}
            ${sub_total_tax_all_items}=  Evaluate  ${sub_total_tax_all_items}+${item_subtotal}

            ${item_tax}=  Evaluate  ${Get_price}*${Get_quantity}*${Get_tax_percent}*0.01
            ${item_tax}  Convert to Number  ${item_tax}  0
            ${item_tax}  Convert to Integer  ${item_tax}
            ${total_tax_all_items}=  Evaluate  ${total_tax_all_items}+${item_tax}

            ${item_total}=  Evaluate  ${item_subtotal}+${item_tax}
            ${item_total}  Convert to Number  ${item_total}  0
            ${item_total}  Convert to Integer  ${item_total}
            ${total_amount_all_items}=  Evaluate  ${total_amount_all_items}+${item_total}

            Should be equal     ${Get_subtotal}  ${item_subtotal}
            Should be equal     ${Get_item_tax}  ${item_tax}
            Should be equal     ${Get_item_total}  ${item_total}
    END

    ${Get_total}  Common - Get attribute an element  ${TO_details_Total}  title
    ${Get_total}  Remove string  ${Get_total}  ,
    ${Get_total}  Set Variable  ${Get_total.replace(' ₫','')}
    ${Get_total}  Convert to Integer  ${Get_total}
    Should be equal  ${sub_total_tax_all_items}  ${Get_total}

    ${total_amount_all_items}=  Evaluate  ${total_amount_all_items}+${i_shipping_cost}+${i_other_cost}
    ${Get_TotalPriceOrder}  Common - Get attribute an element  ${TO_details_TotalPriceOrder}  title
    ${Get_TotalPriceOrder}  Remove string  ${Get_TotalPriceOrder}  ,
    ${Get_TotalPriceOrder}  Set Variable  ${Get_TotalPriceOrder.replace(' ₫','')}
    ${Get_TotalPriceOrder}  Convert to Integer  ${Get_TotalPriceOrder}
    Should be equal  ${Get_TotalPriceOrder}  ${total_amount_all_items}

    ${Get_TotalTax}  Common - Get attribute an element  ${TO_details_TotalTax}  title
    ${Get_TotalTax}  Remove string  ${Get_TotalTax}  ,
    ${Get_TotalTax}  Set Variable  ${Get_TotalTax.replace(' ₫','')}
    ${Get_TotalTax}  Convert to Integer  ${Get_TotalTax}
    Should be equal  ${total_tax_all_items}  ${Get_TotalTax}


    ${Get_TotalTax_percent}  Common - Get attribute an element  ${TO_details_TotalTax_percent}  title
    ${Get_TotalTax_percent}  Set Variable  ${Get_TotalTax_percent.replace(' %','')}
    ${Get_TotalTax_percent}  Convert to Number  ${Get_TotalTax_percent}  2
    ${total_tax_percent}=  Evaluate  (${total_tax_all_items}/${sub_total_tax_all_items})*100
    ${total_tax_percent}  Convert to Number  ${total_tax_percent}  2
    Should be equal  ${total_tax_percent}  ${Get_TotalTax_percent}
    ${list_from_element}  Common - Get data from a column  //*[@id="gridItem"]/div[2]/table  1
    Lists should be equal  ${List_items_codes}  ${list_from_element}  ignore_order=True

TO - Add items to the TO and input description, quantity, price, tax
    [Arguments]     ${i_list_item}
    Common - Click on an element    ${TO_txt_btn_search}
    Common - Wait until the loading icon loads successfully    ${loader_icon_locator}

    FOR    ${item}    IN    @{i_list_item}
        Common - Click on an element    ${TO_cb_itemcode.replace('itemcode','${item.code}')}
    END

    Common - Click on an element    ${TO_btn_add_selected_items}

    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    FOR    ${item}    IN    @{i_list_item}
        TO - Input Description, Quantity, Price, Tax of an item     ${item}
    END
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]

TO - Create a New TO has full details
    [Return]     ${i_info.data_to_code}
    [Arguments]   ${i_info}  ${i_list_item}

    TO - Navigate to create transfer-out page
    ${exist}  Run Keyword And Return Status  Variable Should Exist  ${i_info.data_to_code}
    Run keyword if  '${exist}' == 'True'  Run keyword if  '${i_info.data_to_code}' != ''  TO - Input TO code  ${i_info.data_to_code}
    IF  '${exist}' == 'True'
           IF  '${i_info.data_to_code}' == ''
                ${i_info.data_to_code}  TO - Input a random TO code
           END
    END
    IF  '${exist}' == 'False'
        ${i_info.data_to_code}  TO - Input a random TO code
    END
    TO - Select a warehouse to transfer-out  ${i_info.data_warehouse}
    TO - Select a TO type  ${i_info.data_to_type}
    TO - Input TO name  ${i_info.data_to_name}
    TO - Select the shipping address and edit address details  ${i_info.data_shipping_address}  ${i_info.data_shipping_address_details}  ${i_info.data_shipping_address_phone}
    TO - Input required date  ${i_info.data_date_require}
    TO - Input transfer-out date  ${i_info.data_date_transfer}
    TO - Select the approver  ${i_info.data_approver}
    TO - Input TO note  ${i_info.data_note}
    TO - Input shipping cost  ${i_info.data_shippingcost}
    TO - Input other cost  ${i_info.data_shippingcost}
    TO - Navigate to the item tab
    TO - Add items to the TO and input description, quantity, price, tax  ${i_list_item}
    TO - Click on Save button
    TO - Verify the TO display in grid  ${i_info.data_to_code}  ${i_info.data_to_name}  ${i_info.data_warehouse}  ${i_info.data_to_status_in_grid}
TO - Verify the the general details
    [Arguments]     ${i_details}
    ${get_code}  Common - Get text an element  ${TO_details_code}
    ${get_name}  Common - Get text an element  ${TO_details_name}
    ${get_type}  Common - Get text an element  ${TO_details_type}
    ${get_warhouse}  Common - Get text an element  ${TO_details_warhouse}
    ${get_warhouse_address}  Common - Get text an element  ${TO_details_warhouse_address}
    ${get_created_day}  Common - Get text an element  ${TO_details_created_day}
    ${get_shipping_address}  Common - Get attribute an element  ${TO_details_shipping_address}  value
    ${get_shipping_address_info}  Common - Get attribute an element  ${TO_details_shipping_address_info}  value
    ${get_shipping_address_phone}  Common - Get attribute an element  ${TO_details_shipping_address_phone}  value
    ${today}=    Get Current Date    result_format=%d-%m-%Y

    ${get_export_day}  Common - Get text an element  ${TO_details_export_day}
    ${get_required_day}  Common - Get text an element  ${TO_details_required_day}
    ${get_approver}  Common - Get text an element  ${TO_details_approver}
    ${get_note}  Common - Get text an element  ${TO_details_note}
    ${get_shipping_cost}  Common - Get attribute an element  ${TO_details_shipping_cost}  title
    ${get_shipping_cost}  Set Variable  ${get_shipping_cost.replace(' ₫','')}
    ${get_shipping_cost}  Set Variable  ${get_shipping_cost.replace(',','')}
    ${get_other_cost}  Common - Get attribute an element  ${TO_details_other_cost}  title
    ${get_other_cost}  Set Variable  ${get_other_cost.replace(' ₫','')}
    ${get_other_cost}  Set Variable  ${get_other_cost.replace(',','')}

    Should be equal  ${get_code}  ${i_details.data_to_code}
    Should be equal  ${get_name}  ${i_details.data_to_name}
    Should be equal  ${get_type}  ${i_details.data_to_type}
    Should be equal  ${get_created_day}  ${today}
    Should be equal  ${get_warhouse}  ${i_details.data_warehouse}
    Should be equal  ${get_warhouse_address}  ${i_details.data_warehouse_address}
    Should be equal  ${get_shipping_address}  ${i_details.data_shipping_address}
    Should be equal  ${get_shipping_address_info}  ${i_details.data_shipping_address_details}
    Should be equal  ${get_shipping_address_phone}  ${i_details.data_shipping_address_phone}
    Should be equal  ${get_export_day}  ${i_details.data_date_transfer}
    Should be equal  ${get_required_day}  ${i_details.data_date_require}
    Should be equal  ${get_approver}  ${i_details.data_approver}
    Should be equal  ${get_note}  ${i_details.data_note}
    Should be equal  ${get_shipping_cost}  ${i_details.data_shippingcost}
    Should be equal  ${get_other_cost}  ${i_details.data_othercost}

TO - Verify the the general details in the preview
    [Arguments]     ${i_details}
    ${get_code}  Common - Get text an element  ${TO_preview_code}
    ${get_user_create}  Common - Get text an element  ${TO_preview_user_create}
    ${get_export_day}  Common - Get text an element  ${TO_preview_export_day}
    ${get_warhouse}  Common - Get text an element  ${TO_preview_warhouse}
    ${get_taxcode}  Common - Get text an element  ${TO_preview_tax_code}
    ${get_warhouse_address}  Common - Get text an element  ${TO_preview_warhouse_address}
    ${get_shipping_address}  Common - Get text an element  ${TO_preview_shipping_address}
    ${get_contact}  Common - Get text an element  ${TO_preview_contact}
    ${get_shipping_address_phone}  Common - Get text an element  ${TO_preview_shipping_address_phone}
    ${get_shipping_address_email}  Common - Get text an element  ${TO_preview_shipping_address_email}
    ${get_shipping_address_info}  Common - Get text an element  ${TO_preview_shipping_address_details}
    ${today}=    Get Current Date    result_format=%d-%m-%Y


    ${get_shipping_cost}  Common - Get text an element  ${TO_preview_shipping_cost}
    ${get_shipping_cost}  Set Variable  ${get_shipping_cost.replace(' ₫','')}
    ${get_shipping_cost}  Set Variable  ${get_shipping_cost.replace(',','')}
    ${get_other_cost}  Common - Get text an element  ${TO_preview_other_cost}
    ${get_other_cost}  Set Variable  ${get_other_cost.replace(' ₫','')}
    ${get_other_cost}  Set Variable  ${get_other_cost.replace(',','')}

    Should be equal  ${get_code}  ${i_details.data_to_code}
    Should be equal  ${get_user_create}  ${i_details.data_user_create}
    Should be equal  ${get_export_day}  ${i_details.data_date_transfer}
    Should be equal  ${get_warhouse}  ${i_details.data_warehouse}
    Should be equal  ${get_taxcode}  ${i_details.data_tax_code}
    Should be equal  ${get_warhouse_address}  ${i_details.data_warehouse_address}
    Should be equal  ${get_shipping_address}  ${i_details.data_shipping_address}
    Should be equal  ${get_contact}  ${i_details.data_contact}
    Should be equal  ${get_shipping_address_phone}  ${i_details.data_shipping_address_phone}
    Should be equal  ${get_shipping_address_email}  ${i_details.data_shipping_address_email}
    Should be equal  ${get_shipping_address_info}  ${i_details.data_shipping_address_details}
#    Should be equal  ${get_note}  ${i_details.data_note}
    Should be equal  ${get_shipping_cost}  ${i_details.data_shippingcost}
    Should be equal  ${get_other_cost}  ${i_details.data_othercost}

TO - Open the preview of TO
    [Arguments]     ${i_TO_code}
    Common - Click on an element  ${TO_actionmenu.replace('TOcode','${i_TO_code}')}
    Sleep   1s
    Common - Click on an element  ${TO_actionmenu_preview}
    ${text}  Common - Get text an element  ${TO_popup_preview_title}
    Should be equal     ${text}  ${popup_preview_title}

TO - Verify the the items list in the preview
    [Arguments]  ${i_items_list}  ${i_shipping_cost}  ${i_other_cost}

        ${total_all_items}  Set Variable  0
        ${total_tax}  Set Variable  0
        ${total_to}  Set Variable  0
        FOR    ${item}    IN    @{i_items_list}
            ${get_item_code}  Common - Get text an element  ${TO_preview_item_code.replace('itemcode','${item.code}')}
            ${get_item_name}  Common - Get text an element  ${TO_preview_item_name.replace('itemcode','${item.code}')}
            ${get_item_quantity}  Common - Get text an element  ${TO_preview_item_quantity.replace('itemcode','${item.code}')}

            ${get_item_price}  Common - Get text an element  ${TO_preview_item_price.replace('itemcode','${item.code}')}
            ${get_item_price}  Set Variable  ${get_item_price.replace(' ₫','')}
            ${get_item_price}  Set Variable  ${get_item_price.replace(',','')}

            ${get_item_tax_percent}  Common - Get text an element  ${TO_preview_item_tax_percent.replace('itemcode','${item.code}')}
            ${get_item_tax_percent}  Set Variable  ${get_item_tax_percent.replace('%','')}

            ${get_item_total}  Common - Get text an element  ${TO_preview_item_total.replace('itemcode','${item.code}')}
            ${get_item_total}  Set Variable  ${get_item_total.replace(' ₫','')}
            ${get_item_total}  Set Variable  ${get_item_total.replace(',','')}

#            The ${item_total} is calculate by values from yaml file
            ${item_total} =    Evaluate   ${item.quantity} * (${item.price}+(${item.price}*${item.tax}*0.01))
            ${item_total}  Convert to string   ${item_total}
            ${item_total}  Fetch From Left   ${item_total}  .
            log  ${item_total}

            ${total_all_items} =  Evaluate    ${total_all_items}+(${item.price}*${item.quantity})
            ${total_tax}=  Evaluate   ${total_tax}+(${item.price}*${item.quantity}*${item.tax}*0.01)
            ${total_to}=  Evaluate  ${total_to}+${item_total}

            Should be equal  ${get_item_code}  ${item.code}
            Should be equal  ${get_item_name}  ${item.name}
            Should be equal  ${get_item_quantity}  ${item.quantity}
            Should be equal  ${get_item_price}  ${item.price}
            Should be equal  ${get_item_tax_percent}  ${item.tax}
            Should be equal  ${get_item_total}  ${item_total}
        END
        ${total_all_items}  Convert to string   ${total_all_items}
        ${total_all_items}  Fetch From Left   ${total_all_items}  .
        log  ${total_all_items}

        ${get_total_all_items}  Common - Get text an element  ${TO_preview_total_all_items}
        ${get_total_all_items}  Set Variable  ${get_total_all_items.replace(' ₫','')}
        ${get_total_all_items}  Set Variable  ${get_total_all_items.replace(',','')}
        Should be equal  ${get_total_all_items}  ${total_all_items}

        ${total_tax}  Convert to string   ${total_tax}
        ${total_tax}  Fetch From Left   ${total_tax}  .
        log  ${total_tax}
        ${get_total_tax}  Common - Get text an element  ${TO_preview_total_tax}
        ${get_total_tax}  Set Variable  ${get_total_tax.replace(' ₫','')}
        ${get_total_tax}  Set Variable  ${get_total_tax.replace(',','')}
        Should be equal  ${get_total_tax}  ${total_tax}

        ${total_to}=  Evaluate  ${total_to}+${i_shipping_cost}+${i_other_cost}
        ${total_to}  Convert to string   ${total_to}
        ${total_to}  Fetch From Left   ${total_to}  .
        log  ${total_to}
        ${get_total_TO}  Common - Get text an element  ${TO_preview_total_TO}
        ${get_total_TO}  Set Variable  ${get_total_TO.replace(' ₫','')}
        ${get_total_TO}  Set Variable  ${get_total_TO.replace(',','')}
        Should be equal  ${get_total_TO}  ${total_to}

TO - Close the preview pop-up
    Common - Click on an element  ${TO_popup_preview_close}
    Wait until element is not visible  ${TO_popup_preview_title}

TO - Navigate to transfer-out page
    [Arguments]     ${i_TO_code}
    Common - Click on an element  ${TO_actionmenu.replace('TOcode','${i_TO_code}')}
    Sleep   1s
    Common - Click on an element  ${TO_actionmenu_export}
    ${text}  Common - Get text an element  ${TO_transfer_title}
    Should be equal  ${text}  ${Transfer_out_title}
    Wait until element is visible  ${TO_btn_transfer_item_row}
TO - Click on transfer-out fully button
    Common - Click on an element  ${TO_btn_transfer_fully}
    ${text}  Common - Get text an element  ${message_locator}
    Should be equal    ${text}  Xuất kho thành công
TO - Verify the transfered-out TO is display in history
#-----if this TO was transfered fully, it will not display in the index
TO - Verify TO does not display in the index page
    [Arguments]     ${i_TOcode}
    Common - Wait until the loading icon loads successfully  ${loader_icon_locator}
#    wait until page contains element  ${TO_row}
    Wait Until Page Does Not Contain Element    ${TO_TOcode.replace('TOcode','${i_TOcode}')}
    Common - Input text to element  ${TO_txt_search_TO}  ${i_TOcode}
    ${status}  Run Keyword And Return Status   Wait Until Element Is Visible   ${TO_TOcode.replace('TOcode','${i_TOcode}')}  3s
    Should be equal  ${status}  ${FALSE}
TO - Input quantity to transfer-out an item
    [Arguments]     ${i_item_code}  ${i_quantity_received}
    Common - Click on an element    ${TO_table_item_code.replace('itemcode','${i_item_code}')}
    Common - Double click on an element  ${TO_txt_item_quantity_received}
    Common - Press a key on the keyboard      ${TO_txt_item_quantity_received}  CTRL+a+BACKSPACE
    Common - Input text to element  ${TO_txt_item_quantity_received}  ${i_quantity_received}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]

TO - Input quantity to transfer-out several items
    [Arguments]     ${i_item_list}
    FOR    ${item}  IN  @{i_item_list}
        TO - Input quantity to transfer-out an item  ${item.code}  ${item.quantity_received}
    END

TO - Transfer-out partially and complete
    Common - Click on an element  ${TO_btn_transfer_out}
    Common - Click on an element  ${TO_rd_btn_transfer_partially_complete}
    Common - Click on an element  ${TO_btn_transfer_partially}
    ${text}  Common - Get text an element        ${message_locator}
    Should be equal  ${text}  Xuất kho thành công

TO - Transfer-out partially and create new TO
    Common - Click on an element  ${TO_btn_transfer_out}
    Common - Click on an element  ${TO_rd_btn_transfer_partially_create_new_TO}
    Common - Click on an element  ${TO_btn_transfer_partially}
    ${text}  Common - Get text an element        ${message_locator}
    Should be equal  ${text}  Xuất kho thành công

TO - Transfer-out partially
    Common - Click on an element  ${TO_transfer_out_quanity_transfer_out_column}
    Common - Click on an element  ${TO_btn_transfer_out}
    Common - Click on an element  ${TO_rd_btn_transfer_partially}
    Common - Click on an element  ${TO_btn_transfer_partially}
    ${text}  Common - Get text an element        ${message_locator}
    Should be equal  ${text}  Xuất kho thành công

TO - Verify the TO received display in the history
    [Arguments]   ${i_TO_code}  ${i_TO_name}  ${i_TO_warehouse}  ${get_shipping_address}
    Common - Wait until the loading icon loads successfully  ${TO_TOcode.replace('TOcode','${i_TO_code}')}
    ${Get_name}  Common - Get text an element    ${TO_TOcode_TOname.replace('TOcode','${i_TO_code}')}
    ${get_warehouse}  Common - Get text an element    ${TO_TOcode_warehouse.replace('TOcode','${i_TO_code}')}
    ${get_shipping_address}  Common - Get text an element    ${TO_row_history_shipping_address.replace('TOcode','${i_TO_code}')}
    ${get_transfer_out_day}  Common - Get text an element    ${TO_row_history_transfer_out_day.replace('TOcode','${i_TO_code}')}

    Should be equal  ${Get_name}  ${i_TO_name}
    Should be equal  ${get_warehouse}  ${i_TO_warehouse}
    Should be equal  ${get_shipping_address}  ${get_shipping_address}
    ${today}=    Get Current Date    result_format=%d-%m-%Y
    Should be equal  ${get_transfer_out_day}  ${today}

    Common - Search data  ${i_TO_code}
    Common - Wait until the loading icon loads successfully  ${TO_TOcode.replace('TOcode','${i_TO_code}')}

TO - Verify the list items after transfering_out partially
    [Arguments]     ${i_list_item}  ${i_shipping_cost}  ${i_other_cost}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    ${List_items_codes}=  Create List
    ${total_tax_all_items}  Set Variable  0
    ${sub_total_tax_all_items}  Set Variable  0
    ${total_amount_transfered}  Set Variable  0
    FOR    ${item}    IN    @{i_list_item}
            append to list  ${List_items_codes}  ${item.code}
            ${Get_code}  Common - Get text an element  ${TO_transfer_out_item_code.replace('itemcode','${item.code}')}

            ${Get_quantity}  Common - Get text an element  ${TO_transfer_out_item_quantity.replace('itemcode','${item.code}')}

            ${Get_quantity_transfered_out}  Common - Get text an element  ${TO_transfer_out_item_quantity_transfered_out.replace('itemcode','${item.code}')}
            ${Get_quantity_transfer_out}  Common - Get text an element  ${TO_transfer_out_item_quantity_transfer_out.replace('itemcode','${item.code}')}

            ${Get_price}  Common - Get text an element  ${TO_transfer_out_item_price.replace('itemcode','${item.code}')}
            ${Get_price}  Remove string  ${Get_price}  ,
            ${Get_price}  Set Variable  ${Get_price.replace(' ₫','')}

            ${Get_tax_percent}  Common - Get text an element  ${TO_transfer_out_item_tax_percent.replace('itemcode','${item.code}')}
            ${Get_tax_percent}  Set Variable  ${Get_tax_percent.replace(' %','')}

            ${Get_subtotal}  Common - Get text an element  ${TO_transfer_out_item_subtotal.replace('itemcode','${item.code}')}
            ${Get_subtotal}  Remove string  ${Get_subtotal}  ,
            ${Get_subtotal}  Set Variable  ${Get_subtotal.replace(' ₫','')}
            ${Get_subtotal}  Convert to Integer  ${Get_subtotal}

            ${Get_item_tax}  Common - Get text an element  ${TO_transfer_out_item_tax.replace('itemcode','${item.code}')}
            ${Get_item_tax}  Remove string  ${Get_item_tax}  ,
            ${Get_item_tax}  Set Variable  ${Get_item_tax.replace(' ₫','')}
            ${Get_item_tax}  Convert to Integer  ${Get_item_tax}

#            The item total display in grid must be 0
            ${Get_item_total}  Common - Get text an element  ${TO_transfer_out_item_total.replace('itemcode','${item.code}')}
            ${Get_item_total}  Remove string  ${Get_item_total}  ,
            ${Get_item_total}  Set Variable  ${Get_item_total.replace(' ₫','')}
            ${Get_item_total}  Convert to Integer  ${Get_item_total}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.price}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.price}' !=''  Should be equal     ${Get_price}  ${item.price}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.tax}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.tax}' !=''  Should be equal     ${Get_tax_percent}  ${item.tax}

            ${item_subtotal}=  Evaluate  ${Get_price}*${Get_quantity_transfered_out}
            ${item_subtotal}  Convert to Number  ${item_subtotal}  0
            ${item_subtotal}  Convert to Integer   ${item_subtotal}

            ${item_tax}=  Evaluate  ${Get_price}*${Get_quantity_transfered_out}*${Get_tax_percent}*0.01
            ${item_tax}  Convert to Number  ${item_tax}  0
            ${item_tax}  Convert to Integer  ${item_tax}

            ${item_total}=  Evaluate  ${item_subtotal}+${item_tax}
            ${item_total}  Convert to Number  ${item_total}  0
            ${item_total}  Convert to Integer  ${item_total}

            ${total_amount_transfered}=  Evaluate  ${total_amount_transfered}+${item_total}

            Should be equal     ${Get_code}  ${item.code}
            Should be equal     ${Get_quantity}  ${item.quantity}
            Should be equal     ${Get_quantity_transfered_out}  ${item.quantity_received}
            Should be equal     ${Get_quantity_transfer_out}  0.00

            Should be true     ${Get_subtotal}==0
            Should be true     ${Get_item_tax}==0
            Should be true     ${Get_item_total}==0
    END
    ${Get_total_transfer_out}  Common - Get attribute an element  ${TO_transfer_out_item_total_transfer_out}  value
    ${Get_total_transfer_out}  Remove string  ${Get_total_transfer_out}  ,
    ${Get_total_transfer_out}  Set Variable  ${Get_total_transfer_out.replace(' ₫','')}
    ${Get_total_transfer_out}  Convert to Integer  ${Get_total_transfer_out}

    ${Get_total_transfered_out}  Common - Get attribute an element  ${TO_transfer_out_item_total_transfered_out}  value
    ${Get_total_transfered_out}  Remove string  ${Get_total_transfered_out}  ,
    ${Get_total_transfered_out}  Set Variable  ${Get_total_transfered_out.replace(' ₫','')}
    ${Get_total_transfered_out}  Convert to Integer  ${Get_total_transfered_out}

#    The total in page must be equal to the calulated value
    Should be equal  ${Get_total_transfered_out}   ${total_amount_transfered}
    Should be true  ${Get_total_transfer_out}==0

#Get list items in the grid and compare it to the list item in yaml file
    ${list_from_element}  Common - Get data from a column  //*[@id="gridItem"]/div[2]/table  1
    Lists should be equal  ${List_items_codes}  ${list_from_element}  ignore_order=True
#--------------------------------------------------------------------------------------------------

TO - Input quantity to transfer-out a serial item
    [Arguments]     ${i_item_code}  ${i_quantity_received}
    Common - Click on an element    ${TO_table_item_code.replace('itemcode','${i_item_code}')}
    Common - Click on an element  ${TO_transfer_out_serial_item_quantity_transfer_out}

    ${i_quantity_received}  Fetch From Left  ${i_quantity_received}  .
    ${i_quantity_received}  Convert to Integer  ${i_quantity_received}
    log  ${i_quantity_received}
    Sleep  2s
    FOR    ${i}    IN RANGE  1  ${i_quantity_received}+1
            log  ${i}
           Common - Click on an element  ${TO_transfer_out_cb_serial.replace('number','${i}')}
    END
    Common - Click on an element  ${TO_transfer_out_select_serial}
    Common - Click on an element  ${TO_transfer_out_quanity_transfer_out_column}

TO - Input quantity to transfer-out several serial items
    [Arguments]     ${i_item_list}
    FOR    ${item}  IN  @{i_item_list}
        TO - Input quantity to transfer-out a serial item  ${item.code}  ${item.quantity_received}
    END

TO - Input quantity to transfer-out several serial items in the second time
    [Arguments]     ${i_item_list}
    FOR    ${item}  IN  @{i_item_list}
        TO - Input quantity to transfer-out a serial item  ${item.code}  ${item.quantity_received_2}
    END

TO - Verify TO details after transfering_out partially
    [Arguments]    ${i_details}   ${i_list_item}
    TO - Verify the the general details  ${i_details}
    TO - Navigate to the item tab
    TO - Verify the list items  ${i_list_item}  ${i_details.data_shippingcost}  ${i_details.data_othercost}
    FOR    ${item}    IN    @{i_list_item}
            ${Get_quantity_transfered_out}  Common - Get text an element  ${TO_transfer_out_item_quantity_transfered_out.replace('itemcode','${item.code}')}
            Should be equal  ${item.quantity_received}  ${Get_quantity_transfered_out}
    END
TO - Verify TO details in history page
    [Arguments]    ${i_details}   ${i_list_item}
    TO - Verify the the general details  ${i_details}
    TO - Navigate to the item tab
    TO - Verify the list items in history page  ${i_list_item}  ${i_details.data_shippingcost}  ${i_details.data_othercost}
    FOR    ${item}    IN    @{i_list_item}
            ${Get_quantity_transfered_out}  Common - Get text an element  ${TO_transfer_out_item_quantity_transfered_out.replace('itemcode','${item.code}')}
            Should be equal  ${item.quantity_received}  ${Get_quantity_transfered_out}
    END

TO - Verify TO details in history page after transfering several times
    [Arguments]    ${i_details}   ${i_list_item}
    TO - Verify the the general details  ${i_details}
    TO - Navigate to the item tab
    TO - Verify the list items in history page after transfering several times  ${i_list_item}  ${i_details.data_shippingcost}  ${i_details.data_othercost}
TO - Verify the list items in history page
    [Arguments]     ${i_list_item}  ${i_shipping_cost}  ${i_other_cost}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    ${List_items_codes}=  Create List
    ${total_tax_all_items}  Set Variable  0
    ${sub_total_tax_all_items}  Set Variable  0
    ${total_amount_all_items}  Set Variable  0
    FOR    ${item}    IN    @{i_list_item}
            append to list  ${List_items_codes}  ${item.code}
            ${Get_code}  Common - Get text an element  ${TO_details_item_code.replace('itemcode','${item.code}')}
            ${Get_name}  Common - Get text an element  ${TO_details_item_name.replace('itemcode','${item.code}')}
            ${Get_description}  Common - Get text an element  ${TO_details_item_description.replace('itemcode','${item.code}')}
            ${Get_quantity}  Common - Get text an element  ${TO_details_item_quantity.replace('itemcode','${item.code}')}
            ${Get_price}  Common - Get text an element  ${TO_details_item_price.replace('itemcode','${item.code}')}
            ${Get_price}  Remove string  ${Get_price}  ,
            ${Get_price}  Set Variable  ${Get_price.replace(' ₫','')}
            ${Get_tax_percent}  Common - Get text an element  ${TO_details_item_tax_percent.replace('itemcode','${item.code}')}
            ${Get_tax_percent}  Set Variable  ${Get_tax_percent.replace(' %','')}

            ${Get_subtotal}  Common - Get text an element  ${TO_details_item_subtotal.replace('itemcode','${item.code}')}
            ${Get_subtotal}  Remove string  ${Get_subtotal}  ,
            ${Get_subtotal}  Set Variable  ${Get_subtotal.replace(' ₫','')}
             ${Get_subtotal}  Convert to Integer  ${Get_subtotal}

            ${Get_item_tax}  Common - Get text an element  ${TO_details_item_tax.replace('itemcode','${item.code}')}
            ${Get_item_tax}  Remove string  ${Get_item_tax}  ,
            ${Get_item_tax}  Set Variable  ${Get_item_tax.replace(' ₫','')}
            ${Get_item_tax}  Convert to Integer  ${Get_item_tax}

            ${Get_item_total}  Common - Get text an element  ${TO_details_item_total.replace('itemcode','${item.code}')}
            ${Get_item_total}  Remove string  ${Get_item_total}  ,
            ${Get_item_total}  Set Variable  ${Get_item_total.replace(' ₫','')}
            ${Get_item_total}  Convert to Integer  ${Get_item_total}

            Should be equal     ${Get_code}  ${item.code}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.description}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.description}' != ''  Should be equal     ${Get_description}  ${item.description}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.quantity}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.quantity_received}' !=''   Should be equal     ${Get_quantity}  ${item.quantity_received}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.price}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.price}' !=''  Should be equal     ${Get_price}  ${item.price}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.tax}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.tax}' !=''  Should be equal     ${Get_tax_percent}  ${item.tax}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.name}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.name}' !=''  Should be equal     ${Get_name}  ${item.name}

            ${item_subtotal}=  Evaluate  ${Get_price}*${Get_quantity}
            ${item_subtotal}  Convert to Number  ${item_subtotal}  0
            ${item_subtotal}  Convert to Integer   ${item_subtotal}
            ${sub_total_tax_all_items}=  Evaluate  ${sub_total_tax_all_items}+${item_subtotal}

            ${item_tax}=  Evaluate  ${Get_price}*${Get_quantity}*${Get_tax_percent}*0.01
            ${item_tax}  Convert to Number  ${item_tax}  0
            ${item_tax}  Convert to Integer  ${item_tax}
            ${total_tax_all_items}=  Evaluate  ${total_tax_all_items}+${item_tax}

            ${item_total}=  Evaluate  ${item_subtotal}+${item_tax}
            ${item_total}  Convert to Number  ${item_total}  0
            ${item_total}  Convert to Integer  ${item_total}
            ${total_amount_all_items}=  Evaluate  ${total_amount_all_items}+${item_total}

            Should be equal     ${Get_subtotal}  ${item_subtotal}
            Should be equal     ${Get_item_tax}  ${item_tax}
            Should be equal     ${Get_item_total}  ${item_total}
    END

    ${Get_total}  Common - Get attribute an element  ${TO_details_Total}  title
    ${Get_total}  Remove string  ${Get_total}  ,
    ${Get_total}  Set Variable  ${Get_total.replace(' ₫','')}
    ${Get_total}  Convert to Integer  ${Get_total}
    Should be equal  ${sub_total_tax_all_items}  ${Get_total}

    ${total_amount_all_items}=  Evaluate  ${total_amount_all_items}+${i_shipping_cost}+${i_other_cost}
    ${Get_TotalPriceOrder}  Common - Get attribute an element  ${TO_details_TotalPriceOrder}  title
    ${Get_TotalPriceOrder}  Remove string  ${Get_TotalPriceOrder}  ,
    ${Get_TotalPriceOrder}  Set Variable  ${Get_TotalPriceOrder.replace(' ₫','')}
    ${Get_TotalPriceOrder}  Convert to Integer  ${Get_TotalPriceOrder}
    Should be equal  ${Get_TotalPriceOrder}  ${total_amount_all_items}

    ${Get_TotalTax}  Common - Get attribute an element  ${TO_details_TotalTax}  title
    ${Get_TotalTax}  Remove string  ${Get_TotalTax}  ,
    ${Get_TotalTax}  Set Variable  ${Get_TotalTax.replace(' ₫','')}
    ${Get_TotalTax}  Convert to Integer  ${Get_TotalTax}
    Should be equal  ${total_tax_all_items}  ${Get_TotalTax}


    ${Get_TotalTax_percent}  Common - Get attribute an element  ${TO_details_TotalTax_percent}  title
    ${Get_TotalTax_percent}  Set Variable  ${Get_TotalTax_percent.replace(' %','')}
    ${Get_TotalTax_percent}  Convert to Number  ${Get_TotalTax_percent}  2
    ${total_tax_percent}=  Evaluate  (${total_tax_all_items}/${sub_total_tax_all_items})*100
    ${total_tax_percent}  Convert to Number  ${total_tax_percent}  2
    Should be equal  ${total_tax_percent}  ${Get_TotalTax_percent}
    ${list_from_element}  Common - Get data from a column  //*[@id="gridItem"]/div[2]/table  1
    Lists should be equal  ${List_items_codes}  ${list_from_element}  ignore_order=True


TO - Verify the list items in history page after transfering several times
    [Arguments]     ${i_list_item}  ${i_shipping_cost}  ${i_other_cost}
    Common - Click on an element  (//div[@class="k-grid-content k-auto-scrollable"])[1]
    ${List_items_codes}=  Create List
    ${total_tax_all_items}  Set Variable  0
    ${sub_total_tax_all_items}  Set Variable  0
    ${total_amount_all_items}  Set Variable  0
    FOR    ${item}    IN    @{i_list_item}
            append to list  ${List_items_codes}  ${item.code}
            ${Get_code}  Common - Get text an element  ${TO_details_item_code.replace('itemcode','${item.code}')}
            ${Get_name}  Common - Get text an element  ${TO_details_item_name.replace('itemcode','${item.code}')}
            ${Get_description}  Common - Get text an element  ${TO_details_item_description.replace('itemcode','${item.code}')}
            ${Get_quantity}  Common - Get text an element  ${TO_details_item_quantity.replace('itemcode','${item.code}')}
            ${Get_price}  Common - Get text an element  ${TO_details_item_price.replace('itemcode','${item.code}')}
            ${Get_price}  Remove string  ${Get_price}  ,
            ${Get_price}  Set Variable  ${Get_price.replace(' ₫','')}
            ${Get_tax_percent}  Common - Get text an element  ${TO_details_item_tax_percent.replace('itemcode','${item.code}')}
            ${Get_tax_percent}  Set Variable  ${Get_tax_percent.replace(' %','')}

            ${Get_subtotal}  Common - Get text an element  ${TO_details_item_subtotal.replace('itemcode','${item.code}')}
            ${Get_subtotal}  Remove string  ${Get_subtotal}  ,
            ${Get_subtotal}  Set Variable  ${Get_subtotal.replace(' ₫','')}
             ${Get_subtotal}  Convert to Integer  ${Get_subtotal}

            ${Get_item_tax}  Common - Get text an element  ${TO_details_item_tax.replace('itemcode','${item.code}')}
            ${Get_item_tax}  Remove string  ${Get_item_tax}  ,
            ${Get_item_tax}  Set Variable  ${Get_item_tax.replace(' ₫','')}
            ${Get_item_tax}  Convert to Integer  ${Get_item_tax}

            ${Get_item_total}  Common - Get text an element  ${TO_details_item_total.replace('itemcode','${item.code}')}
            ${Get_item_total}  Remove string  ${Get_item_total}  ,
            ${Get_item_total}  Set Variable  ${Get_item_total.replace(' ₫','')}
            ${Get_item_total}  Convert to Integer  ${Get_item_total}

            Should be equal     ${Get_code}  ${item.code}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.description}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.description}' != ''  Should be equal     ${Get_description}  ${item.description}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.quantity}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.quantity_received_sum}' !=''   Should be equal     ${Get_quantity}  ${item.quantity_received_sum}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.price}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.price}' !=''  Should be equal     ${Get_price}  ${item.price}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.tax}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.tax}' !=''  Should be equal     ${Get_tax_percent}  ${item.tax}

            ${exist}  Run Keyword And Return Status  Variable Should Exist  ${item.name}
            Run keyword if  '${exist}' == 'True'  Run keyword if  '${item.name}' !=''  Should be equal     ${Get_name}  ${item.name}

            ${item_subtotal}=  Evaluate  ${Get_price}*${Get_quantity}
            ${item_subtotal}  Convert to Number  ${item_subtotal}  0
            ${item_subtotal}  Convert to Integer   ${item_subtotal}
            ${sub_total_tax_all_items}=  Evaluate  ${sub_total_tax_all_items}+${item_subtotal}

            ${item_tax}=  Evaluate  ${Get_price}*${Get_quantity}*${Get_tax_percent}*0.01
            ${item_tax}  Convert to Number  ${item_tax}  0
            ${item_tax}  Convert to Integer  ${item_tax}
            ${total_tax_all_items}=  Evaluate  ${total_tax_all_items}+${item_tax}

            ${item_total}=  Evaluate  ${item_subtotal}+${item_tax}
            ${item_total}  Convert to Number  ${item_total}  0
            ${item_total}  Convert to Integer  ${item_total}
            ${total_amount_all_items}=  Evaluate  ${total_amount_all_items}+${item_total}

            Should be equal     ${Get_subtotal}  ${item_subtotal}
            Should be equal     ${Get_item_tax}  ${item_tax}
            Should be equal     ${Get_item_total}  ${item_total}
    END

    ${Get_total}  Common - Get attribute an element  ${TO_details_Total}  title
    ${Get_total}  Remove string  ${Get_total}  ,
    ${Get_total}  Set Variable  ${Get_total.replace(' ₫','')}
    ${Get_total}  Convert to Integer  ${Get_total}
    Should be equal  ${sub_total_tax_all_items}  ${Get_total}

    ${total_amount_all_items}=  Evaluate  ${total_amount_all_items}+${i_shipping_cost}+${i_other_cost}
    ${Get_TotalPriceOrder}  Common - Get attribute an element  ${TO_details_TotalPriceOrder}  title
    ${Get_TotalPriceOrder}  Remove string  ${Get_TotalPriceOrder}  ,
    ${Get_TotalPriceOrder}  Set Variable  ${Get_TotalPriceOrder.replace(' ₫','')}
    ${Get_TotalPriceOrder}  Convert to Integer  ${Get_TotalPriceOrder}
    Should be equal  ${Get_TotalPriceOrder}  ${total_amount_all_items}

    ${Get_TotalTax}  Common - Get attribute an element  ${TO_details_TotalTax}  title
    ${Get_TotalTax}  Remove string  ${Get_TotalTax}  ,
    ${Get_TotalTax}  Set Variable  ${Get_TotalTax.replace(' ₫','')}
    ${Get_TotalTax}  Convert to Integer  ${Get_TotalTax}
    Should be equal  ${total_tax_all_items}  ${Get_TotalTax}


    ${Get_TotalTax_percent}  Common - Get attribute an element  ${TO_details_TotalTax_percent}  title
    ${Get_TotalTax_percent}  Set Variable  ${Get_TotalTax_percent.replace(' %','')}
    ${Get_TotalTax_percent}  Convert to Number  ${Get_TotalTax_percent}  2
    ${total_tax_percent}=  Evaluate  (${total_tax_all_items}/${sub_total_tax_all_items})*100
    ${total_tax_percent}  Convert to Number  ${total_tax_percent}  2
    Should be equal  ${total_tax_percent}  ${Get_TotalTax_percent}
    ${list_from_element}  Common - Get data from a column  //*[@id="gridItem"]/div[2]/table  1
    Lists should be equal  ${List_items_codes}  ${list_from_element}  ignore_order=True

