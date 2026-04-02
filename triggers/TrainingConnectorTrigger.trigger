trigger TrainingConnectorTrigger on Training_Connector__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingConnectorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingConnectorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingConnectorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingConnectorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingConnectorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingConnectorHandler.handleAfterDelete(Trigger.old);
    }
}
