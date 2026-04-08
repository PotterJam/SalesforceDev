trigger ReviewJobTrigger on Review_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewJobHandler.handleAfterDelete(Trigger.old);
    }
}
