*** Settings ***
Resource   ../Resources/Env_Variables.robot
Variables  ../Data/GlobalData.yaml


Test Setup          Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                 AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

Test Teardown       Run Keywords     Close All Browsers

*** Test Cases ***
32330_Create a new Payment Voucher with the type is "other pay" and the "cash" method successfully when filling all fields

    [Tags]   32330
    
    Payment Voucher - Navigate to the "received-payment voucher list" page
    
    Payment Voucher - Navigate to the "create new Payment Voucher" page
    
    ${payment_method}   Payment Voucher - Choose the method for the Payment Voucher    ${32330.data_payment_method}
    
    ${type}             Payment Voucher - Choose payment type for the Payment Voucher    ${32330.data_payment_type}

    ${object_name}      Payment Voucher - Input object name for the Payment Voucher

    ${amount}           Payment Voucher - Input amount for the Payment Voucher

    ${code}             Payment Voucher - Input code for the Payment Voucher

    ${reason}           Payment Voucher - Choose reason for the Payment Voucher   ${32330.data_payment_reason}

    ${note}             Payment Voucher - Input note for the Payment Voucher

    Payment Voucher - Click on the "Save" button to create a Payment Voucher

    Payment Voucher - Verify the Payment Voucher is created successfully when filiing all fields with the type is "other pay"    ${payment_method}    ${type}    ${amount}    ${reason}    ${code}    ${object_name}    ${note}

32331_Create a new Payment Voucher with the type is "other pay" and the "cash" method successfully when filling all required fields

    [Tags]   32331

    Payment Voucher - Navigate to the "received-payment voucher list" page

    Payment Voucher - Navigate to the "create new Payment Voucher" page

    ${payment_method}   Payment Voucher - Choose the method for the Payment Voucher    ${32331.data_payment_method}

    ${type}             Payment Voucher - Choose payment type for the Payment Voucher    ${32331.data_payment_type}

    ${object_name}      Payment Voucher - Input object name for the Payment Voucher

    ${amount}           Payment Voucher - Input amount for the Payment Voucher

    ${code}             Payment Voucher - Input code for the Payment Voucher

    ${reason}           Payment Voucher - Choose reason for the Payment Voucher   ${32331.data_payment_reason}

    ${note}             Payment Voucher - Input note for the Payment Voucher

    Payment Voucher - Click on the "Save" button to create a Payment Voucher

    Payment Voucher - Verify the Payment Voucher is created successfully when filiing all required fields with the type is "other pay"    ${payment_method}    ${type}    ${amount}    ${code}    ${object_name}

32332_Create a new Payment Voucher with the type is "other pay" and the "transfer" method successfully when filling all fields

    [Tags]   32332

    Payment Voucher - Navigate to the "received-payment voucher list" page

    Payment Voucher - Navigate to the "create new Payment Voucher" page

    ${payment_method}   Payment Voucher - Choose the method for the Payment Voucher    ${32332.data_payment_method}

    ${type}             Payment Voucher - Choose payment type for the Payment Voucher    ${32332.data_payment_type}

    ${object_name}      Payment Voucher - Input object name for the Payment Voucher

    ${amount}           Payment Voucher - Input amount for the Payment Voucher

    ${code}             Payment Voucher - Input code for the Payment Voucher

    ${reason}           Payment Voucher - Choose reason for the Payment Voucher   ${32332.data_payment_reason}

    ${note}             Payment Voucher - Input note for the Payment Voucher

    Payment Voucher - Click on the "Save" button to create a Payment Voucher

    Payment Voucher - Verify the Payment Voucher is created successfully when filiing all fields with the type is "other pay"    ${payment_method}    ${type}    ${amount}    ${reason}    ${code}    ${object_name}    ${note}

32333_Create a new Payment Voucher with the type is "other pay" and the "transfer" method successfully when filling all required fields

    [Tags]   32333

    Payment Voucher - Navigate to the "received-payment voucher list" page

    Payment Voucher - Navigate to the "create new Payment Voucher" page

    ${payment_method}   Payment Voucher - Choose the method for the Payment Voucher    ${32333.data_payment_method}

    ${type}             Payment Voucher - Choose payment type for the Payment Voucher    ${32333.data_payment_type}

    ${object_name}      Payment Voucher - Input object name for the Payment Voucher

    ${amount}           Payment Voucher - Input amount for the Payment Voucher

    ${code}             Payment Voucher - Input code for the Payment Voucher

    ${reason}           Payment Voucher - Choose reason for the Payment Voucher   ${32333.data_payment_reason}

    ${note}             Payment Voucher - Input note for the Payment Voucher

    Payment Voucher - Click on the "Save" button to create a Payment Voucher

    Payment Voucher - Verify the Payment Voucher is created successfully when filiing all required fields with the type is "other pay"    ${payment_method}    ${type}    ${amount}    ${code}    ${object_name}

#32409_Create a new payment voucher with the type is "Payment for the purchase order for the supplier" and the "cash" method successfully when filling all fields
#
#    [Setup]            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
#    ...                AND     The user logins to the system    ${USER_STORE}   ${PASSWORD}
#
#    [Tags]   32409
#
#    # Create a new PO
#    PO-Navigate to the Purchase Order list
#    ${list_item}=  Create List  ${13828.data_product1}  ${13828.data_product2}
#    ${13828.data_po_number}  ${total}  PO-Create a new PO has full details  ${13828}   ${list_item}
#    log  ${total}
#    log  ${13828.data_po_number}
#    PO-Change status of PO to  ${13828.data_po_status_update}  ${13828.data_po_number}

#    Payment Voucher - Navigate to the "received-payment voucher list" page
#
#    Payment Voucher - Navigate to the "create new Payment Voucher" page
#
#    ${payment_method}   Payment Voucher - Choose the method for the Payment Voucher    ${32409.data_payment_method}
#
#    ${type}             Payment Voucher - Choose payment type for the Payment Voucher    ${32409.data_payment_type}
#
#    ${transaction}
#
#    ${code}             Payment Voucher - Input code for the Payment Voucher
#
#    ${reason}           Payment Voucher - Choose reason for the Payment Voucher   ${32409.data_payment_reason}
#
#    ${note}             Payment Voucher - Input note for the Payment Voucher
#
#    Payment Voucher - Click on the "Save" button to create a Payment Voucher
#
#    Payment Voucher - Verify the Payment Voucher is created successfully when filiing all fields with the type is "other pay"    ${payment_method}    ${type}    ${amount}    ${reason}    ${code}    ${object_name}    ${note}
