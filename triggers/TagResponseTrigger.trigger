trigger TagResponseTrigger on Tag_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagResponseHandler.handleAfterDelete(Trigger.old);
    }
}
