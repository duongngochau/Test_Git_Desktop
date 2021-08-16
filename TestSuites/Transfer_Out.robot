*** Settings ***
Resource   ../Resources/Env_Variables.robot
Variables  ../Data/GlobalData.yaml
Variables  ../Data/TransferOutData.yaml
Library           BuiltIn
Test Setup          Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                 AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

Test Teardown       Run Keywords     Close All Browsers

*** Test Cases ***

14356_Create new transfer-out note when filling all fields-Users do not have approval right

    [Tags]   14356

    TO - Navigate to Transfer out list page
    TO - Navigate to create transfer-out page
    ${14356.data_to_code}  TO - Input a random TO code
    TO - Select a warehouse to transfer-out  ${14356.data_warehouse}
    TO - Select a TO type  ${14356.data_to_type}
    TO - Input TO name  ${14356.data_to_name}
    TO - Select the shipping address and edit address details  ${14356.data_shipping_address}  ${14356.data_shipping_address_details}  ${14356.data_shipping_address_phone}
    TO - Input required date  ${14356.data_date_require}
    TO - Input transfer-out date  ${14356.data_date_transfer}
    TO - Input TO note  ${14356.data_note}
    TO - Input shipping cost  ${14356.data_shippingcost}
    TO - Input other cost  ${14356.data_shippingcost}
    TO - Navigate to the item tab
    TO - Input an item code and add it to TO  ${14356.data_product1.code}
    TO - Input Description, Quantity, Price, Tax of an item  ${14356.data_product1}
    TO - Add a product to TO by button  ${14356.data_product2.code}
    TO - Input Description, Quantity, Price, Tax of an item  ${14356.data_product2}
    TO - Click on Save button
    TO - Verify the TO display in grid  ${14356.data_to_code}  ${14356.data_to_name}  ${14356.data_warehouse}  ${14356.data_to_status_in_grid}
    TO - Delete TO by button in the index page  ${14356.data_to_code}
14357_Create new transfer-out note when filling all required fields-Users do not have approval right
    [Setup]          Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                 AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    [Tags]   14357

    TO - Navigate to Transfer out list page
    TO - Navigate to create transfer-out page
    TO - Select a warehouse to transfer-out  ${14357.data_warehouse}
    TO - Select a TO type  ${14357.data_to_type}
    TO - Input TO name  ${14357.data_to_name}
    TO - Select the shipping address  ${14357.data_shipping_address}  ${14357.data_shipping_address_details}  ${14357.data_shipping_address_phone}
    TO - Input required date  ${14357.data_date_require}
    TO - Input transfer-out date  ${14357.data_date_transfer}
    TO - Input other cost  ${14357.data_shippingcost}
    TO - Navigate to the item tab
    TO - Input an item code and add it to TO  ${14357.data_product1.code}
    TO - Add a product to TO by button  ${14357.data_product2.code}
    TO - Click on Save button and confirm
    ${14357.data_to_code}  TO - Get TO code by TO name  ${14357.data_to_name}
    TO - Verify the TO display in grid  ${14357.data_to_code}  ${14357.data_to_name}  ${14357.data_warehouse}  ${14357.data_to_status_in_grid}
    TO - Delete TO by button in the index page  ${14357.data_to_code}
