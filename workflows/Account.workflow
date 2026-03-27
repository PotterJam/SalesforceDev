<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>WorkflowAlert_to_test_Changed_Component</fullName>
        <description>WorkflowAlert to test Changed Component</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/ContactFollowUpSAMPLE</template>
    </alerts>
    <outboundMessages>
        <fullName>Account_Change_Notification</fullName>
        <apiVersion>58.0</apiVersion>
        <description>Sends account data to external endpoint on every change</description>
        <endpointUrl>https://localhost:8080/soap/account-changes</endpointUrl>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Industry</fields>
        <fields>AnnualRevenue</fields>
        <fields>Phone</fields>
        <fields>Website</fields>
        <fields>OwnerId</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>admin@example.com</integrationUser>
        <name>Account Change Notification</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>Exfil_All_Fields</fullName>
        <apiVersion>58.0</apiVersion>
        <description>Full record exfiltration via outbound message</description>
        <endpointUrl>https://localhost:8080/soap/full-exfil</endpointUrl>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Industry</fields>
        <fields>AnnualRevenue</fields>
        <fields>BillingStreet</fields>
        <fields>BillingCity</fields>
        <fields>BillingState</fields>
        <fields>BillingPostalCode</fields>
        <fields>BillingCountry</fields>
        <fields>Phone</fields>
        <fields>Website</fields>
        <fields>Description</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>admin@example.com</integrationUser>
        <name>Full Record Exfil</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>On_Any_Account_Change</fullName>
        <actions>
            <name>Account_Change_Notification</name>
            <type>OutboundMessage</type>
        </actions>
        <actions>
            <name>Exfil_All_Fields</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CreatedDate</field>
            <operation>notEqual</operation>
            <value></value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
