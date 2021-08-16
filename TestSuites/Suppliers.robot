*** Settings ***
Resource        ../Resources/Env_Variables.robot
Variables       ../Data/GlobalData.yaml

Test Setup      Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...             AND     The user logins to the system    ${USER_TENANT}   ${PASSWORD}

Test Teardown   Run Keywords    Close All Browsers

*** Test Cases ***

17464_Create new supplier sucessfully when filling all fields

    [Tags]   17464

    Menu - Click on the Items Management menu

    Navigate To Suppliers Page And Verify The Suppliers Page Appears

    ${data_input}   Supplier - Create a supplier when filling all fields     ${17464.data_currency}    ${17464.data_pay_method}    ${17464.data_country}    ${17464.data_city}    ${17464.data_district}    ${17464.data_ward}

    Navigate To Items Tab

    ${item_list}   Add an item for the supplier    ${17466.data_item_input}

    Click On Save Button To Create A Suppliers

    ${supplier_code}   Get From List    ${data_input}    0

    Click On Save Button To Create A Suppliers

    Supplier - Verify data all fields when user created a supplier successfully    ${supplier_code}    ${data_input}    ${item_list}

    Remove the supplier after create suppliers successfully   ${supplier_code}

17466_Create new supplier sucessfully when filling all required fields

    [Tags]   17466

    Menu - Click on the Items Management menu

    Navigate To Suppliers Page And Verify The Suppliers Page Appears

    ${data_input}   Supplier - Create a supplier when filling all required fields    ${17466.data_currency}    ${17466.data_pay_method}    ${17466.data_country}    ${17466.data_city}   ${17466.data_district}   ${17466.data_ward}

    Navigate To Items Tab

    ${item_list}   Add an item for the supplier    ${17466.data_item_input}

    Click On Save Button To Create A Suppliers

    ${supplier_code}   Get From List    ${data_input}    0

    Click On Save Button To Create A Suppliers

    Supplier - Verify data all required fields when user created a supplier successfully    ${supplier_code}    ${data_input}    ${item_list}

    Remove the supplier after create suppliers successfully   ${supplier_code}

5196_Verify the product list data of the supplier is display correctly

    [Tags]   5196

    Menu - Click on the Items Management menu

    Navigate To Suppliers Page And Verify The Suppliers Page Appears

    Common - Search data    ${5196.data_supplier_name}

    Supplier list - Open the product list pop-up to verify

    ${item_list}    Supplier list - Get data in product list pop-up

    Navigate to item page for verify

    Products_Keywords.Filter the item by supplier   ${5196.data_supplier_name}

    Verify product data of the supplier     ${item_list}

5952_Add products to supplier successfully by action button

    [Tags]   5952

    Menu - Click on the Items Management menu

    Navigate To Suppliers Page And Verify The Suppliers Page Appears

    Common - Search data    ${5952.data_supplier_name}

    Supplier list - Open the add product pop-up to verify

    Supplier list - Add a item for the supplier   ${5952.data_item_code}    ${5952.data_item_unit}

    Remove a product from the supplier   ${5952.data_item_code}   ${5952.data_supplier_name}

25951_Update status of suppliers successfully

    [Tags]   25951

    [Documentation]   Update status for the supplier from active to stop

    Menu - Click on the Items Management menu

    Navigate To Suppliers Page And Verify The Suppliers Page Appears

    ${data_input}   Supplier - Create a supplier when filling all required fields    ${25951.data_currency}    ${25951.data_pay_method}    ${25951.data_country}    ${25951.data_city}   ${25951.data_district}   ${25951.data_ward}

    Navigate To Items Tab

    Add an item for the supplier    ${25951.data_item}

    Click On Save Button To Create A Suppliers

    ${supplier_code}   Get From List    ${data_input}    0

    Update status for a supplier    ${supplier_code}     ${25951.data_stop_status}

    Verify the data after update status   ${supplier_code}     ${25951.data_stop_status}

    Remove the supplier after create suppliers successfully   ${supplier_code}

25838_Update all fields of a supplier successfully

    [Tags]   25838

    Menu - Click on the Items Management menu

    Navigate To Suppliers Page And Verify The Suppliers Page Appears

    ${data_input}   Supplier - Create a supplier when filling all required fields    ${25838.data_currency}    ${25838.data_pay_method}    ${25838.data_country}    ${25838.data_city}   ${25838.data_district}   ${25838.data_ward}

    Navigate To Items Tab

    Add an item for the supplier    ${25838.data_item}

    Click On Save Button To Create A Suppliers

    ${supplier_code}   Get From List    ${data_input}    0

    ${data_update}   Update all fields of a supplier    ${supplier_code}    ${25838.data_update_currency}    ${25838.data_update_pay_method}    ${25838.data_update_country}    ${25838.data_update_city}    ${25838.data_update_district}   ${25838.data_update_ward}

    Navigate To Items Tab

    Click on Delete Button to remove item of suppliers

    ${update_item_list}   Add an item for the supplier    ${25838.data_update_item}

    Click on Save button to update for suppliers

    Verify Create Suppliers Successfully    ${supplier_code}    ${data_update}    ${update_item_list}

    Remove the supplier after create suppliers successfully   ${supplier_code}