trigger DeliverableServiceTrigger on Deliverable_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableServiceHandler.handleAfterDelete(Trigger.old);
    }
}
