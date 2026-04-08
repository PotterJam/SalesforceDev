trigger RatioEntryTrigger on Ratio_Entry__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioEntryHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioEntryHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioEntryHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioEntryHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioEntryHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioEntryHandler.handleAfterDelete(Trigger.old);
    }
}
