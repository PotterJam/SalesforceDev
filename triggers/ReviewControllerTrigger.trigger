trigger ReviewControllerTrigger on Review_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewControllerHandler.handleAfterDelete(Trigger.old);
    }
}
