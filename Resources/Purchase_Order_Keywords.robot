*** Settings ***
Variables  ../Locators/Purchase_Order_Locators.py
Variables  ../Locators/Common_Locators.py
Library           DateTime
Library    SeleniumLibrary
*** Variables ***
${POform_title}       TẠO ĐƠN MUA HÀNG
${popup_filter_and_add_title}       TÌM VÀ THÊM SẢN PHẨM VÀO ĐƠN HÀNG
${popup_delete_title}       XÓA ĐƠN MUA HÀNG
${popup_cancel_title}       HỦY ĐƠN HÀNG
${POform_title_update}       CẬP NHẬT ĐƠN MUA HÀNG
${POform_title_details}       XEM CHI TIẾT ĐƠN MUA HÀNG
${popup_preview_title}  BẢN IN
${popup_sendmail_title}  GỬI MAIL
${poform_receivegoods_title}  NHẬN HÀNG
*** Keywords ***
PO-Navigate to the Purchase Order list
    Menu - Click on the Purchase Order Management menu
    Sleep   1s
    Menu - Click on the Purchase Order menu
#-Click on create button in the index page
PO-Navigate to the Purchase Order history
    Menu - Click on the Purchase Order Management menu
    Sleep   1s
    Menu - Click on the purchase order history Menu

PO-Click on the "Create a new Purchase Order" button
    Sleep  2s
    Common - Click on an element    ${purchase_order_btn_create}
    ${get_title}  Common - Get text an element     ${purchase_order_popup_filter_and_add_title}
    should be equal    ${popup_filter_and_add_title}      ${get_title}

PO-Select New PO and click "filter and add" button
    Common - Click on an element    ${purchase_order_type_new}
    Common - Click on an element    ${purchase_order_btn_filteradditems}
    ${get_title}  Common - Get text an element     ${purchase_order_title_page}
    should be equal    ${POform_title}      ${get_title}

PO-Input PO number
    [Arguments]   ${i_PO_number}
    Common - Input text to element      ${purchase_order_txt_ponumber}        ${i_PO_number}
PO-Input a random PO number
    [Return]  ${code}
    ${code}   Generate Random String  7  123456789
    Common - Input text to element      ${purchase_order_txt_ponumber}        ${code}
PO-Input PO name
    [Arguments]   ${i_PO_name}
    Common - Input text to element      ${purchase_order_txt_poname}        ${i_PO_name}

PO-Select a supplier
    [Arguments]   ${i_PO_supplier}
    Common - Choose a value from combobox   ${purchase_order_cbx_name_supplier}  ${purchase_order_cbx_name_supplier_value.replace('supplier','${i_PO_supplier}')}

PO-Select a supplier and edit address, phone number
    [Arguments]   ${i_PO_supplier}  ${i_PO_supplier_address}  ${i_PO_supplier_phonenumber}
    Common - Choose a value from combobox   ${purchase_order_cbx_name_supplier}  ${purchase_order_cbx_name_supplier_value.replace('supplier','${i_PO_supplier}')}
    Common - Clear text on an element  ${purchase_order_txt_supplieraddress}
    Common - Input text to element      ${purchase_order_txt_supplieraddress}        ${i_PO_supplier_address}
    Common - Clear text on an element  ${purchase_order_txt_supplierphonenumber}
    Common - Input text to element      ${purchase_order_txt_supplierphonenumber}        ${i_PO_supplier_phonenumber}
#-Change switch to "orderd" and select a day, if status is "orderd", only select a day and do not click on switch
PO-Change status of ordering and pick a day
    [Arguments]   ${i_PO_orderedday}
    ${status}  Run Keyword And Return Status  Element should be visible  //span[@aria-checked='false']
    Run keyword if  ${status}==True  Common - Click on an element    ${purchase_order_switch_status}
    Common - Click on an element  ${purchase_order_orderedday}
    Sleep   1s
    Common - Click on an element  ${purchase_order_orderedday_value.replace('orderedday','${i_PO_orderedday}')}

PO-Select a warehouse
    [Arguments]   ${i_PO_warehouse}
    Common - Choose a value from combobox   ${purchase_order_cbb_warehouse}  ${purchase_order_cbb_warehouse_value.replace('warehouse','${i_PO_warehouse}')}

PO-Select a warehouse and edit address, phone number
    [Arguments]   ${i_PO_warehouse}  ${i_PO_warehouse_address}  ${i_PO_warehouse_phonenumber}
    Common - Choose a value from combobox   ${purchase_order_cbb_warehouse}  ${purchase_order_cbb_warehouse_value.replace('warehouse','${i_PO_warehouse}')}
    Common - Clear text on an element  ${purchase_order_txt_warehouseaddress}
    Common - Input text to element      ${purchase_order_txt_warehouseaddress}        ${i_PO_warehouse_address}
    Common - Clear text on an element  ${purchase_order_txt_warehousephonenumber}
    Common - Input text to element      ${purchase_order_txt_warehousephonenumber}        ${i_PO_warehouse_phonenumber}

PO-Select the staff purchase
    [Arguments]   ${i_PO_staff}
    Common - Choose a value from combobox   ${purchase_order_cbb_purchasestaff}  ${purchase_order_cbb_purchasestaff_value.replace('staff','${i_PO_staff}')}

PO-Select the approver
    [Arguments]   ${i_PO_approver}
    Common - Choose a value from combobox   ${purchase_order_cbb_approver}  ${purchase_order_cbb_approver_value.replace('approver','${i_PO_approver}')}

PO-Input PO note
    [Arguments]   ${i_PO_note}
    Common - Input text to element      ${purchase_order_txt_note}        ${i_PO_note}
#if users dont have approval rigth, they need edit the bellow field
PO-Select the day users send request
    [Arguments]   ${i_PO_requiredday}
    Common - Click On An Element  ${purchase_order_RequiredDate}
    Sleep   1s
    Common - Click On An Element  ${purchase_order_RequiredDate_value.replace('RequiredDate','${i_PO_requiredday}')}
