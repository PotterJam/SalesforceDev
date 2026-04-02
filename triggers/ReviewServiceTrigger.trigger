trigger ReviewServiceTrigger on Review_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewServiceHandler.handleAfterDelete(Trigger.old);
    }
}
