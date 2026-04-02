trigger DeliverableEntryTrigger on Deliverable_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableEntryHandler.handleAfterDelete(Trigger.old);
    }
}
