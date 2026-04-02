trigger ReviewEntryTrigger on Review_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ReviewEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ReviewEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ReviewEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ReviewEntryHandler.handleAfterDelete(Trigger.old);
    }
}
