trigger IndexControllerTrigger on Index_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexControllerHandler.handleAfterDelete(Trigger.old);
    }
}
