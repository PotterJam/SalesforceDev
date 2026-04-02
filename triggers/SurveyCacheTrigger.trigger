trigger SurveyCacheTrigger on Survey_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) SurveyCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) SurveyCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) SurveyCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) SurveyCacheHandler.handleAfterDelete(Trigger.old);
    }
}
