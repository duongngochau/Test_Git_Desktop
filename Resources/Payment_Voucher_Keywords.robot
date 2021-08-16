*** Settings ***
Variables   ../Locators/Common_Locators.py
Variables   ../Locators/Payment_Voucher_Locators.py
Variables   ../Data/PaymentVoucherData.yaml

Resource    Common_Keywords.robot
Library    String

*** Keywords ***

Payment Voucher - Navigate to the "received-payment voucher list" page

    Menu - Click on the Finance Management menu

    Menu - Click on the Received - Payment Cash menu

    Wait Until Page Contains Element    ${data_table_row}    ${TIMEOUT}

Payment Voucher - Navigate to the "create new Payment Voucher" page

    Wait Until Page Contains Element    ${received_payment_btn_create_bill_payment}   ${TIMEOUT}

    Common - Click on an element    ${received_payment_btn_create_bill_payment}

    Wait Until Page Contains Element    ${payment_tle}   ${TIMEOUT}

Payment Voucher - Choose the method for the Payment Voucher

    [Arguments]   ${payment_method}

    [Return]   ${payment_method}

    Wait Until Page Contains Element    ${payment_rad_method.replace('payment_method','${payment_method}')}   ${TIMEOUT}

    Common - Click on an element    ${payment_rad_method.replace('payment_method','${payment_method}')}

Payment Voucher - Choose payment type for the Payment Voucher

    [Arguments]   ${payment_type}

    [Return]   ${payment_type}

    Common - Choose a value from combobox    ${payment_cbx_type}    ${payment_cbx_input_type.replace('payment_type','${payment_type}')}

Payment Voucher - Input object name for the Payment Voucher

    [Return]   ${object_name}

    ${object_name}    Generate Random String   15   [LETTERS]

    Wait Until Page Contains Element    ${payment_txt_object}   ${TIMEOUT}

    Common - Input text to element    ${payment_txt_object}    ${object_name}

Payment Voucher - Input amount for the Payment Voucher

    [Return]   ${amount}

    ${random_number}   Generate Random String   5   123456789

    Wait Until Page Contains Element    ${payment_txt_amount_click}   ${TIMEOUT}

    Common - Click on an element    ${payment_txt_amount_click}

    Common - Press a key on the keyboard    ${payment_txt_amount_input}    CTRL+A+BACKSPACE

    Common - Input text to element    ${payment_txt_amount_input}    ${random_number}

    ${amount}    Common - Currency format    ${random_number}

Payment Voucher - Input code for the Payment Voucher

    [Return]   ${code}

    ${number}       Generate Random String    7    [NUMBERS]

    ${code}         Set Variable    BillPayment${number}

    Wait Until Page Contains Element    ${payment_txt_code}   ${TIMEOUT}

    Common - Input text to element    ${payment_txt_code}    ${code}

Payment Voucher - Choose reason for the Payment Voucher

    [Arguments]   ${reason}

    [Return]   ${reason}

    Common - Choose a value from combobox    ${payment_cbx_reason_click}    ${payment_cbx_reason_input.replace('reason','${reason}')}

Payment Voucher - Input note for the Payment Voucher

    [Return]   ${note}

    ${note}   Generate Random String   30   [LETTERS]

    Wait Until Page Contains Element    ${payment_txt_note}   ${TIMEOUT}

    Common - Input text to element    ${payment_txt_note}    ${note}

Payment Voucher - Click on the "Save" button to create a Payment Voucher

    Common - Click on an element    ${payment_btn_save}

    Wait Until Page Contains Element    ${payment_message_locator}   ${TIMEOUT}

    Wait Until Page Contains Element    ${data_table_row}   ${TIMEOUT}

Payment Voucher - Choose transaction for the payment voucher

    [Arguments]   ${transaction}

    Common - Choose a value from combobox    ${payment_cbx_transaction_click}    ${payment_cbx_transaction_input.replace('transaction','${transaction}')}