#    Select today
PO-Select the day users send request-today
    Common - Click On An Element  ${purchase_order_RequiredDate}
    Sleep   1s
    Common - Click On An Element  ${purchase_order_dtp_today}

PO-Input expire time
    [Arguments]   ${i_PO_expire_time}
    Common - Click on an element    ${purchase_order_txt_expiretime1}
    Common - Clear text on an element    ${purchase_order_txt_expiretime2}
    Common - Click on an element    ${purchase_order_txt_expiretime1}
    Common - Input text to element      ${purchase_order_txt_expiretime2}        ${i_PO_expire_time}

#The product tab in the create Po page
PO-Navigate to the products tab
    Common - Click on an element    ${purchase_order_tab_items}

#The product tab in the update Po page
PO-Navigate to the products tab in the update page
    Common - Click on an element    ${purchase_order_tab_items_update}
#The product tab in the details page
PO-Navigate to the products tab in the details page
    Common - Click on an element    ${purchase_order_tab_items_details}
#    Wait until element is visible  purchase_order_item_list
# input a product code and click on the result to add it to the gridPO
PO-Type a product code and add it to PO
    [Arguments]   ${i_PO_product_code}   ${i_PO_product_name}
    Common - Click on an element    ${purchase_order_txt_searchitems}
    ${visible} =	Run Keyword And Return Status  Element Should be Visible  ${purchase_order_txt_iconx}
    Run Keyword If	${visible}   Common - Click on an element    ${purchase_order_txt_iconx}
    Common - Input text to element      ${purchase_order_txt_searchitems}        ${i_PO_product_code}9
    ${visible}  Run keyword and return status  Common - Element should be visible for at least  ${purchase_order_txt_selecteditem.replace('item_name','${i_PO_product_name}')}  1s
    IF  ${visible}==True
        Common - Click on an element   ${purchase_order_txt_selecteditem.replace('item_name','${i_PO_product_name}')}
        Common - Click on an element  ${purchase_order_itemcode_column}
    ELSE
        Common - Click on an element  ${purchase_order_itemcode_column}
    END
    ${get_item_code}    Common - Get text an element      ${purchase_order_item_code.replace('itemcode','${i_PO_product_code}')}
    should be equal     ${get_item_code}       ${i_PO_product_code}
#    input a product name and click on the result to add it to the gridPO
PO-Type a product name and add it to PO
    [Arguments]  ${i_PO_product_name}
    Common - Click on an element    ${purchase_order_txt_searchitems}
    Common - Clear text on an element  ${purchase_order_txt_searchitems}
    Sleep  1s
    Common - Input text to element      ${purchase_order_txt_searchitems}        ${i_PO_product_name}
    Common -Click on an element  ${purchase_order_txt_selecteditem.replace('item_name','${i_PO_product_name}')}
# Type Type description, quantity, price, discount, tax after adding them
PO-Type description, quantity, price, discount, tax
    [Arguments]  ${i_PO_item_code}  ${i_PO_item_description}  ${i_PO_item_quantity}  ${i_PO_item_price}  ${i_PO_item_discount}  ${i_PO_item_tax}
    Common - Click on an element  ${purchase_order_item_edited_row.replace('itemcode','${i_PO_item_code}')}
#    Input description
    Common - Click on an element  ${purchase_order_txt_item1descriptioncell}
    Common - Input text to element      ${purchase_order_txt_item1description}  ${i_PO_item_description}
    #   Input quantity
    Common - click on an element  ${purchase_order_txt_item1quantitycell}
    Common - Press a key on the keyboard      ${purchase_order_txt_item1quantity2}  CTRL+a+BACKSPACE
    Input text     ${purchase_order_txt_item1quantity2}  ${i_PO_item_quantity}
#Input price
    Common - click on an element   ${purchase_order_txt_item1pricecell}
    Common - Press a key on the keyboard  ${purchase_order_txt_item1price2}  CTRL+a+BACKSPACE
    Input text  ${purchase_order_txt_item1price2}   ${i_PO_item_price}
#   Input discount
    Common - click on an element  ${purchase_order_txt_item1discountcell}
    Common - Press a key on the keyboard      ${purchase_order_txt_item1discount2}   CTRL+a+BACKSPACE
    Common - Input text to element     ${purchase_order_txt_item1discount2}  ${i_PO_item_discount}
#   Input tax
    Common - click on an element  ${purchase_order_txt_item1taxcell}
    Common - Press a key on the keyboard      ${purchase_order_txt_item1tax2}   CTRL+a+BACKSPACE
    Common - Input text to element     ${purchase_order_txt_item1tax2}  ${i_PO_item_tax}

PO-Input shipping cost
    [Arguments]   ${i_PO_shippingcost}
    Common - Click on an element    ${purchase_order_txt_shippingcost1}
    Common - Press a key on the keyboard    ${purchase_order_txt_shippingcost2}  CTRL+a+BACKSPACE
    Common - Input text to element      ${purchase_order_txt_shippingcost2}        ${i_PO_shippingcost}
PO-Input other cost
    [Arguments]   ${i_PO_othercost}
    Common - Click on an element    ${purchase_order_txt_othercost1}
    Common - Press a key on the keyboard    ${purchase_order_txt_othercost2}  CTRL+a+BACKSPACE
    Common - Input text to element      ${purchase_order_txt_othercost2}        ${i_PO_othercost}
PO-Click on save button
#    Save and return PO name
    [Return]    ${text}
    Common - Click on an element    ${purchase_order_btn_save}
    ${Visible}  Run keyword and return status  Element should be visible   ${message_locator}
    IF  '${Visible}'=='True'
        ${text}    Common - Get text an element        ${message_locator}
        log   ${text}
        ${text}     Remove String      ${text}      [
        ${text}     Remove String      ${text}      ] tạo thành công
    ELSE
        ${text}  Set Variable  Cannot get message
    END
    Wait until page contains element  ${purchase_order_index_table_row}

