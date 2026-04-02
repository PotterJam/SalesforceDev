trigger DeliverableArchiveTrigger on Deliverable_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DeliverableArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DeliverableArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DeliverableArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DeliverableArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
