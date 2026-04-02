trigger TrendTransformTrigger on Trend_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendTransformHandler.handleAfterDelete(Trigger.old);
    }
}