PO-Click on save and approve button
    #Click button and verify the success message contains PO name
    [Return]    ${text}
    Common - Click on an element    ${purchase_order_btn_saveandapprove}
    ${text}    Common - Get text an element        ${message_locator}
    log   ${text}
    ${text}     Remove String      ${text}      [
    ${text}     Remove String      ${text}      ] tạo thành công
    PO-Navigate to the Purchase Order list
PO-Click on approve and save button
    #Click button and verify the success message contains PO name
    [Return]    ${text}
    Common - Click on an element    ${purchase_order_btn_approveandsave}
    ${passed} =	Run Keyword And Return Status  Element Should be Visible  ${message_locator}
    ${text}  Run key word if  ${passed}   Common - Get text an element        ${message_locator}
    PO-Navigate to the Purchase Order list
PO-Click on save and send request button
    [Return]    ${text}
    Common - Click on an element    ${purchase_order_btn_saveandsendrequest}
    ${text}    Common - Get text an element        ${message_locator}
    ${passed} =	Run Keyword And Return Status  Element Should be Visible  ${message_locator}
    ${text}  Common - Get text an element        ${message_locator}
    PO-Navigate to the Purchase Order list


PO-Verify PO display in grid
    [Arguments]     ${i_PO_number}     ${i_PO_name}     ${i_PO_status}  ${i_PO_total}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}
    Sleep  1s
    Wait until element is Visible  ${purchase_order_table_data_grid}
    ${get_PO_number}       Common - Get text an element      ${purchase_order_index_ponumber.replace('ponumber','${i_PO_number}')}

    ${get_PO_name}       Common - Get text an element     ${purchase_order_poname_ponumber.replace('ponumber','${i_PO_number}')}

    ${get_PO_status}       Common - Get text an element     ${purchase_order_status_ponumber.replace('ponumber','${i_PO_number}')}
    ${get_PO_Create_day}       Common - Get text an element     ${purchase_order_createday_ponumber.replace('ponumber','${i_PO_number}')}
    ${today}=    Get Current Date    result_format=%d-%m-%Y
    Run keyword if  '${i_PO_number}' !=''  should be equal     ${get_PO_number}       ${i_PO_number}
    log  ${i_PO_number}
    ${get_PO_total}       Common - Get text an element     ${purchase_order_index_total.replace('ponumber','${i_PO_number}')}
    should be equal     ${get_PO_name}     ${i_PO_name}
    should be equal     ${get_PO_status}     ${i_PO_status}
    should be equal     ${get_PO_Create_day}     ${today}
    should be equal     ${get_PO_total}     ${i_PO_total}
PO-Verify PO display in grid after update
    [Arguments]     ${i_PO_number}     ${i_PO_name}     ${i_PO_status}  ${i_PO_total}

    Common - Wait until the loading icon loads successfully     ${loader_icon_locator}
    Sleep  1s
    Wait until element is Visible  ${purchase_order_table_data_grid}
    ${get_PO_number}       Common - Get text an element      ${purchase_order_index_ponumber.replace('ponumber','${i_PO_number}')}

    ${get_PO_name}       Common - Get text an element     ${purchase_order_poname_ponumber.replace('ponumber','${i_PO_number}')}

    ${get_PO_status}       Common - Get text an element     ${purchase_order_status_ponumber.replace('ponumber','${i_PO_number}')}
    ${get_PO_Update_day}       Common - Get text an element     ${purchase_order_updateday_ponumber.replace('ponumber','${i_PO_number}')}
    ${get_PO_total}       Common - Get text an element     ${purchase_order_index_total.replace('ponumber','${i_PO_number}')}
    log  ${get_PO_total}
    ${today}=    Get Current Date    result_format=%d-%m-%Y
    Run keyword if  '${i_PO_number}' !=''  should be equal     ${get_PO_number}       ${i_PO_number}
    log  ${i_PO_number}
    should be equal     ${get_PO_name}     ${i_PO_name}
    should be equal     ${get_PO_status}     ${i_PO_status}
    should be equal     ${get_PO_Update_day}     ${today}
    should be equal     ${get_PO_total}     ${i_PO_total}
PO-Delete a PO by checkbox and delete button
    [Arguments]     ${i_PO_number}
    Wait until page contains element  ${purchase_order_checkbox_ponumber.replace('ponumber','${i_PO_number}')}
    Click element    ${purchase_order_checkbox_ponumber.replace('ponumber','${i_PO_number}')}
    Checkbox Should Be Selected  ${purchase_order_checkbox_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_btn_delete}
    ${get_title}  Common - Get text an element     ${purchase_order_popup_delete_title}
    should be equal    ${popup_delete_title}      ${get_title}
    Common - Click on an element    ${btn_confirm_remove_purchase_order}
    ${text}    Common - Get text an element        ${message_locator}
    log   ${text}
    Should be equal  ${text}  [${i_PO_number}] xóa thành công!
    Reload Page
    Wait until page contains element  ${purchase_order_index_table_row}
    Element should not be visible  ${purchase_order_index_ponumber.replace('ponumber','${i_PO_number}')}

PO-Cancel a PO
    [Arguments]     ${i_PO_number}
    Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_btn_cancel}
    ${get_title}  Common - Get text an element     ${purchase_order_popup_cancel_title}
    should be equal    ${popup_cancel_title}      ${get_title}
    Common - Click on an element    ${btn_confirm_cancel_purchase_order}
    Sleep   1s
     ${get_status}  Common - Get text an element     ${purchase_order_status_ponumber.replace('ponumber','${i_PO_number}')}
     log  ${get_status}
     should be equal  Hủy đơn hàng  ${get_status}
     Reload page
     ${get_status}  Common - Get text an element     ${purchase_order_status_ponumber.replace('ponumber','${i_PO_number}')}
     should be equal  Hủy đơn hàng  ${get_status}
