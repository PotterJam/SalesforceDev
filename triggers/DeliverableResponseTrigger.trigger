trigger DeliverableResponseTrigger on Deliverable_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableResponseHandler.handleAfterDelete(Trigger.old);
    }
}
