*** Settings ***
Documentation          New test suite
Library                QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library                String
Library                DateTime
Suite Setup            Open Browser                about:blank                 chrome
Suite Teardown         Close All Browsers
Resource               ../OpportunitiesCommonResources/OpportunitiesComResou.robot

*** Test Cases ***
Creating a New Opportunity
    [Tags]             Opportunities
    [Documentation]    Creating a new Opportunities
    Appstate           Home
    LaunchApp          Sales
    ClickText          Opportunities
    ClickText          New
    UseModal           On
    TypeText           Amount                      50000
    TypeText           *Opportunity Name           Varma Industries
    PickList           Type                        New Customer
    PickList           Lead Source                 Web
    PickList           *Opportunity Currency       CAD - Canadian Dollar
    TypeText           radius                      5
    TypeText           height                      10
    PickList           *Stage                      Prospecting
    ClickCheckbox      //div[@class\='slds-form-element__control slds-grow']//input[@name\='IsPrivate']    on
    TypeText           *Close Date                 17/10/2024
    ComboBox           Search Accounts...          Burlington Textiles Corp of America
    #ClickText         Search Accounts...
    #ClickText         New Account                 anchor=Recent Accounts
    #UseModal          On
    #UseModal          Off
    VerifyText         Additional Information
    TypeText           Order Numbe                 1256321
    TypeText           Main Competitor(s)          Ravi Infrastructure of India
    TypeText           Tracking Number             25632145
    PickList           Delivery/Installation Status                            Yet to begin
    VerifyText         Description Information
    TypeText           Description                 Creating a new Opportunity for Varma Industries
    ClickText          Save                        partial_match=False
    UseModal           Off
    Sleep              3s

Editing the Existing Record
    [Tags]             Edit the New Opportunities
    [Documentation]    Editing the Varma Industries Opportunity
    Appstate           Home
    LaunchApp          Sales
    ClickText          Opportunities
    ClickText          Select a List View: All Opportunities
    TypeText           //div[@class\='slds-form-element__control slds-grow slds-input-has-icon slds-input-has-icon_left-right']//input[@class\='slds-input']    Varma Industries\n
    ClickText          Varma Industries
    ClickText          Details
    ClickText          Edit Next Step
    TypeText           //div[@class\='slds-form-element__control slds-grow']//input[@name\='TrackingNumber__c']    2563214567
    TypeText           //div[@class\='slds-form-element__control slds-grow']//input[@name\='NextStep']    Need to submit to next approver
    ${ContactName}=    GetText                     //div[@class\='outputLookupContainer slds-grid forceOutputLookupWithPreview']//a
    log                ${ContactName}
    ClickText          Save                        partial_match=False
