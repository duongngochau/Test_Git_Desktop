*** Settings ***
Resource   ../Resources/Env_Variables.robot
Variables  ../Data/GlobalData.yaml


Test Setup          Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                 AND     The user logins to the system    ${USER_STORE2}   ${PASSWORD}

Test Teardown       Run Keywords     Close All Browsers

*** Test Cases ***

30383_Create a new Receipt Voucher with the received type is "other receipt" and the "cash" method successfully when filling all fields

    [Tags]   30383
    
    Receipt Voucher - Navigate to the "received-payment voucher list" page
    
    Receipt Voucher - Navigate to the "create new Receipt Voucher" page
    
    ${received_method}  Receipt Voucher - Choose the method for the Receipt Voucher    ${30383.data_received_method}
    
    ${received_type}    Receipt Voucher - Choose Received type for the Receipt Voucher    ${30383.data_received_type}

    ${object_name}      Receipt Voucher - Input object name for the Receipt Voucher

    ${amount}   Receipt Voucher - Input amount for the Receipt Voucher

    ${code}     Receipt Voucher - Input code for the Receipt Voucher

    ${note}     Receipt Voucher - Input note for the Receipt Voucher

    Receipt Voucher - Click on the "Save" button to create a Receipt Voucher

    Receipt Voucher - Verify the Receipt Voucher is created successfully when filiing all fields with the received type is "other receipt"    ${received_method}    ${received_type}    ${code}    ${object_name}    ${note}

30384_Create a new Receipt Voucher with the received type is "other receipt" and the "cash" method successfully when filling all required fields

    [Tags]   30384

    Receipt Voucher - Navigate to the "received-payment voucher list" page

    Receipt Voucher - Navigate to the "create new Receipt Voucher" page

    ${received_method}  Receipt Voucher - Choose the method for the Receipt Voucher    ${30383.data_received_method}

    ${received_type}    Receipt Voucher - Choose Received type for the Receipt Voucher    ${30383.data_received_type}

    ${object_name}      Receipt Voucher - Input object name for the Receipt Voucher

    ${amount}   Receipt Voucher - Input amount for the Receipt Voucher

    ${code}     Receipt Voucher - Input code for the Receipt Voucher

    Receipt Voucher - Click on the "Save" button to create a Receipt Voucher

    Receipt Voucher - Verify the Receipt Voucher is created successfully when filiing all required fields with the received type is "other receipt"    ${received_method}    ${received_type}    ${code}    ${object_name}

30385_Create a new Receipt Voucher with the received type is "other receipt" and the "transfer" method successfully when filling all fields

    [Tags]   30385

    Receipt Voucher - Navigate to the "received-payment voucher list" page

    Receipt Voucher - Navigate to the "create new Receipt Voucher" page

    ${received_method}  Receipt Voucher - Choose the method for the Receipt Voucher    ${30385.data_received_method}

    ${received_type}    Receipt Voucher - Choose Received type for the Receipt Voucher    ${30385.data_received_type}

    ${object_name}      Receipt Voucher - Input object name for the Receipt Voucher

    ${amount}   Receipt Voucher - Input amount for the Receipt Voucher

    ${code}     Receipt Voucher - Input code for the Receipt Voucher

    ${note}     Receipt Voucher - Input note for the Receipt Voucher

    Receipt Voucher - Click on the "Save" button to create a Receipt Voucher

    Receipt Voucher - Verify the Receipt Voucher is created successfully when filiing all fields with the received type is "other receipt"    ${received_method}    ${received_type}    ${code}    ${object_name}    ${note}

30386_Create a new Receipt Voucher with the received type is "other receipt" and the "transfer" method successfully when filling all required fields

    [Tags]   30386

    Receipt Voucher - Navigate to the "received-payment voucher list" page

    Receipt Voucher - Navigate to the "create new Receipt Voucher" page

    ${received_method}  Receipt Voucher - Choose the method for the Receipt Voucher    ${30386.data_received_method}

    ${received_type}    Receipt Voucher - Choose Received type for the Receipt Voucher    ${30386.data_received_type}

    ${object_name}      Receipt Voucher - Input object name for the Receipt Voucher

    ${amount}   Receipt Voucher - Input amount for the Receipt Voucher

    ${code}     Receipt Voucher - Input code for the Receipt Voucher

    Receipt Voucher - Click on the "Save" button to create a Receipt Voucher

    Receipt Voucher - Verify the Receipt Voucher is created successfully when filiing all required fields with the received type is "other receipt"    ${received_method}    ${received_type}    ${code}    ${object_name}

