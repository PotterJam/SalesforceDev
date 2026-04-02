trigger OpportunityCacheTrigger on Opportunity_Cache__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) OpportunityCacheHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityCacheHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityCacheHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) OpportunityCacheHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) OpportunityCacheHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) OpportunityCacheHandler.handleAfterDelete(Trigger.old);
    }
}
