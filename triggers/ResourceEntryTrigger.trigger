trigger ResourceEntryTrigger on Resource_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ResourceEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ResourceEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ResourceEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ResourceEntryHandler.handleAfterDelete(Trigger.old);
    }
}
