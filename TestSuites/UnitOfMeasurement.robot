*** Settings ***
Resource   ../Resources/Env_Variables.robot

Variables  ../Data/GlobalData.yaml
Variables  ../Data/UnitOfMeasurementData.yaml

Test Setup            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                   AND     The user logins to the system    ${USER_TENANT}   ${PASSWORD}

Test Teardown         Close All Browsers

*** Test Cases ***
27032_Verify the user can be able to create unit successfully

    [Tags]   27032

    [Documentation]   Verify the unit of measurement will create successfully with full information.

    [Teardown]    Run Keywords    UOM - click on the delete button        ${27032.CODE}
    ...           AND  Close All Browsers

    UOM - Navigate to the unit of measurement list

    UOM - Verify the unit of measurement doesn't exist on the UOM list      ${27032.CODE}

    UOM - Create a new unit of measurement     ${27032.CODE}     ${27032.NAME}     ${27032.DESCRIPTION}

    UOM - Verify the success message should be displayed on the page after creating a new unit of measurement        ${27032.NAME}

    UOM - Verify the UOM created successfully after clicking on the Save button    ${27032.CODE}    ${27032.NAME}     ${27032.DESCRIPTION}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_STORE}   ${PASSWORD}

    UOM - Navigate to the unit of measurement list

    UOM - Verify the UOM created successfully after clicking on the Save button    ${27032.CODE}    ${27032.NAME}     ${27032.DESCRIPTION}

27033_Verify the user can be able to update unit successfully

    [Documentation]  Verify the unit of measurement will update successfully with full information.

    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    [Teardown]    Run Keywords    UOM - click on the delete button        ${27033.EDIT_CODE}
    ...           AND  Close All Browsers

    UOM - Navigate to the unit of measurement list

    UOM - Verify the unit of measurement doesn't exist on the UOM list      ${27033.CODE}      ${27033.EDIT_CODE}

    UOM - Create a new unit of measurement     ${27033.CODE}     ${27033.NAME}     ${27033.DESCRIPTION}

    UOM - Verify the success message should be displayed on the page after creating a new unit of measurement        ${27033.NAME}

    UOM - Verify the UOM created successfully after clicking on the Save button    ${27033.CODE}    ${27033.NAME}     ${27033.DESCRIPTION}

    UOM - Edit the unit of measurement   ${27033.CODE}     ${27033.EDIT_CODE}     ${27033.EDIT_NAME}    ${27033.EDIT_DESCRIPTION}

    UOM - Verify the success message should be displayed on the page after editing a new unit of measurement        ${27033.EDIT_NAME}

    UOM - Verify the UOM created successfully after clicking on the Save button    ${27033.EDIT_CODE}     ${27033.EDIT_NAME}    ${27033.EDIT_DESCRIPTION}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_STORE}   ${PASSWORD}

    UOM - Navigate to the unit of measurement list

    UOM - Verify the UOM created successfully after clicking on the Save button    ${27033.EDIT_CODE}     ${27033.EDIT_NAME}    ${27033.EDIT_DESCRIPTION}

27034_Cannot create a new unit of measurement with empty code.

    [Documentation]   Verify the Code field will display a warning message when creating a new unit of measurement with empty code.

    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    [Teardown]    Close All Browsers

    UOM - Navigate to the unit of measurement list

    UOM - Create a new unit of measurement    ${EMPTY}     ${27034.NAME}     ${27034.DESCRIPTION}

    UOM - Verify the validation message when creating a new unit of measurement with empty code    ${27034.VALIDATION_MESSAGE}

27035_Cannot create a new unit of measurement with empty name.

    [Documentation]  Verify the Name field will display a warning message when creating a new unit of measurement with empty name.

    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    [Teardown]    Close All Browsers

    UOM - Navigate to the unit of measurement list

    UOM - Create a new unit of measurement    ${27035.CODE}    ${EMPTY}     ${27035.DESCRIPTION}

    UOM - Verify the validation message when creating a new unit of measurement with empty name    ${27035.VALIDATION_MESSAGE}

27036_Cannot create a new unit of measurement with a space into the code field.

    [Documentation]  Verify the Code field will display a warning message when creating a new unit of measurement with a space.

    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    [Teardown]    Close All Browsers

    UOM - Navigate to the unit of measurement list

    UOM - Create a new unit of measurement    ${27036.CODE}    ${27036.NAME}     ${27036.DESCRIPTION}

    UOM - Verify the validation message when creating a new unit of measurement with empty code    ${27036.VALIDATION_MESSAGE}

27037_Cannot create a new unit of measurement with a space into the name field.

    [Documentation]  Verify the Name field will display a warning message when creating a new unit of measurement with a space.

    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}

    [Teardown]    Close All Browsers

    UOM - Navigate to the unit of measurement list

    UOM - Create a new unit of measurement    ${27037.CODE}    ${27037.NAME}     ${27037.DESCRIPTION}

    UOM - Verify the validation message when creating a new unit of measurement with empty name    ${27037.VALIDATION_MESSAGE}