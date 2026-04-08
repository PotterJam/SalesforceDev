trigger LabelQueueTrigger on Label_Queue__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelQueueHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelQueueHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelQueueHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelQueueHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelQueueHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelQueueHandler.handleAfterDelete(Trigger.old);
    }
}