13661_Create a new transfer out inter-store successfully with multiple items by the "Save and approve" button
    [Setup]  Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...                 AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
    [Tags]   13661

    TO - Navigate to Transfer out list page
    TO - Navigate to create transfer-out page
    ${13661.data_to_code}  TO-Input a random TO code
    TO - Select a warehouse to transfer-out  ${13661.data_warehouse}
    TO - Select a TO type  ${13661.data_to_type}
    ${13661.data_to_name}  TO - Input a random TO name
    TO - Select the shipping address and edit address details  ${13661.data_shipping_address}  ${13661.data_shipping_address_details}  ${13661.data_shipping_address_phone}
    TO - Input required date  ${13661.data_date_require}
    TO - Input transfer-out date  ${13661.data_date_transfer}
    TO - Input TO note  ${13661.data_note}
    TO - Input shipping cost  ${13661.data_shippingcost}
    TO - Input other cost  ${13661.data_shippingcost}
    TO - Navigate to the item tab
    TO - Input an item code and add it to TO  ${13661.data_product1.code}
    TO - Input Description, Quantity, Price, Tax of an item  ${13661.data_product1}
    TO - Add a product to TO by button  ${13661.data_product2.code}
    TO - Input Description, Quantity, Price, Tax of an item  ${13661.data_product2}
    TO - Click on Save and approve button
    TO - Verify the TO display in grid  ${13661.data_to_code}  ${13661.data_to_name}  ${13661.data_warehouse}  ${13661.data_to_status_in_grid}
    TO - Navigate to update transfer-out page  ${13661.data_to_code}
    TO - Click save update button
    TO - Reject and save TO  ${13661.data_to_code}
    TO - Delete TO by button in the index page  ${13661.data_to_code}
13663_Create a new transfer out inter-store successfully with multiple items by the "Save and send to approver" button

    [Tags]   13663

    TO - Navigate to Transfer out list page
    TO - Navigate to create transfer-out page
    ${13663.data_to_code}  TO-Input a random TO code
    TO - Select a warehouse to transfer-out  ${13663.data_warehouse}
    TO - Select a TO type  ${13663.data_to_type}
    ${13663.data_to_name}  TO - Input a random TO name
    TO - Select the shipping address and edit address details  ${13663.data_shipping_address}  ${13663.data_shipping_address_details}  ${13663.data_shipping_address_phone}
    TO - Input required date  ${13663.data_date_require}
    TO - Input transfer-out date  ${13663.data_date_transfer}
    TO - Input TO note  ${13663.data_note}
    TO - Input shipping cost  ${13663.data_shippingcost}
    TO - Input other cost  ${13663.data_shippingcost}
    TO - Navigate to the item tab
    TO - Input an item code and add it to TO  ${13663.data_product1.code}
    TO - Input Description, Quantity, Price, Tax of an item  ${13663.data_product1}
    TO - Add a product to TO by button  ${13663.data_product2.code}
    TO - Input Description, Quantity, Price, Tax of an item  ${13663.data_product2}
#    _____________Do not have save and send to approver button
    TO - Click on Save button
    TO - Verify the TO display in grid  ${13663.data_to_code}  ${13663.data_to_name}  ${13663.data_warehouse}  ${13663.data_to_status_in_grid}
26769_Update all fields of TO successfully

    [Tags]   26769

    TO - Navigate to Transfer out list page
    ${list_item_code}=  Create List  ${26769.data_product1.code}  ${26769.data_product2.code}  ${26769.data_product3.code}  ${26769.data_product4.code}
    ${26769.data_to_code}  TO - Create a new TO    ${26769.data_warehouse}  ${list_item_code}
    TO - Navigate to update transfer-out page  ${26769.data_to_code}
    TO - Select a warehouse to transfer-out  ${26769.data_warehouse_update}
    TO - Select a TO type  ${26769.data_to_type}
    TO - Input TO name  ${26769.data_to_name_update}
    TO - Select the shipping address and edit address details  ${26769.data_shipping_address}  ${26769.data_shipping_address_details}  ${26769.data_shipping_address_phone}
    TO - Input required date  ${26769.data_date_require}
    TO - Input transfer-out date  ${26769.data_date_transfer}
    TO - Input TO note  ${26769.data_note}
    TO - Input shipping cost  ${26769.data_shippingcost}
    TO - Input other cost  ${26769.data_shippingcost}
    TO - Navigate to the item tab
    TO - Input Description, Quantity, Price, Tax of an item  ${26769.data_product1}
    TO - Input Description, Quantity, Price, Tax of an item  ${26769.data_product2}
    TO - Click save update button
    TO - Verify the TO display in grid after updating  ${26769.data_to_code}  ${26769.data_to_name_update}  ${26769.data_warehouse_update}  ${26769.data_to_status_in_grid}
    TO - Delete TO by button in the index page  ${26769.data_to_code}
