<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <rules>
        <fullName>BrokenValidationRule</fullName>
        <active>true</active>
        <description>Deliberately references a field that does not exist so this workflow rule fails Metadata API validation.</description>
        <formula>ISBLANK(NonExistent_Field__c)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
