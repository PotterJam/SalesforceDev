trigger TrainingModelTrigger on Training_Model__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingModelHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingModelHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingModelHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingModelHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingModelHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingModelHandler.handleAfterDelete(Trigger.old);
    }
}
