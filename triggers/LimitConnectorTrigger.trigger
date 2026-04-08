trigger LimitConnectorTrigger on Limit_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LimitConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LimitConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LimitConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LimitConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LimitConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
