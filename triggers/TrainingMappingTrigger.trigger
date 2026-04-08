trigger TrainingMappingTrigger on Training_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingMappingHandler.handleAfterDelete(Trigger.old);
    }
}
