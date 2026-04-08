trigger IndexResponseTrigger on Index_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexResponseHandler.handleAfterDelete(Trigger.old);
    }
}
