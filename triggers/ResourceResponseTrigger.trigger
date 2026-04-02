trigger ResourceResponseTrigger on Resource_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceResponseHandler.handleAfterDelete(Trigger.old);
    }
}
