trigger SupportConnectorTrigger on Support_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
