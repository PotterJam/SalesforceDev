trigger DeliverableDispatchTrigger on Deliverable_Dispatch__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableDispatchHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableDispatchHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableDispatchHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableDispatchHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableDispatchHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableDispatchHandler.handleAfterDelete(Trigger.old);
    }
}
