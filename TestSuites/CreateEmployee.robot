*** Settings ***
Resource   ../Resources/Env_Variables.robot

Variables  ../Data/GlobalData.yaml
Variables  ../Data/EmployeeData.yaml

Test Setup            Run Keywords    Open the browser and go to the admin page   ${URL}   ${BROWSER}
...                   AND     The user logins to the system    ${USER_TENANT}   ${PASSWORD}

Test Teardown         Close All Browsers

*** Test Cases ***
1_Create a new employee with type is store employee successfully

    [Documentation]   Create a new employee with type is store employee successfully.

    [Teardown]    Close All Browsers

    Employee - Navigate to the Employee list

    Employee - Create a new employee with type is store employee    ${1.CODE}   ${1.NAME}   ${1.USER_ACCOUNT}  ${1.BIRTH_DAY}   ${1.PHONE_NUMBER}   ${1.EMAIL}   ${1.COUNTRY}    ${1.CITY}    ${1.STATE}  ${1.WARD}  ${1.ADDRESS}

    Employee - Click on the Save button
