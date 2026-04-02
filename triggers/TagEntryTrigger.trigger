trigger TagEntryTrigger on Tag_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TagEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TagEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TagEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TagEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TagEntryHandler.handleAfterDelete(Trigger.old);
    }
}