#     if the PO_number is auto-generated, use this keywword to get PO number
PO-Find PO code by PO name
     [Return]    ${PO_number}
     [Arguments]     ${i_PO_name}
     ${PO_number}  Common - Get text an element     ${purchase_order_ponumber_poname.replace('poname','${i_PO_name}')}

PO-Click on edit button in the action menu
     [Arguments]     ${i_PO_number}
     Wait Until Element Is Visible  ${purchase_order_createtime_column}
     Double click element  ${purchase_order_createtime_column}
     Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
     Sleep  0.5s
     Common - Click on an element    ${purchase_order_contextmenu_btn_update}
     ${get_title}  Common - Get text an element  ${purchase_order_title_page}
    should be equal    ${POform_title_update}      ${get_title}

PO-Remove a product from PO
     [Arguments]     ${i_item_code}
     Common - Click on an element  ${purchase_order_itemcode_column}
     Common - Click on an element    ${purchase_order_btn_deleteanitem.replace('itemcode','${i_item_code}')}
     Element should not be visible   ${purchase_order_item_edited_row.replace('itemcode','${i_item_code}')}

PO-Change status of the PO
    [Arguments]     ${i_PO_status}
    Sleep  0.5s
     Common - Click on an element  ${purchase_order_cbb_PO_status}
     Sleep   0.5s
     Common - Click on an element    ${purchase_order_cbb_PO_status_value.replace('status','${i_PO_status}')}

PO-Create a Po has 2 product
    [Arguments]     ${i_PO_number}  ${i_PO_name}  ${i_supplier}  ${i_PO_warehouse}  ${i_item1_code}  ${i_item1_name}  ${i_item2_code}  ${i_item2_name}  ${i_PO_approver}
    PO-Navigate to the Purchase Order list
    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    PO-Input PO number  ${i_PO_number}
    PO-Input PO name  ${i_PO_name}
    PO-Select a supplier  ${i_supplier}
    PO-Select a warehouse  ${i_PO_warehouse}
    ${passed} =	Run Keyword And Return Status  Element Should be Visible  ${purchase_order_cbb_approver}
    Run Keyword If	${passed}  PO-Select the approver   ${i_PO_approver}
    Run Keyword If	${passed}  PO-Select the day users send request-today
    PO-Navigate to the products tab
    PO-Type a product code and add it to PO  ${i_item1_code}  ${i_item1_name}
    PO-Type a product code and add it to PO  ${i_item2_code}  ${i_item2_name}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    PO-Verify PO display in grid  ${i_PO_number}     ${i_PO_name}     Tạo mới  ${total}


PO-Delete PO by action menu
    [Arguments]     ${i_PO_number}
    Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_contextmenu_btn_delete}
     ${get_title}  Common - Get text an element     ${purchase_order_popup_delete_title}
    should be equal    ${popup_delete_title}      ${get_title}
    Common - Click on an element    ${btn_confirm_remove_purchase_order}
    ${text}    Common - Get text an element        ${message_locator}
    log   ${text}
    Should be equal  ${text}  [${i_PO_number}] xóa thành công!
    Wait until page contains element  ${purchase_order_index_table_row}  ${TIMEOUT}
    Page should not contain  ${purchase_order_index_ponumber.replace('ponumber','${i_PO_number}')}
PO-Delete PO by delete button in the details page
    [Arguments]     ${i_PO_number}
    Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_actionmenu_btn_viewdetails}
     ${get_title}  Common - Get text an element     ${purchase_order_title_page}
    should be equal    ${POform_title_details}      ${get_title}
    Common - Get text an element  ${purchase_order_detailspage_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_detailspage_btn_delete}
    ${get_title}  Common - Get text an element     ${purchase_order_popup_delete_title}
    should be equal    ${popup_delete_title}      ${get_title}
    Common - Click on an element    ${btn_confirm_remove_purchase_order}
    ${text}    Common - Get text an element        ${message_locator}
    log   ${text}
    Should be equal  ${text}  [${i_PO_number}] xóa thành công!
    Wait until page contains element  ${purchase_order_index_table_row}  ${TIMEOUT}
    Page should not contain element  ${purchase_order_index_ponumber.replace('ponumber','${i_PO_number}')}
PO-Get total of a Po
    [Return]     ${total}
    Common - Click on an element  ${purchase_order_itemcode_column}
    ${total}  Common - Get attribute an element  ${purchase_order_total}  title
    log  ${total}

#-------------------------Verify details page------------
PO-Click on View details in action menu
    [Arguments]  ${i_ponumber}
    Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_ponumber}')}
    Common - Click on an element    ${purchase_order_actionmenu_btn_viewdetails}
     ${get_title}  Common - Get text an element     ${purchase_order_title_page}
    should be equal    ${POform_title_details}      ${get_title}
PO-Click on po-number
    [Arguments]  ${i_ponumber}
    Common - Click on an element    ${purchase_order_index_ponumber.replace('ponumber','${i_ponumber}')}
     ${get_title}  Common - Get text an element     ${purchase_order_title_page}
    should be equal    ${POform_title_details}      ${get_title}
