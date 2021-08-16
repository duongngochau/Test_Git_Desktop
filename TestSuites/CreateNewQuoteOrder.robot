*** Settings ***
Resource   ../Resources/Env_Variables.robot

Variables  ../Data/GlobalData.yaml
Variables  ../Data/QuoteOrderData.yaml

Test Setup             Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                    AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

Test Teardown         Close All Browsers

*** Test Cases ***
26054_Verify the quote order is created successfully after clicking on the Save action button

    [Tags]   26054

    ${item_list}     Get infomation of the item      ${26054.ID_ITEM}

    ${cus_list}      Get information of the customer     ${26054.NAME_CUS}

    Navigate to the Quote Order list

    Click on the "Create a new Quote order" button

    # Quote order form
    Select a customer      ${cus_list}

    Add an item to the quote order      ${item_list}

    ${ID_QUOTE_ORDER}     Click on the Save button - Quote Order

    Store - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    Navigate to the Quote Order list

    Central - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}

    Cancel a Quote order    ${ID_QUOTE_ORDER}

26058_Verify the user can only Cancel the quote order of which status is "New"

    [Tags]   26058

    ${item_list}     Get infomation of the item      ${26058.ID_ITEM}

    ${cus_list}      Get information of the customer     ${26058.NAME_CUS}

    Navigate to the Quote Order list

    Click on the "Create a new Quote order" button

    # Quote order form
    Select a customer      ${cus_list}

    Add an item to the quote order      ${item_list}

    ${ID_QUOTE_ORDER}     Click on the Save button - Quote Order

    Store - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    Navigate to the Quote Order list

    Central - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}

    Cancel a Quote order       ${ID_QUOTE_ORDER}

    Navigate to Cancel QO list page   ${26058.cancel_status}

    Remove a quote order        ${ID_QUOTE_ORDER}

26745_Verify the user can only Remove the quote order of which status is "New"

    [Tags]   26745

    ${item_list}     Get infomation of the item      ${26745.ID_ITEM}

    ${cus_list}      Get information of the customer     ${26745.NAME_CUS}

    Navigate to the Quote Order list

    Click on the "Create a new Quote order" button

    # Quote order form
    Select a customer      ${cus_list}

    Add an item to the quote order      ${item_list}

    ${ID_QUOTE_ORDER}     Click on the Save button - Quote Order

    Store - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    Navigate to the Quote Order list

    Central - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}

    Remove a quote order        ${ID_QUOTE_ORDER}

26399_Verify it's impossible for changing the customer when updating a quote order

    [Tags]   26399

    ${item_list}     Get infomation of the item      ${26399.ID_ITEM}

    ${cus_list}      Get information of the customer     ${26399.NAME_CUS}

    ${edit_cus_list}      Get information of the customer     ${26399.EDIT_CUS}

    Navigate to the Quote Order list

    Click on the "Create a new Quote order" button

    Select a customer      ${cus_list}

    Add an item to the quote order      ${item_list}

    ${ID_QUOTE_ORDER}     Click on the Save button - Quote Order

    Edit the quote order        ${ID_QUOTE_ORDER}

    Select a customer      ${edit_cus_list}

    Click on the Save button - Quote Order

    Store - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${edit_cus_list}    ${item_list}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    Navigate to the Quote Order list

    Central - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${edit_cus_list}    ${item_list}

    Remove a quote order        ${ID_QUOTE_ORDER}

#26749_Verify the user can only Cancel the quote order of which status is "In Use"
#
#    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
#    ...                AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}
#
#    ${item_list}     Get infomation of the item      ${26749.ID_ITEM}
#
#    ${cus_list}      Get information of the customer     ${26749.NAME_CUS}
#
#    Click on the Sales Management Menu
#
#    Click on the Quote Orders menu
#
#    Click on the Create button
#
#    Select a customer      ${cus_list}
#
#    Add an item to the quote order      ${item_list}
#
#    ${ID_QUOTE_ORDER}     Click on the Save button - Quote Order
#
#    Store - Verify the quote order created successfully     ${ID_QUOTE_ORDER}   ${cus_list}    ${item_list}