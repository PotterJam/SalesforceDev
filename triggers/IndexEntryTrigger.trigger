trigger IndexEntryTrigger on Index_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) IndexEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) IndexEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) IndexEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) IndexEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) IndexEntryHandler.handleAfterDelete(Trigger.old);
    }
}