PO-Verify PO-details page after creating or updating
    [Arguments]  &{PO_details}
    ${ponumber}  Common - Get text an element        ${purchase_order_detailspage_ponumber}
    Should be equal  ${PO_details['ponumber']}  ${ponumber}

    ${poname}  Common - Get text an element        ${purchase_order_detailspage_poname}
    Should be equal  ${PO_details['poname']}  ${poname}

    ${postatus}  Common - Get text an element        ${purchase_order_detailspage_status}
    Should be equal  ${PO_details['postatus']}  ${postatus}

    ${orderstatus}  Common - Get text an element        ${purchase_order_detailspage_statusofordering}
    Should be equal  ${PO_details['orderstatus']}  ${orderstatus}

    ${orderday}  Common - Get text an element        ${purchase_order_detailspage_orderd_day}
    Should be equal  ${PO_details['orderday']}  ${orderday}

    ${posupplier}  Common - Get text an element        ${purchase_order_detailspage_supplier}
    Should be equal  ${PO_details['posupplier']}  ${posupplier}

    ${posuppliername}  Common - Get attribute an element  ${purchase_order_detailspage_supplier_name}  value
    Should be equal  ${PO_details['posuppliername']}  ${posuppliername}

    ${posupplieraddress}  Common - Get attribute an element        ${purchase_order_detailspage_supplier_address}  value
    Should be equal  ${PO_details['posupplieraddress']}  ${posupplieraddress}

    ${posupplierphone}  Common - Get attribute an element        ${purchase_order_detailspage_supplier_phone}  value
    Should be equal  ${PO_details['posupplierphone']}  ${posupplierphone}

    ${powarehouse}  Common - Get text an element        ${purchase_order_detailspage_warehouse}
    Should be equal  ${PO_details['powarehouse']}  ${powarehouse}

    ${powarehousename}  Common - Get attribute an element         ${purchase_order_detailspage_warehouse_name}  value
    Should be equal  ${PO_details['powarehousename']}  ${powarehousename}

    ${powarehouseaddress}  Common - Get attribute an element        ${purchase_order_detailspage_warehouse_address}  value
    Should be equal  ${PO_details['powarehouseaddress']}  ${powarehouseaddress}

    ${powarehousephone}  Common - Get attribute an element        ${purchase_order_detailspage_warehouse_phone}  value
    Should be equal  ${PO_details['powarehousephone']}  ${powarehousephone}

    ${postaffpurchase}  Common - Get text an element        ${purchase_order_detailspage_staff_purchase}
    Should be equal  ${PO_details['postaffpurchase']}  ${postaffpurchase}

    ${porequiredday}  Common - Get text an element        ${purchase_order_detailspage_requiredday}
    Should be equal  ${PO_details['porequiredday']}  ${porequiredday}

#    ${approver}  Common - Get text an element        ${purchase_order_detailspage_approver}
#    Should be equal  ${PO_details['approver']}  ${approver}

    ${podueday}  Common - Get text an element        ${purchase_order_detailspage_dueday}
    Should be equal  ${PO_details['podueday']}  ${podueday}

    ${ponote}  Common - Get text an element        ${purchase_order_detailspage_note}
    Should be equal  ${PO_details['ponote']}  ${ponote}

    ${poshippingcost}  Common - Get attribute an element       ${purchase_order_shippingcost}  aria-valuenow
    Should be equal  ${PO_details['poshippingcost']}  ${poshippingcost}

    ${poothercost}  Common - Get attribute an element        ${purchase_order_othercost}  aria-valuenow
    Should be equal  ${PO_details['poothercost']}  ${poothercost}

    ${pototal}  Common - Get attribute an element        ${purchase_order_total}  title
    Should be equal  ${PO_details['pototal']}  ${pototal}
PO-Verify items display correctly in the details page after creating or updating
    [Arguments]   ${i_PO_item_code}  ${i_PO_item_name}  ${i_PO_item_description}  ${i_PO_item_quantity}  ${i_PO_item_price}  ${i_PO_item_discount}  ${i_PO_item_tax}
    ${get_item_code}    Common - Get text an element      ${purchase_order_item_code.replace('itemcode','${i_PO_item_code}')}
    ${get_item_name}      Common - Get text an element    ${purchase_order_item_name.replace('itemcode','${i_PO_item_code}')}
    ${get_item_description}    Common - Get text an element      ${purchase_order_item_description.replace('itemcode','${i_PO_item_code}')}
    ${get_item_quantity}      Common - Get text an element    ${purchase_order_item_quantity.replace('itemcode','${i_PO_item_code}')}
    ${get_item_quantity}  Remove String      ${get_item_quantity}  .00

    ${get_item_price}    Common - Get text an element      ${purchase_order_item_price.replace('itemcode','${i_PO_item_code}')}
    ${get_item_price}  Remove String      ${get_item_price}  ,
    ${get_item_price}   Set variable  ${get_item_price.replace(' ₫','')}

    ${get_item_discount}      Common - Get text an element    ${purchase_order_item_percentdiscount.replace('itemcode','${i_PO_item_code}')}
    ${get_item_discount}   Set variable  ${get_item_discount.replace(' %','')}

    ${get_item_tax}    Common - Get text an element      ${purchase_order_item_tax.replace('itemcode','${i_PO_item_code}')}
    ${get_item_tax}   Set variable  ${get_item_tax.replace(' %','')}
    should be equal     ${get_item_code}       ${i_PO_item_code}
    should be equal     ${get_item_name}     ${i_PO_item_name}
    should be equal     ${get_item_description}       ${i_PO_item_description}
    should be equal     ${get_item_quantity}       ${i_PO_item_quantity}
    should be equal     ${get_item_price}     ${i_PO_item_price}
    should be equal     ${get_item_discount}       ${i_PO_item_discount}
    should be equal     ${get_item_tax}     ${i_PO_item_tax}
#------------Printpreview--------------------------------
PO-Click on preview button
    [Arguments]     ${i_PO_number}
    Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_actionmenu_btn_preview}
     ${get_title}  Common - Get text an element     ${purchase_order_popup_preview_title}
    should be equal    ${popup_preview_title}      ${get_title}
