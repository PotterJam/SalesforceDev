trigger SalesArchiveTrigger on Sales_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SalesArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SalesArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SalesArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SalesArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SalesArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