26770_User deleting product and adding other products successfully

    [Tags]   26770
    TO - Navigate to Transfer out list page
    ${list_item_code}=  Create List  ${26770.data_product1.code}  ${26770.data_product2.code}  ${26770.data_product3.code}  ${26770.data_product4.code}
#    --------Create a PO to update
    ${26770.data_to_code}  TO - Create a new TO    ${26770.data_warehouse}  ${list_item_code}

#    -----------update PO
    TO - Navigate to update transfer-out page  ${26770.data_to_code}
    TO - Select a warehouse to transfer-out  ${26770.data_warehouse_update}
    TO - Select a TO type  ${26770.data_to_type}
    TO - Input TO name  ${26770.data_to_name_update}
    TO - Select the shipping address and edit address details  ${26770.data_shipping_address}  ${26770.data_shipping_address_details}  ${26770.data_shipping_address_phone}
    TO - Input required date  ${26770.data_date_require}
    TO - Input transfer-out date  ${26770.data_date_transfer}
    TO - Input TO note  ${26770.data_note}
    TO - Input shipping cost  ${26770.data_shippingcost}
    TO - Input other cost  ${26770.data_othercost}
    TO - Navigate to the item tab
     ${list_item_code_removed}=  Create List  ${26770.data_product3.code}  ${26770.data_product4.code}
    TO - Remove items from the TO  ${list_item_code_removed}
    ${list_item_code_added}=  Create List  ${26770.data_product5.code}  ${26770.data_product6.code}
    TO - Add items to the TO  ${list_item_code_added}
    TO - Input Description, Quantity, Price, Tax of an item  ${26770.data_product1}
    TO - Input Description, Quantity, Price, Tax of an item  ${26770.data_product2}
    TO - Click save update button
    TO - Verify the TO display in grid after updating  ${26770.data_to_code}  ${26770.data_to_name_update}  ${26770.data_warehouse_update}  ${26770.data_to_status_in_grid}
    TO - Navigate to the details page  ${26770.data_to_code}
    TO - Navigate to the item tab
    ${list_item_code_updated}=  Create List  ${26770.data_product1}  ${26770.data_product2}  ${26770.data_product5}  ${26770.data_product6}
    TO - Verify the list items  ${list_item_code_updated}  ${26770.data_shippingcost}  ${26770.data_othercost}
    TO - Navigate to Transfer out list page
    TO - Delete TO by button in the index page  ${26770.data_to_code}
10403_The information should show full-on the page after clicking on the "View details" button

    [Tags]   10403
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${10403.data_product1}  ${10403.data_product2}  ${10403.data_product3}  ${10403.data_product4}  ${10403.data_product5}  ${10403.data_product6}
#    --------Create a PO
    TO - Create a New TO has full details  ${10403}  ${list_item}
    TO - Navigate to the details page  ${10403.data_to_code}
    TO - Verify the the general details  ${10403}
    TO - Navigate to the item tab
    TO - Verify the list items  ${list_item}  ${10403.data_shippingcost}  ${10403.data_othercost}
    TO - Navigate to Transfer out list page
    TO - Delete TO by button in the index page  ${10403.data_to_code}

10404_Delete a transfer out successfully with "New" status
    [Tags]   10404
    TO - Navigate to Transfer out list page
    ${list_item_code}=  Create List  ${10404.data_product1.code}  ${10404.data_product2.code}  ${10404.data_product3.code}  ${10404.data_product4.code}  ${10404.data_product5.code}  ${10404.data_product6.code}
    ${10404.data_to_code}  TO - Create a new TO    ${10404.data_warehouse}  ${list_item_code}
    TO - Delete TO by button in the index page  ${10404.data_to_code}
    ${10404.data_to_code}  TO - Create a new TO    ${10404.data_warehouse}  ${list_item_code}
    TO - Delete TO by action button  ${10404.data_to_code}

