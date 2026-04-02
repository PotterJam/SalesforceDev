trigger LeadConnectorTrigger on Lead_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LeadConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LeadConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LeadConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LeadConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LeadConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
