trigger SupportControllerTrigger on Support_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SupportControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SupportControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SupportControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SupportControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SupportControllerHandler.handleAfterDelete(Trigger.old);
    }
}
