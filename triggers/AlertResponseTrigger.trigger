trigger AlertResponseTrigger on Alert_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertResponseHandler.handleAfterDelete(Trigger.old);
    }
}
