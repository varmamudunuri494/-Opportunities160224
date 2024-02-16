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
    VerifyText         Additional Information
    TypeText           Order Numbe                 1256321
    TypeText           Main Competitor(s)          Ravi Infrastructure of India
    TypeText           Tracking Number             25632145
    PickList           Delivery/Installation Status                            Yet to begin
    VerifyText         Description Information
    TypeText           Description                 Creating a new Opportunity for Varma Industries
    #ClickText         Save                        partial_match=False
    UseModal           Off
    Sleep              3s
