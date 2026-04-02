trigger RatioActionTrigger on Ratio_Action__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioActionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioActionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioActionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioActionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioActionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioActionHandler.handleAfterDelete(Trigger.old);
    }
}
