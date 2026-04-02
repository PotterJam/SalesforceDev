trigger TrainingRegistryTrigger on Training_Registry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingRegistryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRegistryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRegistryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingRegistryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingRegistryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingRegistryHandler.handleAfterDelete(Trigger.old);
    }
}
