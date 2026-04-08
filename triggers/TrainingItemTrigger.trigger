trigger TrainingItemTrigger on Training_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrainingItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrainingItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrainingItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrainingItemHandler.handleAfterDelete(Trigger.old);
    }
}
