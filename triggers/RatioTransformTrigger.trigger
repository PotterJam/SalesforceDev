trigger RatioTransformTrigger on Ratio_Transform__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatioTransformHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTransformHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTransformHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatioTransformHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatioTransformHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatioTransformHandler.handleAfterDelete(Trigger.old);
    }
}
