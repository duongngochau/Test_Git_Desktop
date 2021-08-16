*** Settings ***
Resource   ../Resources/Env_Variables.robot
Variables  ../Data/GlobalData.yaml

Test Setup          Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                 AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

Test Teardown       Run Keywords     Close All Browsers

*** Test Cases ***

10762_Create a TI from store successfully when filling all field

    [Tags]   10762

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Verify the create transfer-in page appear   ${10762.data_title_create_TI}

    TI - Navigate to create new transfer-in page

    ${TI_code}  Input code for the transfer-in

    ${TI_location}  Input location id for the transfer-in   ${10762.data_location}

    ${TI_terms}  Input terms for the the transfer-in    ${10762.data_terms}

    ${TI_name}  Input name for the transfer-in

    ${TI_requisitioner}  Input requisitioner for the transfer-in   ${10762.data_requisitioner}

    ${TI_delivery_address}  Input delivery address for the the transfer-in  ${10762.data_delivery_address}

    Input order license for the transfer-in

    Input note for the transfer-in

    TI - Navigate to item information tab

    ${TI_item_list}   TI - Add item pop-up - Add item for the transfer-in   ${10762.data_item_code}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${TI_location}    ${TI_terms}   ${TI_name}   ${TI_requisitioner}   ${TI_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

10763_Create a TI from store successfully when filling all required field

    [Tags]   10763

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Verify the create transfer-in page appear   ${10762.data_title_create_TI}

    TI - Navigate to create new transfer-in page

    ${TI_code}  Input code for the transfer-in

    ${TI_location}  Input location id for the transfer-in   ${10762.data_location}

    ${TI_terms}  Input terms for the the transfer-in    ${10762.data_terms}

    ${TI_name}  Input name for the transfer-in

    ${TI_requisitioner}  Input requisitioner for the transfer-in   ${10762.data_requisitioner}

    ${TI_delivery_address}  Input delivery address for the the transfer-in  ${10762.data_delivery_address}

    TI - Navigate to item information tab

    ${TI_item_list}   TI - Add item pop-up - Add item for the transfer-in   ${10763.data_item_code}

    TI - Click on Save button to create the transfer-in
    
#    Verify the user created TI successfully    ${TI_code}   ${TI_location}    ${TI_terms}   ${TI_name}   ${TI_requisitioner}   ${TI_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

26783_Update all fields of a TI successfully

    [Tags]   26783

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26783.data_location}   ${26783.data_terms}   ${26783.data_requisitioner}   ${26783.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in   ${26783.data_item1_code}

    TI - Add item pop-up - Add item for the transfer-in    ${26783.data_item2_code}

    TI - Click on Save button to create the transfer-in

    ${TI_code}   Get From List    ${data_input}    0

    Navigate to edit transfer-in page   ${TI_code}

    Verify the edit TI page appear    ${26783.data_title_edit}

    ${update_TI_location}   Update location id for the transfer-in   ${26783.data_update_location}

    ${update_TI_terms}  Input terms for the the transfer-in    ${26783.data_update_terms}

    ${update_TI_name}   Input name for the transfer-in

    ${update_TI_requisitioner}   Update requisitioner for the transfer-in   ${26783.data_update_requisitioner}

    ${update_TI_delivery_address}   Update delivery address for the the transfer-in   ${26783.data_update_delivery_address}

    Input note for the transfer-in

    TI - Navigate to item information tab
    
    ${update_TI_item_list}   Update item for the transfer-in   ${26783.data_update_item}

    TI - Click on Save Edit button to Update for the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${update_TI_location}    ${update_TI_terms}   ${update_TI_name}   ${update_TI_requisitioner}   ${update_TI_delivery_address}   ${update_TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

18551_Verify the print preview of TI is displayed fully and correctly

    [Tags]   18551

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${18551.data_location}   ${18551.data_terms}   ${18551.data_requisitioner}   ${18551.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in   ${18551.data_item1_code}
    
    TI - Add item pop-up - Add item for the transfer-in    ${18551.data_item2_code}

    TI - Click on Save button to create the transfer-in

    ${TI_code}   Get From List    ${data_input}    0

    TI - Open the print preview pop-up for verify and Verify the print preview data    ${TI_code}

    TI - Remove a transfer-in    ${TI_code}

13920_Create a TI successfully with option ADD ALL PRODUCT - ALL PRODUCT

    [Tags]  13920

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Navigate to create transfer-in page with option ADD ALL PRODUCT - ALL PRODUCT

    ${data_input}   Filling all required fields to create a TI    ${13920.data_location}   ${13920.data_terms}   ${13920.data_requisitioner}   ${13920.data_delivery_address}

    TI - Navigate to item information tab

    ${TI_item_list}   Add item pop-up - Add all item for TI

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${13920.data_location}    ${13920.data_terms}   ${TI_name}   ${13920.data_requisitioner}   ${13920.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

14280_Create new TI successfully with option ADD ALL PRODUCT and select departments

    [Tags]   14280

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Clicking on ADD ALL PRODUCT IN GROUP radio button

    Clicking on Choose department radio button

    Select department to filter item for new TI   ${14280.data_department1}

    Select department to filter item for new TI   ${14280.data_department2}

    Navigate to create transfer-in page after select option
    
    ${data_input}   Filling all required fields to create a TI    ${14280.data_location}   ${14280.data_terms}   ${14280.data_requisitioner}   ${14280.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    Add item pop-up - Add item for the TI when filter by department   ${14280.data_department1}

    ${item_list}   Add item pop-up - Add item for the TI when filter by department   ${14280.data_department2}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${13920.data_location}    ${13920.data_terms}   ${TI_name}   ${13920.data_requisitioner}   ${13920.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

14184_Create new TI successfully with option ADD ALL PRODUCT and select categories

    [Tags]   14184

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Clicking on ADD ALL PRODUCT IN GROUP radio button

    Clicking on Choose category radio button

    Select category to filter item for new TI   ${14184.data_category1}

    Select category to filter item for new TI   ${14184.data_category2}

    Navigate to create transfer-in page after select option

    ${data_input}   Filling all required fields to create a TI    ${14184.data_location}   ${14184.data_terms}   ${14184.data_requisitioner}   ${14184.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    Add item pop-up - Add item for the TI when filter by category   ${14184.data_category1}

    ${item_list}   Add item pop-up - Add item for the TI when filter by category   ${14184.data_category2}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${14184.data_location}    ${14184.data_terms}   ${TI_name}   ${14184.data_requisitioner}   ${14184.data_delivery_address}   ${item_list}

    TI - Remove a transfer-in    ${TI_code}

15244_Create new TI successfully with option ADD ALL PRODUCT and select cost

    [Tags]   15244

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Clicking on ADD ALL PRODUCT IN GROUP radio button

    Clicking on filter by condition radio button

    Input cost condition for add all product option   ${15244.data_cost}

    Navigate to create transfer-in page after select option

    ${data_input}   Filling all required fields to create a TI    ${15244.data_location}   ${15244.data_terms}   ${15244.data_requisitioner}   ${15244.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    ${TI_item_list}  TI - Item information tab - Update quantity for items   ${15244.data_quantity}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${15244.data_location}    ${15244.data_terms}   ${TI_name}   ${15244.data_requisitioner}   ${15244.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

14204_Create new TI successfully with option BASE ON ORDER INFORMATION - Add all product

    [Tags]   14204

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Navigate to create transfer-in page with option BASE ON ORDER INFORMATION - ALL PRODUCT

    ${data_input}   Filling all required fields to create a TI    ${14204.data_location}   ${14204.data_terms}   ${14204.data_requisitioner}   ${14204.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${14204.data_quantity}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${14204.data_location}    ${14204.data_terms}   ${TI_name}   ${14204.data_requisitioner}   ${14204.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

14221_Create new TI successfully with option BASE ON ORDER INFORMATION and select department

    [Tags]   14221

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Clicking on BASE ON ORDER INFORMATION radio button

    Clicking on Choose department radio button

    Select department to filter item for new TI   ${14221.data_department}

    Navigate to create transfer-in page after select option

    ${data_input}   Filling all required fields to create a TI    ${14221.data_location}   ${14221.data_terms}   ${14221.data_requisitioner}   ${14221.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${14221.data_quantity}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${14221.data_location}    ${14221.data_terms}   ${TI_name}   ${14221.data_requisitioner}   ${14221.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

14201_Create new TI successfully with option BASE ON ORDER INFORMATION and select categories

    [Tags]   14201

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Clicking on BASE ON ORDER INFORMATION radio button

    Clicking on Choose category radio button

    Select category to filter item for new TI   ${14201.data_category1}

    Select category to filter item for new TI   ${14201.data_category2}

    Navigate to create transfer-in page after select option

    ${data_input}   Filling all required fields to create a TI    ${14201.data_location}   ${14201.data_terms}   ${14201.data_requisitioner}   ${14201.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${14201.data_quantity}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${14201.data_location}    ${14201.data_terms}   ${TI_name}   ${14201.data_requisitioner}   ${14201.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

26795_Create new TI successfully with option BASE ON ORDER INFORMATION and select cost

    [Tags]   26795

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    Clicking on BASE ON ORDER INFORMATION radio button

    Clicking on filter by condition radio button

    Input cost condition for add all product option   ${26795.data_cost}

    Navigate to create transfer-in page after select option

    ${data_input}   Filling all required fields to create a TI    ${26795.data_location}   ${26795.data_terms}   ${26795.data_requisitioner}   ${26795.data_delivery_address}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    TI - Navigate to item information tab

    ${TI_item_list}  TI - Item information tab - Update quantity for items   ${26795.data_quantity}

    TI - Click on Save button to create the transfer-in

#    Verify the user created TI successfully    ${TI_code}   ${26795.data_location}    ${26795.data_terms}   ${TI_name}   ${26795.data_requisitioner}   ${26795.data_delivery_address}   ${TI_item_list}

    TI - Remove a transfer-in    ${TI_code}

#15977_Create new TI successfully with option Product sold in period - Add all product
#
#    [Tags]   15977
#
#    TI - Navigate to Transfer in list page
#
#    TI - Navigate to create transfer-in page
#
#    Clicking on PRODUCT SOLD IN PERIOD radio button
#
#    Input FROM DATE for PRODUCT SOLD IN PERIOD option    ${15977.data_from_date_day}   ${15977.data_from_date_month}   ${15977.data_from_date_year}
#
#    Input TO DATE for PRODUCT SOLD IN PERIOD option    ${15977.data_to_date_day}    ${15977.data_to_date_month}    ${15977.data_to_date_year}
#
#    Navigate to create transfer-in page with option PRODUCT SOLD IN PERIOD - ALL PRODUCT
#
#    ${data_input}   Filling all required fields to create a TI    ${15977.data_location}   ${15977.data_terms}   ${15977.data_requisitioner}   ${15977.data_delivery_address}
#
#    ${TI_code}   Get From List    ${data_input}    0
#
#    ${TI_name}   Get From List    ${data_input}    3
#
#    TI - Navigate to item information tab
#
#    ${TI_item_list}  TI - Item information tab - Update quantity for items   ${15977.data_quantity}
#
#    TI - Click on Save button to create the transfer-in
#
##    Verify the user created TI successfully    ${TI_code}   ${15977.data_location}    ${15977.data_terms}   ${TI_name}   ${15977.data_requisitioner}   ${15977.data_delivery_address}   ${TI_item_list}
#
#    TI - Remove a transfer-in    ${TI_code}
#
#16019_Create new TI successfully with option Product sold in period - select categories
#
#    [Tags]   16019
#
#    TI - Navigate to Transfer in list page
#
#    TI - Navigate to create transfer-in page
#
#    Clicking on PRODUCT SOLD IN PERIOD radio button
#
#    Input FROM DATE for PRODUCT SOLD IN PERIOD option    ${16019.data_from_date_day}   ${16019.data_from_date_month}   ${16019.data_from_date_year}
#
#    Input TO DATE for PRODUCT SOLD IN PERIOD option    ${16019.data_to_date_day}    ${16019.data_to_date_month}    ${16019.data_to_date_year}
#
#    Clicking on Choose category radio button
#
#    Select category to filter item for new TI   ${16019.data_category1}
#
#    Select category to filter item for new TI   ${16019.data_category2}
#
#    Navigate to create transfer-in page after select option
#
#    ${data_input}   Filling all required fields to create a TI    ${16019.data_location}   ${16019.data_terms}   ${16019.data_requisitioner}   ${16019.data_delivery_address}
#
#    ${TI_code}   Get From List    ${data_input}    0
#
#    TI - Navigate to item information tab
#
#    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${16019.data_quantity}
#
#    TI - Click on Save button to create the transfer-in
#
##    Verify the user created TI successfully    ${TI_code}   ${14201.data_location}    ${14201.data_terms}   ${TI_name}   ${14201.data_requisitioner}   ${14201.data_delivery_address}   ${TI_item_list}
#
#    TI - Remove a transfer-in    ${TI_code}
#
#16041_Create new TI successfully with option Product sold in period - select department
#
#    [Tags]   16041
#
#    TI - Navigate to Transfer in list page
#
#    TI - Navigate to create transfer-in page
#
#    Clicking on PRODUCT SOLD IN PERIOD radio button
#
#    Input FROM DATE for PRODUCT SOLD IN PERIOD option    ${16041.data_from_date_day}   ${16041.data_from_date_month}   ${16041.data_from_date_year}
#
#    Input TO DATE for PRODUCT SOLD IN PERIOD option    ${16041.data_to_date_day}    ${16041.data_to_date_month}    ${16041.data_to_date_year}
#
#    Clicking on Choose department radio button
#
#    Select department to filter item for new TI   ${16041.data_department}
#
#    Navigate to create transfer-in page after select option
#
#    ${data_input}   Filling all required fields to create a TI    ${16041.data_location}   ${16041.data_terms}   ${16041.data_requisitioner}   ${16041.data_delivery_address}
#
#    ${TI_code}   Get From List    ${data_input}    0
#
#    TI - Navigate to item information tab
#
#    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${16041.data_quantity}
#
#    TI - Click on Save button to create the transfer-in
#
##    Verify the user created TI successfully    ${TI_code}   ${16041.data_location}    ${16041.data_terms}   ${TI_name}   ${16041.data_requisitioner}   ${16041.data_delivery_address}   ${TI_item_list}
#
#    TI - Remove a transfer-in    ${TI_code}
#
#26786_Create new TI successfully with option Product sold in period - select cost
#
#    [Tags]   26786
#
#    TI - Navigate to Transfer in list page
#
#    TI - Navigate to create transfer-in page
#
#    Clicking on PRODUCT SOLD IN PERIOD radio button
#
#    Input FROM DATE for PRODUCT SOLD IN PERIOD option    ${26786.data_from_date_day}   ${26786.data_from_date_month}   ${26786.data_from_date_year}
#
#    Input TO DATE for PRODUCT SOLD IN PERIOD option    ${26786.data_to_date_day}    ${26786.data_to_date_month}    ${26786.data_to_date_year}
#
#    Clicking on filter by condition radio button
#
#    Input cost condition for add all product option   ${26786.data_cost}
#
#    Navigate to create transfer-in page after select option
#
#    ${data_input}   Filling all required fields to create a TI    ${26786.data_location}   ${26786.data_terms}   ${26786.data_requisitioner}   ${26786.data_delivery_address}
#
#    ${TI_code}   Get From List    ${data_input}    0
#
#    ${TI_name}   Get From List    ${data_input}    3
#
#    TI - Navigate to item information tab
#
#    ${TI_item_list}  TI - Item information tab - Update quantity for items   ${26786.data_quantity}
#
#    TI - Click on Save button to create the transfer-in
#
##    Verify the user created TI successfully    ${TI_code}   ${26786.data_location}    ${26786.data_terms}   ${TI_name}   ${26786.data_requisitioner}   ${26786.data_delivery_address}   ${TI_item_list}
#
#    TI - Remove a transfer-in    ${TI_code}

15674_Receive serial items successfully when selecting RECEIVE ALL

    [Tags]   15674

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${15674.data_location}   ${15674.data_terms}   ${15674.data_requisitioner}   ${15674.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${15674.data_add_item1}

    TI - Add item pop-up - Add item for the transfer-in    ${15674.data_add_item2}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${15674.data_quantity}

    TI - Click on Save button to create the transfer-in

    Receive all serial item for TI note   ${TI_code}   ${15674.data_quantity}

    TI - Clicking on Import full button to import full item of TI note

15675_Receive serial items successfully when selecting RECEIVE PARTIALLY

    [Tags]   15675

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${15675.data_location}   ${15675.data_terms}   ${15675.data_requisitioner}   ${15675.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${15675.data_add_item1}

    TI - Add item pop-up - Add item for the transfer-in    ${15675.data_add_item2}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${15675.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for serial item    ${TI_code}    ${15675.data_quantity}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    TI - Receive partially for serial item    ${TI_code}    ${15675.data_item_exist}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

15676_Receive serial items successfully when selecting RECEIVE PARTIALLY AND CREATE NEW TI

    [Tags]   15676

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${15676.data_location}   ${15676.data_terms}   ${15676.data_requisitioner}   ${15676.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${15676.data_add_item1}

    TI - Add item pop-up - Add item for the transfer-in    ${15676.data_add_item2}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${15676.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for serial item    ${TI_code}    ${15676.data_quantity}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially and create new TI radio button
    
    TI - Remove a transfer-in    ${TI_name}

15678_Receive serial items successfully when selecting RECEIVE PARTIALLY AND COMPLETE

    [Tags]   15678

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${15678.data_location}   ${15678.data_terms}   ${15678.data_requisitioner}   ${15678.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${15678.data_add_item1}

    TI - Add item pop-up - Add item for the transfer-in    ${15678.data_add_item2}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${15678.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for serial item    ${TI_code}    ${15678.data_quantity}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially and complete radio button

26808_[TI in status receive partially"] Receive serial items successfully with option "receive all"

    [Tags]  26808

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26808.data_location}   ${26808.data_terms}   ${26808.data_requisitioner}   ${26808.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26808.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26808.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    	${TI_code}    ${26808.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    TI - Receive partially for standar products    ${TI_code}    ${26808.data_recieve_quantity2}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    TI - Receive all for standar products   ${TI_code}

26809_[TI in status receive partially"] Receive serial items successfully with option "receive partially"

    [Tags]  26809

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26809.data_location}   ${26809.data_terms}   ${26809.data_requisitioner}   ${26809.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26809.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26809.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    	${TI_code}    ${26809.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    TI - Receive partially for standar products    ${TI_code}    ${26809.data_recieve_quantity2}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

26812_[TI in status receive partially"] Receive goods successfully with option "receive partially and create new TI"

    [Tags]  26812

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26812.data_location}   ${26812.data_terms}   ${26812.data_requisitioner}   ${26812.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26812.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26812.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    	${TI_code}    ${26812.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    TI - Receive partially for standar products    ${TI_code}    ${26812.data_recieve_quantity2}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially and create new TI radio button

    TI - Remove a transfer-in    ${TI_name}

26811_[TI in status receive partially"] Receive goods successfully with option "receive partially and complete"

    [Tags]  26811

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26811.data_location}   ${26811.data_terms}   ${26811.data_requisitioner}   ${26811.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26811.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26811.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    	${TI_code}    ${26811.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    TI - Receive partially for standar products    ${TI_code}    ${26811.data_recieve_quantity2}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially and complete radio button

26802_Receive goods successfully when selecting "receive all"

    [Tags]  26802

#    Menu - Click on the Items Management menu
#
#    Menu - Click on the Repository Information menu

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26802.data_location}   ${26802.data_terms}   ${26802.data_requisitioner}   ${26802.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26802.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    TI - Click on Save button to create the transfer-in

    TI - Receive all for standar products   ${TI_code}

26803_Receive goods successfully when selecting "receive partially"

    [Tags]  26803

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26803.data_location}   ${26803.data_terms}   ${26803.data_requisitioner}   ${26803.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26803.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26803.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    	${TI_code}    ${26803.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially radio button

    # Receive the exist products

    TI - Receive all for standar products   ${TI_code}

26804_Receive goods successfully when selecting "receive partially and complete"

    [Tags]  26804

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26804.data_location}   ${26804.data_terms}   ${26804.data_requisitioner}   ${26804.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26804.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26804.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    ${TI_code}    ${26804.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially and complete radio button

26805_Receive goods successfully when selecting "receive partially and creare new TI"

    [Tags]  26805

    TI - Navigate to Transfer in list page

    TI - Navigate to create transfer-in page

    TI - Navigate to create new transfer-in page

    ${data_input}   Filling all required fields to create a TI    ${26805.data_location}   ${26805.data_terms}   ${26805.data_requisitioner}   ${26805.data_delivery_address}

    TI - Navigate to item information tab

    TI - Add item pop-up - Add item for the transfer-in    ${26805.data_add_item1}

    ${TI_code}   Get From List    ${data_input}    0

    ${TI_name}   Get From List    ${data_input}    3

    ${TI_item_list}   TI - Item information tab - Update quantity for items   ${26805.data_quantity}

    TI - Click on Save button to create the transfer-in

    TI - Receive partially for standar products    ${TI_code}    ${26805.data_recieve_quantity1}

    TI - Clicking on Import partially button to import partially item of TI note

    TI - Import partially item for TI when select Import partially and create new TI radio button

    TI - Remove a transfer-in    ${TI_name}