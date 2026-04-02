trigger StatusDetailTrigger on Status_Detail__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) StatusDetailHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) StatusDetailHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusDetailHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) StatusDetailHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) StatusDetailHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) StatusDetailHandler.handleAfterDelete(Trigger.old);
    }
}
