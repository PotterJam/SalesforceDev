trigger RatioProcessTrigger on Ratio_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioProcessHandler.handleAfterDelete(Trigger.old);
    }
}