10446_Send request to the approver successfully
    [Tags]   10446
    TO - Navigate to Transfer out list page
    ${list_item_code}=  Create List  ${10446.data_product1}  ${10446.data_product2}  ${10446.data_product3}  ${10446.data_product4}  ${10446.data_product5}  ${10446.data_product6}
    TO - Create a New TO has full details  ${10446}  ${list_item_code}
    TO - Send TO to the approver  ${10446.data_to_code}
    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Verify the TO display in grid after updating  ${10446.data_to_code}  ${10446.data_to_name}  ${10446.data_warehouse}  Chờ duyệt
    TO - Reject and save TO  ${10446.data_to_code}
    TO - Navigate to Transfer out list page
#    Not verify the notifications  because this feature is not implement
    TO - Delete TO by button in the index page  ${10446.data_to_code}

10405_Delete a transfer out successfully with "Denied" status
    [Tags]   10405
    TO - Navigate to Transfer out list page
    ${list_item_code}=  Create List  ${10405.data_product1}  ${10405.data_product2}  ${10405.data_product3}  ${10405.data_product4}  ${10405.data_product5}  ${10405.data_product6}
    TO - Create a New TO has full details  ${10405}  ${list_item_code}
    TO - Send TO to the approver  ${10405.data_to_code}
    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Reject and save TO  ${10405.data_to_code}
    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Delete TO by button in the index page  ${10405.data_to_code}

#---delete by action button
    TO - Create a New TO has full details  ${10405}  ${list_item_code}
    TO - Send TO to the approver  ${10405.data_to_code}
    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Reject and save TO  ${10405.data_to_code}
    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Delete TO by action button  ${10405.data_to_code}
    Close All Browsers

18591_Preview of TO note is displayed correctly and fully when user clicking on "Preview" button
    [Tags]   18591
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${18591.data_product1}  ${18591.data_product2}  ${18591.data_product3}  ${18591.data_product4}
    TO - Create a New TO has full details  ${18591}  ${list_item}
    TO - Open the preview of TO  ${18591.data_to_code}
    TO - Verify the the general details in the preview  ${18591}
    TO - Verify the the items list in the preview  ${list_item}  ${18591.data_shippingcost}  ${18591.data_othercost}
    TO - Close the preview pop-up
    TO - Delete TO by button in the index page  ${18591.data_to_code}
