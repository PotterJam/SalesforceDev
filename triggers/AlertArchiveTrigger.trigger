trigger AlertArchiveTrigger on Alert_Archive__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertArchiveHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertArchiveHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertArchiveHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertArchiveHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertArchiveHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertArchiveHandler.handleAfterDelete(Trigger.old);
    }
}
