trigger StatusFilterTrigger on Status_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusFilterHandler.handleAfterDelete(Trigger.old);
    }
}
