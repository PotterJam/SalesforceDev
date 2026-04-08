trigger OrderConnectorTrigger on Order_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OrderConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OrderConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OrderConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OrderConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OrderConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
