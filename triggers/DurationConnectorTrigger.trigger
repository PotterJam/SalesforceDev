trigger DurationConnectorTrigger on Duration_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
