trigger DeliverableManagerTrigger on Deliverable_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableManagerHandler.handleAfterDelete(Trigger.old);
    }
}
