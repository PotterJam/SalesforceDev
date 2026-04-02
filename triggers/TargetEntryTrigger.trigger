trigger TargetEntryTrigger on Target_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetEntryHandler.handleAfterDelete(Trigger.old);
    }
}
