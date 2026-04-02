trigger TagControllerTrigger on Tag_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagControllerHandler.handleAfterDelete(Trigger.old);
    }
}
