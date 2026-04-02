trigger StatusConnectorTrigger on Status_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
