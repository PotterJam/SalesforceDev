trigger RatioManagerTrigger on Ratio_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioManagerHandler.handleAfterDelete(Trigger.old);
    }
}
