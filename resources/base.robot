***Settings***

Library     SeleniumLibrary

Library     libs/db.py

Resource    kws.robot
Resource    hooks.robot
Resource    services.robot

Resource    components/Siderbar.robot
Resource    components/Toaster.robot

Resource    pages/ContractsPage.robot
Resource    pages/CustomersPage.robot
Resource    pages/EquiposPage.robot
Resource    pages/LoginPage.robot

***Variables***
${base_url}     http://zepalheta-web:3000/
${admin_user}   admin@zepalheta.com.br
${admin_pass}   pwd123 