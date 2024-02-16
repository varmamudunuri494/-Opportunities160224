*** Settings ***
Documentation          New test suite
Library                QForce                      #This library is build for Saleforce. # It is a extension of QWeb
Library                String
Library                DateTime
Suite Setup            Open Browser                about:blank                 chrome
Suite Teardown         Close All Browsers
Resource               ../OpportunitiesCommonResources/OpportunitiesComResou.robot

*** Test Cases ***
Creating a new Opportunities
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