PO-Verify general details
    [Arguments]  ${i_PO_supplier}  ${i_PO_contact}  ${i_PO_supplier_phone}  ${i_supplier_email}  ${i_PO_supplier_payment}  ${i_PO_tax_code}  ${i_PO_supplier_address}  ${i_PO_staff_purchase}  ${i_PO_order_day}  ${i_PO_warehouse}  ${i_PO_warehouse_address}  ${i_PO_shippingcost}  ${i_PO_othercost}  ${i_PO_total}
    ${get_suplier}  Common - Get text an element     ${purchase_order_details_fields.replace('number','1')}
    ${get_contact}  Common - Get text an element     ${purchase_order_details_fields.replace('number','3')}
    ${get_suplier_phone}  Common - Get text an element     ${purchase_order_details_fields.replace('number','5')}
    ${get_suplier_email}  Common - Get text an element     ${purchase_order_details_fields.replace('number','7')}
    ${get_suplier_payment}  Common - Get text an element     ${purchase_order_details_fields.replace('number','9')}
    ${get_suplier_tax_code}  Common - Get text an element     ${purchase_order_details_fields.replace('number','10')}
    ${get_suplier_address}  Common - Get text an element     ${purchase_order_details_fields.replace('number','11')}
    ${get_staff_purchase}  Common - Get text an element     ${purchase_order_details_fields.replace('number','2')}
    ${get_order_day}  Common - Get text an element     ${purchase_order_details_fields.replace('number','4')}
    ${get_warehouse}  Common - Get text an element     ${purchase_order_details_fields.replace('number','6')}
    ${get_warehouse_address}  Common - Get text an element     ${purchase_order_details_fields.replace('number','8')}
    ${get_warehouse_address}  Common - Get text an element     ${purchase_order_details_fields.replace('number','8')}

    ${get_shippingcost}  Common - Get text an element     ${purchase_order_preview_shippingcost}
    ${get_shippingcost}  Remove String      ${get_shippingcost}  ,
    ${get_shippingcost}   Set variable  ${get_shippingcost.replace(' ₫','')}

    ${get_othercost}  Common - Get text an element     ${purchase_order_preview_othercost}
    ${get_othercost}  Remove String      ${get_othercost}  ,
    ${get_othercost}   Set variable  ${get_othercost.replace(' ₫','')}

   ${get_total}  Common - Get text an element     ${purchase_order_preview_total}

    Should be equal  ${get_suplier}  ${i_PO_supplier}
    Should be equal  ${get_contact}  ${i_PO_contact}
    Should be equal  ${get_suplier_phone}  ${i_PO_supplier_phone}
    Should be equal  ${get_suplier_email}  ${i_supplier_email}
    Should be equal  ${get_suplier_payment}  ${i_PO_supplier_payment}
    Should be equal  ${get_suplier_tax_code}  ${i_PO_tax_code}
    Should be equal  ${get_suplier_address}  ${i_PO_supplier_address}
    Should be equal  ${get_staff_purchase}  ${i_PO_staff_purchase}
    Should be equal  ${get_order_day}  ${i_PO_order_day}
    Should be equal  ${get_warehouse}  ${i_PO_warehouse}
    Should be equal  ${get_warehouse_address}  ${i_PO_warehouse_address}
    Should be equal  ${get_shippingcost}  ${i_PO_shippingcost}
    Should be equal  ${get_othercost}  ${i_PO_othercost}
    Should be equal  ${get_total}  ${i_PO_total}
#    Common - Press a key on the keyboard    ${purchase_order_details_fields.replace('number','1')}  ESC
PO-Verify the Item display correctly
    [Arguments]   ${i_PO_item_code}  ${i_PO_item_name}  ${i_PO_item_quantity}  ${i_PO_item_price}  ${i_PO_item_discount}  ${i_PO_item_tax}
    ${get_item_code}    Common - Get text an element      ${purchase_order_preview_itemcode.replace('itemcode','${i_PO_item_code}')}
    ${get_item_name}      Common - Get text an element    ${purchase_order_preview_itemname.replace('itemcode','${i_PO_item_code}')}
    ${get_item_quantity}    Common - Get text an element      ${purchase_order_preview_itemquantity.replace('itemcode','${i_PO_item_code}')}
    ${get_item_price}      Common - Get text an element    ${purchase_order_preview_price.replace('itemcode','${i_PO_item_code}')}
    ${get_item_discount}      Common - Get text an element    ${purchase_order_preview_discount.replace('itemcode','${i_PO_item_code}')}
    ${get_item_tax}      Common - Get text an element    ${purchase_order_preview_tax.replace('itemcode','${i_PO_item_code}')}

    ${get_item_quantity}  Remove String      ${get_item_quantity}  .00
    ${get_item_price}  Remove String      ${get_item_price}  ,
    ${get_item_price}   Set variable  ${get_item_price.replace(' ₫','')}
    ${get_item_discount}   Set variable  ${get_item_discount.replace('%','')}
    ${get_item_tax}   Set variable  ${get_item_tax.replace('%','')}
    should be equal     ${get_item_code}       ${i_PO_item_code}
    should be equal     ${get_item_name}     ${i_PO_item_name}
    should be equal     ${get_item_quantity}       ${i_PO_item_quantity}
    should be equal     ${get_item_price}     ${i_PO_item_price}
    should be equal     ${get_item_discount}       ${i_PO_item_discount}
    should be equal     ${get_item_tax}     ${i_PO_item_tax}

PO-Close preview pop-up
    Common - Click on an element    ${purchase_order_popup_preview_close}
#    ----------------send po to supplier
PO-Click on send po to supplier button in action menu
     [Arguments]     ${i_PO_number}
     Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
     Common - Click on an element    ${purchase_order_actionmenu_btn_send_po_to_supplier}
     ${get_title}  Common - Get text an element  ${purchase_order_popup_sendmail_title}
    should be equal    ${popup_sendmail_title}      ${get_title}

PO-Click on send mail button
    Common - Click on an element    ${purchase_order_button_sendmail}
    ${text}    Common - Get text an element        ${message_locator}
    log   ${text}
#------------------REceive PO
PO-Change status of PO to
    [Arguments]  ${i_po_status}  ${i_ponumber}
    Common - Search data  ${i_PO_number}
    Wait until page contains element  ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    PO-Click on edit button in the action menu  ${i_ponumber}
    PO-Change status of the PO  ${i_po_status}
    PO-Click on save button
