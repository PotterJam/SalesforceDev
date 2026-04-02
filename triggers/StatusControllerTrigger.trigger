trigger StatusControllerTrigger on Status_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusControllerHandler.handleAfterDelete(Trigger.old);
    }
}
