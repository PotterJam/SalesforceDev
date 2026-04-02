trigger DeliverableStoreTrigger on Deliverable_Store__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableStoreHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableStoreHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableStoreHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableStoreHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableStoreHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableStoreHandler.handleAfterDelete(Trigger.old);
    }
}