PO-Click on receive fully
    [Arguments]   ${i_PO_opion}
    [Return]  ${total_amount}
    Common - Click on an element  ${purchase_order_cbb_landedcost}
    Sleep  1s
    Common - Click on an element  ${purchase_order_cbb_landedcost_option.replace('option','${i_PO_opion}')}
    log  ${i_PO_opion}
    Common - Click on an element    ${purchase_order_btn_receivefully}
    ${total_amount}  Common - Get attribute an element  ${purchase_order_total_amount}  title
    log  ${total_amount}
    Common - Click on an element    ${purchase_order_btn_receive}
    Page should contain element   ${purchase_order_popup_receive_po_fully_title}
    Common - Click on an element   ${purchase_order_btn_confirm_receive_fully}
    ${text}    Common - Get text an element  ${message_locator}
    log   ${text}
PO-Navigate to receive po page
    [Arguments]     ${i_PO_number}
    Common - Search data  ${i_PO_number}
    Wait until page contains element  ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    Common - Click on an element    ${purchase_order_contextmenu_ponumber.replace('ponumber','${i_PO_number}')}
    Sleep  1s
    Common - Click on an element    ${purchase_order_actionmenu_btn_receive_po}
    ${get_title}  Common - Get text an element     ${purchase_order_title_page}
    should be equal    ${poform_receivegoods_title}      ${get_title}
    Common - Get text an element  ${purchase_order_cbb_warehouse}
    Common - Click on an element    ${purchase_order_tab_items_details}
    Wait until page contains element  ${purchase_order_index_table_row}

PO-Click on receive partially and complete Po
    [Arguments]  ${i_PO_landedcost}
#-----Select  quantity or value
    Common - Click on an element  ${purchase_order_itemcode_column}
    Common - Click on an element  ${purchase_order_cbb_landedcost}
    Common - Click on an element  ${purchase_order_cbb_landedcost_option.replace('option','${i_PO_landedcost}')}

    log  ${i_PO_landedcost}
    ${total_amount}  Common - Get attribute an element  ${purchase_order_total_amount}  title
    log  ${total_amount}
    Common - Click on an element  ${purchase_order_btn_receive}
#    show pop-up
    Page should contain element   ${purchase_order_popup_receive_po_title}
#    Select option
    Common - Click on an element     ${purchase_order_rad_receivetype1}
    Common - Click on an element     ${purchase_order_btn_receivepartially}
#    ${get_successful_message}    Common - Get text an element        ${purchase_order_successful_message}

    [Return]   ${total_amount}

PO-Click on receive partially and create new Po

    [Arguments]  ${i_PO_landedcost}
    [Return]  ${total_amount}
#-----Select  quantity or value
    Common - Click on an element  ${purchase_order_cbb_landedcost}

    Common - Click on an element  ${purchase_order_cbb_landedcost_option.replace('option','${i_PO_landedcost}')}

    log  ${i_PO_landedcost}
    ${total_amount}  Common - Get attribute an element  ${purchase_order_total_amount}  title
    log  ${total_amount}
    Common - Click on an element  ${purchase_order_btn_receive}
#    show pop-up
    Page should contain element   ${purchase_order_popup_receive_po_title}
#    Select option
    Common - Double click on an element     ${purchase_order_rad_receivetype3}
    Common - Click on an element     ${purchase_order_btn_receivepartially}

PO-Click on receive partially

    [Arguments]  ${i_PO_landedcost}
    [Return]   ${total_amount}
#-----Select  quantity or value
    Common - Click on an element  ${purchase_order_cbb_landedcost}

    Common - Click on an element  ${purchase_order_cbb_landedcost_option.replace('option','${i_PO_landedcost}')}
    Common - Click on an element  ${purchase_order_itemcode_column}
    ${total_amount}  Common - Get attribute an element  ${purchase_order_total_amount}   title
    Common - Click on an element  ${purchase_order_btn_receive}
#    show pop-up
    Page should contain element   ${purchase_order_popup_receive_po_title}
#    Select option
    Wait Until Element Is Visible  ${purchase_order_rad_receivetype2}
    Click element     ${purchase_order_rad_receivetype2}
    Click element     ${purchase_order_rad_receivetype2}

    Common - Click on an element     ${purchase_order_btn_receivepartially}

PO-Type quantity of an titem to receive
    [Arguments]  ${i_PO_item_code}  ${i_PO_item_quantity}
    Common - Double click on an element  ${purchase_order_item_edited_row.replace('itemcode','${i_PO_item_code}')}
    #   Input quantity
    Common - Double click on an element  ${purchase_order_txt_itemquantitycell_receive}
    Common - Press a key on the keyboard      ${purchase_order_txt_itemquantityreceive}  CTRL+a+BACKSPACE
    Input text     ${purchase_order_txt_itemquantityreceive}  ${i_PO_item_quantity}

PO-Type quantity of an titem to receive partially
    [Arguments]  ${i_PO_item_code}  ${i_PO_item_quantity}
    Common - Double click on an element  ${purchase_order_item_edited_row.replace('itemcode','${i_PO_item_code}')}
    #   Input quantity
    Common - Double click on an element  ${purchase_order_txt_itemquantitycell_receive}
    Common - Press a key on the keyboard      ${purchase_order_txt_itemquantitycell_receive_partial}  CTRL+a+BACKSPACE
    Input text     ${purchase_order_txt_itemquantityreceive_partial}  ${i_PO_item_quantity}

PO-Type quantity of serial titem to receive partially
    [Arguments]  ${i_PO_item_code}  ${i_PO_item_quantity}
    Common - Double click on an element  ${purchase_order_item_edited_row.replace('itemcode','${i_PO_item_code}')}
    #   Input quantity
    Common - Click on an element   ${purchase_order_btn_serial_receive}
    Common - CLick on an element  ${purchase_order_txt_serial1}
    ${Random}  Generate Random String  10
    Input text  ${purchase_order_txt_serial1}  ${Random}
    Common - Double click on an element  ${purchase_order_txt_serial1_start_click}
    Input text  ${purchase_order_txt_serial1_start}  0
    Common - click on an element  ${purchase_order_txt_serial1_quantity_click}
    Common - Clear text on an element  ${purchase_order_txt_serial1_quantity}
    Common - click on an element  ${purchase_order_txt_serial1_quantity_click}
    Input text  ${purchase_order_txt_serial1_quantity}  ${i_PO_item_quantity}
    Common - Click on an element   ${purchase_order_btn_add_serials}
    Common - Press a key on the keyboard      ${purchase_order_txt_serial1_quantity_click}  ESC
