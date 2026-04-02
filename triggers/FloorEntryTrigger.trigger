trigger FloorEntryTrigger on Floor_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) FloorEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) FloorEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) FloorEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) FloorEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) FloorEntryHandler.handleAfterDelete(Trigger.old);
    }
}
