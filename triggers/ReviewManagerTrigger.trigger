trigger ReviewManagerTrigger on Review_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewManagerHandler.handleAfterDelete(Trigger.old);
    }
}