PO-Create a new PO has full details
    [Arguments]  ${i_PO_details}  ${i_PO_list_items}

    PO-Click on the "Create a new Purchase Order" button
    PO-Select New PO and click "filter and add" button
    ${exist}  Run Keyword And Return Status  Variable Should Exist  ${i_PO_details.data_po_number}
    IF  '${exist}' == 'True'
           IF  '${i_PO_details.data_po_number}' == ''
                ${PO_code}  PO-Input a random PO number
           ELSE
                PO-Input PO number    ${i_PO_details.data_po_number}
           END
    END

    IF  '${exist}' == 'False'
        ${PO_code}  PO-Input a random PO number
    END
    PO-Input PO name  ${i_PO_details.data_po_name}
    PO-Select a supplier and edit address, phone number  ${i_PO_details.data_supplier}  ${i_PO_details.data_supplier_address}  ${i_PO_details.data_supplier_phonenumber}
    PO-Change status of ordering and pick a day  ${i_PO_details.data_po_orderedday}
    PO-Select a warehouse and edit address, phone number  ${i_PO_details.data_warehouse}  ${i_PO_details.data_warehouse_address}  ${i_PO_details.data_warehouse_phonenumber}
    PO-Select the staff purchase  ${i_PO_details.data_staffpurchase}
    PO-Select the approver  ${i_PO_details.data_approver}
    PO-Input expire time  ${i_PO_details.data_expiretime}
    PO-Input PO note  ${i_PO_details.data_note}
    PO-Navigate to the products tab
    PO-Add several products and input details  ${i_PO_list_items}
    PO-Input shipping cost  ${i_PO_details.data_shippingcost}
    PO-Input other cost  ${i_PO_details.data_othercost}
    ${total}  PO-Get total of a Po
    PO-Click on save button
    [Return]  ${PO_code}  ${total}
PO-Add several products and input details
    [Arguments]  ${i_list_items}
    FOR  ${item}  IN  @{i_list_items}
        log  ${item}
        PO-Type a product code and add it to PO  ${item.code}  ${item.name}
        PO-Type description, quantity, price, discount, tax  ${item.code}  ${item.description}  ${item.quantity}  ${item.price}  ${item.discount}  ${item.tax}
    END
PO-Select method and receive PO
    [Arguments]  ${method}  ${option}
    Common - Click on an element  ${purchase_order_cbb_landedcost}
    Common - Click on an element  ${purchase_order_cbb_landedcost_option.replace('option','${option}')}
    log  ${option}
    IF  '${method}'=='Nhận toàn bộ'
        Common - Click on an element    ${purchase_order_btn_receivefully}
        Common - Click on an element    ${purchase_order_btn_receive}
        Page should contain element   ${purchase_order_popup_receive_po_fully_title}
        Common - Click on an element   ${purchase_order_btn_confirm_receive_fully}
        ${text}    Common - Get text an element  ${message_locator}
        log   ${text}
    ELSE
        Common - Click on an element  ${purchase_order_btn_receive}
    #    show pop-up
        Page should contain element   ${purchase_order_popup_receive_po_title}
    #    Select option
        IF  '${method}'=='Nhận một phần và hoàn thành đơn hàng'
            Common - Click on an element     ${purchase_order_rad_receivetype1}
        ELSE
            IF  '${method}'=='Nhận một phần, đợi nhận thêm'
                Common - Click on an element
                Common - Click on an element     ${purchase_order_rad_receivetype2}
            ELSE
                Common - Click on an element     ${purchase_order_rad_receivetype3}
            END
        END
        Common - Click on an element     ${purchase_order_btn_receivepartially}
    END

PO-Verify PO display in history
    [Arguments]   ${i_PO_number}  ${i_PO_Order_date}  ${i_PO_Supplier}  ${i_PO_Payment}  ${i_PO_Total}
    ${get_PO_number}    Common - Get text an element  ${purchase_order_history_po_number.replace('ponumber','${i_PO_number}')}
    ${get_PO_Create_date}      Common - Get text an element    ${purchase_order_history_po_create_day.replace('ponumber','${i_PO_number}')}
    ${get_PO_Order_date}    Common - Get text an element      ${purchase_order_history_po_number_order_day.replace('ponumber','${i_PO_number}')}
    ${get_PO_Complete_date}      Common - Get text an element    ${purchase_order_history_po_receive_day.replace('ponumber','${i_PO_number}')}
    ${get_PO_Supplier}      Common - Get text an element    ${purchase_order_history_po_supplier.replace('ponumber','${i_PO_number}')}
    ${get_PO_Payment}      Common - Get text an element    ${purchase_order_history_po_payment_status.replace('ponumber','${i_PO_number}')}
    ${get_PO_Total}      Common - Get text an element    ${purchase_order_history_po_total.replace('ponumber','${i_PO_number}')}

    ${today}=  Get Current Date    result_format=%d-%m-%Y
    should be equal     ${get_PO_number}       ${i_PO_number}
    should be equal     ${get_PO_Create_date}     ${today}
    should be equal     ${get_PO_Order_date}       ${i_PO_Order_date}
    should be equal     ${get_PO_Complete_date}       ${today}
    should be equal     ${get_PO_Supplier}     ${i_PO_Supplier}
    should be equal     ${get_PO_Payment}       ${i_PO_Payment}
    should be equal     ${get_PO_Total}       ${i_PO_Total}
PO-Convert money to integer
    [Arguments]  ${i_money}
    [Return]   ${i_money}
    ${i_money}  Remove String   ${i_money}  ,
    ${i_money}  Remove String   ${i_money}   ₫
    log  ${i_money}
    ${i_money}  Convert to Integer  ${i_money}