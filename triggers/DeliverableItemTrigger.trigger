trigger DeliverableItemTrigger on Deliverable_Item__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableItemHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableItemHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableItemHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableItemHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableItemHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableItemHandler.handleAfterDelete(Trigger.old);
    }
}
