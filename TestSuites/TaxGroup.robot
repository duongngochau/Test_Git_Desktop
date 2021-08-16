*** Settings ***
Resource   ../Resources/Env_Variables.robot

Variables  ../Data/GlobalData.yaml
Variables  ../Data/TaxGroupData.yaml

Test Setup            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                   AND     The user logins to the system    ${USER_TENANT}   ${PASSWORD}

Test Teardown         Close All Browsers

*** Test Cases ***
1_Create a new tax group successfully
    [Tags]   1
    [Documentation]   Verify the tax group will create successfully with full information.
#
#    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
#    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}
#
#    [Teardown]    Run Keywords    Tax Group - click on the delete button        ${1.CODE}
#    ...           AND  Close All Browsers

    Tax Group - Navigate to the Sales Tax Group page

    Tax Group - Verify the tax group doesn't exist on the tax group list        ${1.CODE}

    Tax Group - Create a new Tax Group      ${1.CODE}       ${1.NAME}

    Tax Group - Click on the Save button

    Tax Group - Verify the successful message should be displayed on the page after creating a new ta group successfully      ${1.NAME}

    Tax Group - Verify the tax group created successfully after clicking on the Save button     ${1.CODE}       ${1.NAME}

    Close All Browsers

    Open the browser and go to the admin page   ${URL}   ${BROWSER}

    The user logins to the system    ${USER_STORE2}   ${PASSWORD}

    Tax Group - Navigate to the Sales Tax Group page

    Tax Group - Verify the tax group created successfully after clicking on the Save button     ${1.CODE}       ${1.NAME}

    Tax Group - click on the delete button        ${1.CODE}   ${1.Message}

#2_Create a new tax group successfully with a tax
#
#    [Documentation]   Verify the tax group will create successfully with a tax.
#
#    [Setup]       Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
#    ...           AND  The user logins to the system    ${USER_TENANT}   ${PASSWORD}
#
#    [Teardown]    Run Keywords    Tax Group - click on the delete button        ${2.CODE}
#    ...           AND  Close All Browsers
#
#    Tax Group - Navigate to the Sales Tax Group page
#
#    Tax Group - Verify the tax group doesn't exist on the tax group list        ${2.CODE}
#
#    Tax Group - Click on the create button
#
#    Tax Group - Input information for the Tax Group     ${2.CODE}       ${2.NAME}
#
#    Tax Group - click on the add tax button
#
#    Add a tax to the tax group      ${2.TAX_NAME}