trigger DeliverableRequestTrigger on Deliverable_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableRequestHandler.handleAfterDelete(Trigger.old);
    }
}
