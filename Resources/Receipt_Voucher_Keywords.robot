*** Settings ***
Variables   ../Locators/Common_Locators.py
Variables   ../Locators/Receipt_Voucher_Locators.py
Variables   ../Data/ReceiptVoucherData.yaml

Resource    Common_Keywords.robot

*** Keywords ***

Receipt Voucher - Navigate to the "received-payment voucher list" page

    Menu - Click on the Finance Management menu

    Menu - Click on the Received - Payment Cash menu

    Wait Until Page Contains Element    ${received_payment_table_row}    ${TIMEOUT}

Receipt Voucher - Navigate to the "create new Receipt Voucher" page

    Wait Until Page Contains Element    ${received_payment_btn_create_bill_reveived}   ${TIMEOUT}
    
    Common - Click on an element    ${received_payment_btn_create_bill_reveived}
    
    Wait Until Page Contains Element    ${received_tle_create}   ${TIMEOUT}

Receipt Voucher - Choose the method for the Receipt Voucher

    [Arguments]   ${received_method}

    [Return]   ${received_method}

    Wait Until Page Contains Element    ${received_rad_method.replace('received_method','${received_method}')}   ${TIMEOUT}

    Common - Click on an element    ${received_rad_method.replace('received_method','${received_method}')}

Receipt Voucher - Choose Received type for the Receipt Voucher

    [Arguments]   ${received_type}

    [Return]   ${received_type}

    Common - Choose a value from combobox    ${received_cbx_receive_type}    ${received_cbx_input_receive_type.replace('received_type','${received_type}')}

Receipt Voucher - Input object name for the Receipt Voucher

    [Return]   ${object_name}

    ${object_name}   Generate Random String   9   [NUMBERS]

    Wait Until Page Contains Element    ${received_txt_object}   ${TIMEOUT}

    Common - Input text to element    ${received_txt_object}    ${object_name}

Receipt Voucher - Input amount for the Receipt Voucher

    [Return]   ${amount}

    ${amount}   Generate Random String   7   123456789
    
    Wait Until Page Contains Element    ${received_txt_amount_click}   ${TIMEOUT}

    Common - Click on an element   ${received_txt_amount_click}

    Common - Press a key on the keyboard    ${received_txt_amount_input}    CTRL+A+BACKSPACE

    Common - Input text to element    ${received_txt_amount_input}    ${amount}

Receipt Voucher - Input code for the Receipt Voucher

    [Return]   ${code}

    ${text}   Set Variable   Bill_Received

    ${number}   Generate Random String   6   0123456

    ${code}     Set Variable   ${text}${number}

    Wait Until Page Contains Element    ${received_txt_code}   ${TIMEOUT}

    Common - Press a key on the keyboard    ${received_txt_code}    CTRL+A+BACKSPACE

    Common - Input text to element    ${received_txt_code}    ${code}

Receipt Voucher - Input note for the Receipt Voucher

    [Return]   ${note}

    ${note}   Generate Random String   30   [LETTERS]

    Wait Until Page Contains Element    ${received_txt_note}   ${TIMEOUT}

    Common - Press a key on the keyboard    ${received_txt_note}    CTRL+A+BACKSPACE

    Common - Input text to element    ${received_txt_note}    ${note}

Receipt Voucher - Click on the "Save" button to create a Receipt Voucher

    Common - Click on an element    ${received_btn_save}

    Wait Until Page Contains Element    ${received_message_locator}   ${TIMEOUT}
    
    Wait Until Page Contains Element    ${data_table_row}   ${TIMEOUT}

Receipt Voucher - Verify the Receipt Voucher is created successfully when filiing all fields with the received type is "other receipt"

    [Arguments]   ${input_received_method}   ${input_eceived_type}   ${input_received_code}   ${input_received_object}   ${input_received_note}

    Common - Search data    ${input_received_code}

    Wait Until Page Contains Element    ${received_payment_table_code.replace('bill_code','${input_received_code}')}   ${TIMEOUT}

    Common - Click on an element    ${received_payment_table_code.replace('bill_code','${input_received_code}')}

    # Get data on the view detail Receipt Voucher page
    
    Wait Until Page Contains Element    ${view_received_label.replace('number','1')}   ${TIMEOUT}

    ${detail_received_method}   Common - Get text an element    ${view_received_label.replace('number','1')}

    ${detail_received_type}   Common - Get text an element    ${view_received_label.replace('number','2')}

#    ${detail_received_amount1}   Common - Get text an element    ${view_received_label.replace('number','4')}
#
#    ${detail_received_amount2}   Remove String    ¤

    ${detail_received_code}   Common - Get text an element    ${view_received_label.replace('number','6')}

    ${detail_received_object}   Common - Get text an element    ${view_received_label.replace('number','7')}

    ${detail_received_note}   Common - Get text an element    ${view_received_label.replace('number','9')}

    Should Be Equal    ${detail_received_method}    ${input_received_method}

    Should Be Equal    ${detail_received_type}    ${input_eceived_type}

#    Should Be Equal    ${detail_received_amount2}    ${input_received_amount2}

    Should Be Equal    ${detail_received_code}    ${input_received_code}

    Should Be Equal    ${detail_received_object}    ${input_received_object}

    Should Be Equal    ${detail_received_note}    ${input_received_note}
    
    Common - Click on an element    ${homepage_menu_received_payment_management}
    
    Wait Until Page Contains Element    ${data_table_row}   ${TIMEOUT}

Receipt Voucher - Verify the Receipt Voucher is created successfully when filiing all required fields with the received type is "other receipt"

    [Arguments]   ${input_received_method}   ${input_eceived_type}   ${input_received_code}   ${input_received_object}

    Common - Search data    ${input_received_code}

    Wait Until Page Contains Element    ${received_payment_table_code.replace('bill_code','${input_received_code}')}   ${TIMEOUT}

    Common - Click on an element    ${received_payment_table_code.replace('bill_code','${input_received_code}')}

    # Get data on the view detail Receipt Voucher page

    Wait Until Page Contains Element    ${view_received_label.replace('number','1')}   ${TIMEOUT}

    ${detail_received_method}   Common - Get text an element    ${view_received_label.replace('number','1')}

    ${detail_received_type}   Common - Get text an element    ${view_received_label.replace('number','2')}

#    ${detail_received_amount1}   Common - Get text an element    ${view_received_label.replace('number','4')}
#
#    ${detail_received_amount2}   Remove String    ¤

    ${detail_received_code}   Common - Get text an element    ${view_received_label.replace('number','6')}

    ${detail_received_object}   Common - Get text an element    ${view_received_label.replace('number','7')}

    Should Be Equal    ${detail_received_method}    ${input_received_method}

    Should Be Equal    ${detail_received_type}    ${input_eceived_type}

#    Should Be Equal    ${detail_received_amount2}    ${input_received_amount2}

    Should Be Equal    ${detail_received_code}    ${input_received_code}

    Should Be Equal    ${detail_received_object}    ${input_received_object}

    Common - Click on an element    ${homepage_menu_received_payment_management}

    Wait Until Page Contains Element    ${data_table_row}   ${TIMEOUT}