Payment Voucher - Verify the Payment Voucher is created successfully when filiing all fields with the type is "other pay"

    [Arguments]   ${create_payment_method}   ${create_payment_type}   ${create_payment_amount}   ${create_payment_reason}   ${create_payment_code}   ${create_payment_object}   ${create_payment_note}

    Common - Search data    ${create_payment_code}

    Wait Until Page Contains Element    ${payment_table_code.replace('bill_code','${create_payment_code}')}   ${TIMEOUT}

    Common - Click on an element    ${payment_table_code.replace('bill_code','${create_payment_code}')}

    # Get data on the view detail Payment Voucher page

    Wait Until Page Contains Element    ${payment_detail_code.replace('number','1')}   ${TIMEOUT}

    ${detail_payment_method}    Common - Get text an element        ${payment_detail_code.replace('number','1')}

    ${detail_payment_type}      Common - Get text an element        ${payment_detail_code.replace('number','2')}

    ${detail_payment_amount}    Common - Get text an element        ${payment_detail_code.replace('number','4')}

    ${detail_payment_reason}    Common - Get text an element        ${payment_detail_code.replace('number','5')}

    ${detail_payment_code}      Common - Get text an element        ${payment_detail_code.replace('number','7')}

    ${detail_payment_object}    Common - Get text an element        ${payment_detail_code.replace('number','8')}

    ${detail_payment_note}      Common - Get text an element        ${payment_detail_code.replace('number','10')}

    Should Be Equal    ${detail_payment_method}     ${create_payment_method}

    Should Be Equal    ${detail_payment_type}       ${create_payment_type}

    Should Be Equal    ${detail_payment_amount}     ${create_payment_amount}

    Should Be Equal    ${detail_payment_reason}     ${create_payment_reason}

    Should Be Equal    ${detail_payment_code}       ${create_payment_code}

    Should Be Equal    ${detail_payment_object}     ${create_payment_object}

    Should Be Equal    ${detail_payment_note}       ${create_payment_note}

    Common - Click on an element    ${homepage_menu_received_payment_management}

    Wait Until Page Contains Element    ${data_table_row}   ${TIMEOUT}

Payment Voucher - Verify the Payment Voucher is created successfully when filiing all required fields with the type is "other pay"

    [Arguments]   ${create_payment_method}   ${create_payment_type}   ${create_payment_amount}   ${create_payment_code}   ${create_payment_object}

    Common - Search data    ${create_payment_code}

    Wait Until Page Contains Element    ${payment_table_code.replace('bill_code','${create_payment_code}')}   ${TIMEOUT}

    Common - Click on an element    ${payment_table_code.replace('bill_code','${create_payment_code}')}

    # Get data on the view detail Payment Voucher page

    Wait Until Page Contains Element    ${payment_detail_code.replace('number','1')}   ${TIMEOUT}

    ${detail_payment_method}    Common - Get text an element        ${payment_detail_code.replace('number','1')}

    ${detail_payment_type}      Common - Get text an element        ${payment_detail_code.replace('number','2')}

    ${detail_payment_amount}    Common - Get text an element        ${payment_detail_code.replace('number','4')}

    ${detail_payment_code}      Common - Get text an element        ${payment_detail_code.replace('number','7')}

    ${detail_payment_object}    Common - Get text an element        ${payment_detail_code.replace('number','8')}

    Should Be Equal    ${detail_payment_method}     ${create_payment_method}

    Should Be Equal    ${detail_payment_type}       ${create_payment_type}

    Should Be Equal    ${detail_payment_amount}     ${create_payment_amount}

    Should Be Equal    ${detail_payment_code}       ${create_payment_code}

    Should Be Equal    ${detail_payment_object}     ${create_payment_object}

    Common - Click on an element    ${homepage_menu_received_payment_management}

    Wait Until Page Contains Element    ${data_table_row}   ${TIMEOUT}