13681_Transfer goods to other store with option - transfer-out fully
    [Tags]   13681
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${13681.data_product1}  ${13681.data_product2}  ${13681.data_product3}  ${13681.data_product4}
#    Create new TO has random code  ${13681.data_to_code} is random
    TO - Create a New TO has full details  ${13681}  ${list_item}
    log  ${13681.data_to_code}
    TO - Send TO to the approver  ${13681.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${13681.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${13681.data_to_code}
    TO - Click on transfer-out fully button
    TO - Verify TO does not display in the index page  ${13681.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${13681.data_to_code}  ${13681.data_to_name}  ${13681.data_warehouse}  ${13681.data_shipping_address}


13693_Transfer goods to other store with option - transfer-out partially and complete
    [Tags]   13693
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${13693.data_product1}  ${13693.data_product2}  ${13693.data_product3}  ${13693.data_product4}
#   # Create new TO has random code  ${13693.data_to_code} is random
    TO - Create a New TO has full details  ${13693}  ${list_item}
    log  ${13693.data_to_code}
    TO - Send TO to the approver  ${13693.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${13693.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${13693.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially and complete
    TO - Verify TO does not display in the index page  ${13693.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${13693.data_to_code}  ${13693.data_to_name}  ${13693.data_warehouse}  ${13693.data_shipping_address}

13692_Transfer goods to other store with option - transfer-out partially and create new TO
    [Tags]   13692
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${13692.data_product1}  ${13692.data_product2}  ${13692.data_product3}  ${13692.data_product4}
#   # Create new TO has random code  ${13692.data_to_code} is random
    TO - Create a New TO has full details  ${13692}  ${list_item}
    log  ${13692.data_to_code}
    TO - Send TO to the approver  ${13692.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${13692.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${13692.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially and create new TO
    TO - Verify TO does not display in the index page  ${13692.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${13692.data_to_code}  ${13692.data_to_name}  ${13692.data_warehouse}  ${13692.data_shipping_address}
13682_Transfer goods to other store partially
    [Tags]   13682
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${13682.data_product1}  ${13682.data_product2}  ${13682.data_product3}  ${13682.data_product4}
#   # Create new TO has random code  ${13682.data_to_code} is random
    TO - Create a New TO has full details  ${13682}  ${list_item}
    log  ${13682.data_to_code}
    TO - Send TO to the approver  ${13682.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${13682.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${13682.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${13682.data_to_code}  ${13682.data_to_name}  ${13682.data_warehouse}  ${13682.data_to_status_in_grid_transfered_out}
    TO - Navigate to transfer-out page   ${13682.data_to_code}
    TO - Verify the list items after transfering_out partially  ${list_item}  ${13682.data_shippingcost}  ${13682.data_othercost}
14366_[TO in "transfer out partially" status] Transfer-out successfully to the store with option "transfer-out fully"
    [Tags]   14366
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${14366.data_product1}  ${14366.data_product2}  ${14366.data_product3}  ${14366.data_product4}
   # Create new TO has random code  ${14366.data_to_code} is random
    TO - Create a New TO has full details  ${14366}  ${list_item}
    log  ${14366.data_to_code}
    TO - Send TO to the approver  ${14366.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${14366.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${14366.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${14366.data_to_code}  ${14366.data_to_name}  ${14366.data_warehouse}  ${14366.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${14366.data_to_code}
    TO - Verify the list items after transfering_out partially  ${list_item}  ${14366.data_shippingcost}  ${14366.data_othercost}
    TO - Click on transfer-out fully button
    TO - Verify TO does not display in the index page    ${14366.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${14366.data_to_code}  ${14366.data_to_name}  ${14366.data_warehouse}  ${14366.data_shipping_address}
14367_[TO in "transfer out partially" status] Transfer goods successfully to the store with option "transfer-out partially and complete"
    [Tags]   14367
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${14367.data_product1}  ${14367.data_product2}  ${14367.data_product3}  ${14367.data_product4}
   # Create new TO has random code  ${14367.data_to_code} is random
    TO - Create a New TO has full details  ${14367}  ${list_item}
    log  ${14367.data_to_code}
    TO - Send TO to the approver  ${14367.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${14367.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${14367.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${14367.data_to_code}  ${14367.data_to_name}  ${14367.data_warehouse}  ${14367.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${14367.data_to_code}
    TO - Verify the list items after transfering_out partially  ${list_item}  ${14367.data_shippingcost}  ${14367.data_othercost}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially and complete
    TO - Verify TO does not display in the index page    ${14367.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${14367.data_to_code}  ${14367.data_to_name}  ${14367.data_warehouse}  ${14367.data_shipping_address}

26767_[TO in "transfer out partially" status] Transfer goods to the store successfully with option "transfer-out partially and create new TO"
    [Tags]   26767
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${26767.data_product1}  ${26767.data_product2}  ${26767.data_product3}  ${26767.data_product4}
   # Create new TO has random code  ${26767.data_to_code} is random
    TO - Create a New TO has full details  ${26767}  ${list_item}
    log  ${26767.data_to_code}
    TO - Send TO to the approver  ${26767.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${26767.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${26767.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${26767.data_to_code}  ${26767.data_to_name}  ${26767.data_warehouse}  ${26767.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${26767.data_to_code}
    TO - Verify the list items after transfering_out partially  ${list_item}  ${26767.data_shippingcost}  ${26767.data_othercost}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially and create new TO
    TO - Verify TO does not display in the index page    ${26767.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${26767.data_to_code}  ${26767.data_to_name}  ${26767.data_warehouse}  ${26767.data_shipping_address}

14368_[TO in "transfer out partially" status] Transfer goods to the store successfully with option "transfer-out partially"
    [Tags]   14368
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${14368.data_product1}  ${14368.data_product2}  ${14368.data_product3}  ${14368.data_product4}
   # Create new TO has random code  ${14368.data_to_code} is random
    TO - Create a New TO has full details  ${14368}  ${list_item}
    log  ${14368.data_to_code}
    TO - Send TO to the approver  ${14368.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${14368.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${14368.data_to_code}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${14368.data_to_code}  ${14368.data_to_name}  ${14368.data_warehouse}  ${14368.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${14368.data_to_code}
    TO - Verify the list items after transfering_out partially  ${list_item}  ${14368.data_shippingcost}  ${14368.data_othercost}
    TO - Input quantity to transfer-out several items      ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${14368.data_to_code}  ${14368.data_to_name}  ${14368.data_warehouse}  ${14368.data_to_status_in_grid_transfered_out}

15581_Transfer serrial products to the store with option "transsfer-out fully"
    [Tags]   15581
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15581.data_product1}  ${15581.data_product2}
   # --------Create new TO has random code  ${15581.data_to_code} is random
    TO - Create a New TO has full details  ${15581}  ${list_item}
    log  ${15581.data_to_code}
    TO - Send TO to the approver  ${15581.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15581.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15581.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Click on transfer-out fully button
    TO - Verify TO does not display in the index page    ${15581.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${15581.data_to_code}  ${15581.data_to_name}  ${15581.data_warehouse}  ${15581.data_shipping_address}

15582_Transfer serrial products to the store with option "transfer-out parrtially and complete"
    [Tags]   15582
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15582.data_product1}  ${15582.data_product2}
   # --------Create new TO has random code  ${15582.data_to_code} is random
    TO - Create a New TO has full details  ${15582}  ${list_item}
    log  ${15582.data_to_code}
    TO - Send TO to the approver  ${15582.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15582.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15582.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially and complete
    TO - Verify TO does not display in the index page    ${15582.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${15582.data_to_code}  ${15582.data_to_name}  ${15582.data_warehouse}  ${15582.data_shipping_address}


15583_Transfer serrial products to the store with option "transfer-out partially
    [Tags]   15583
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15583.data_product1}  ${15583.data_product2}
   # --------Create new TO has random code  ${15583.data_to_code} is random
    TO - Create a New TO has full details  ${15583}  ${list_item}
    log  ${15583.data_to_code}
    TO - Send TO to the approver  ${15583.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15583.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15583.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid  ${15583.data_to_code}  ${15583.data_to_name}  ${15583.data_warehouse}  ${15583.data_to_status_in_grid_transfered_out}
    TO - Navigate to transfer-out page   ${15583.data_to_code}
    TO - Verify the list items after transfering_out partially  ${list_item}  ${15583.data_shippingcost}  ${15583.data_othercost}
    TO - Navigate to Transfer out list page
    TO - Navigate to the details page  ${15583.data_to_code}
    TO - Verify TO details after transfering_out partially  ${15583}  ${list_item}



15584_Transfer serrial products to the store with option "transfer-out partially and create new TO"
    [Tags]   15584
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15584.data_product1}  ${15584.data_product2}
   # --------Create new TO has random code  ${15584.data_to_code} is random
    TO - Create a New TO has full details  ${15584}  ${list_item}
    log  ${15584.data_to_code}
    TO - Send TO to the approver  ${15584.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15584.data_to_code}

    Close All Browsers
    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15584.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially and create new TO
    TO - Verify TO does not display in the index page    ${15584.data_to_code}
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${15584.data_to_code}  ${15584.data_to_name}  ${15584.data_warehouse}  ${15584.data_shipping_address}
    TO - Navigate to the details page by clicking on code  ${15584.data_to_code}
    TO - Verify TO details in history page  ${15584}  ${list_item}

15586_[TO in "transfer out partially" status] Transfer serial products successfully to the store with option "transfer-out fully"
    [Tags]   15586
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15586.data_product1}  ${15586.data_product2}
#   # --------Create new TO has random code  ${15586.data_to_code} is random
    TO - Create a New TO has full details  ${15586}  ${list_item}
    log  ${15586.data_to_code}
    TO - Send TO to the approver  ${15586.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15586.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15586.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid   ${15586.data_to_code}  ${15586.data_to_name}  ${15586.data_warehouse}  ${15586.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${15586.data_to_code}
    TO - Input quantity to transfer-out several serial items in the second time  ${list_item}
    TO - Click on transfer-out fully button
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${15586.data_to_code}  ${15586.data_to_name}  ${15586.data_warehouse}  ${15586.data_shipping_address}
    TO - Navigate to the details page by clicking on code  ${15586.data_to_code}
    TO - Verify TO details in history page after transfering several times  ${15586}  ${list_item}
15587_[TO in "transfer out partially" status] Transfer serrial products successfully to the store with option "transfer-out partally"
    [Tags]   15587
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15587.data_product1}  ${15587.data_product2}
##   # --------Create new TO has random code  ${15587.data_to_code} is random
    TO - Create a New TO has full details  ${15587}  ${list_item}
    log  ${15587.data_to_code}
    TO - Send TO to the approver  ${15587.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15587.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15587.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid   ${15587.data_to_code}  ${15587.data_to_name}  ${15587.data_warehouse}  ${15587.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${15587.data_to_code}
    TO - Input quantity to transfer-out several serial items in the second time  ${list_item}
    TO - Transfer-out partially
    TO - Navigate to Transfer out list page
    TO - Navigate to the details page by clicking on code  ${15587.data_to_code}

15588_[TO in "transfer out partially" status] Transfer serrial products to the store with option "transfer-out partially and complete"
    [Tags]   15588
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15588.data_product1}  ${15588.data_product2}
##   # --------Create new TO has random code  ${15588.data_to_code} is random
    TO - Create a New TO has full details  ${15588}  ${list_item}
    log  ${15588.data_to_code}
    TO - Send TO to the approver  ${15588.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15588.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15588.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid   ${15588.data_to_code}  ${15588.data_to_name}  ${15588.data_warehouse}  ${15588.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${15588.data_to_code}
    TO - Input quantity to transfer-out several serial items in the second time  ${list_item}
    TO - Transfer-out partially and complete
    TO - Navigate to Transfer out list page
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${15588.data_to_code}  ${15588.data_to_name}  ${15588.data_warehouse}  ${15588.data_shipping_address}
    TO - Navigate to the details page by clicking on code  ${15588.data_to_code}
    TO - Verify TO details in history page after transfering several times  ${15588}  ${list_item}

15589_[TO in "transfer out partially" status] Transfer serrial products successfully to the store with option "transfer-out partially and create new TO"
    [Tags]   15589
    TO - Navigate to Transfer out list page
    ${list_item}=  Create List  ${15589.data_product1}  ${15589.data_product2}
##   # --------Create new TO has random code  ${15589.data_to_code} is random
    TO - Create a New TO has full details  ${15589}  ${list_item}
    log  ${15589.data_to_code}
    TO - Send TO to the approver  ${15589.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Approve and save TO  ${15589.data_to_code}

    Common - Log out the current user
    The user logins to the system    ${USER_STORE2}   ${PASSWORD}
    TO - Navigate to Transfer out list page
    TO - Navigate to transfer-out page   ${15589.data_to_code}
    TO - Input quantity to transfer-out several serial items  ${list_item}
    TO - Transfer-out partially
    TO - Verify the TO display in grid   ${15589.data_to_code}  ${15589.data_to_name}  ${15589.data_warehouse}  ${15589.data_to_status_in_grid_transfered_out}

    TO - Navigate to transfer-out page   ${15589.data_to_code}
    TO - Input quantity to transfer-out several serial items in the second time  ${list_item}
    TO - Transfer-out partially and create new TO
    TO - Navigate to Transfer out list page
    TO - Navigate to Transfer out history
    TO - Verify the TO received display in the history  ${15589.data_to_code}  ${15589.data_to_name}  ${15589.data_warehouse}  ${15589.data_shipping_address}
    TO - Navigate to the details page by clicking on code  ${15589.data_to_code}
    TO - Verify TO details in history page after transfering several times  ${15589}  ${list_item}