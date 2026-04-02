trigger RatioServiceTrigger on Ratio_Service__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioServiceHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioServiceHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioServiceHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioServiceHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioServiceHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioServiceHandler.handleAfterDelete(Trigger.old);
    }
}
