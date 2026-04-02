trigger AlertEntryTrigger on Alert_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AlertEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AlertEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AlertEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AlertEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AlertEntryHandler.handleAfterDelete(Trigger.old);
    }
}
