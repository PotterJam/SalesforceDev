trigger LabelResponseTrigger on Label_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelResponseHandler.handleAfterDelete(Trigger.old);
    }
}
