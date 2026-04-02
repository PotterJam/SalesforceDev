trigger TierProcessTrigger on Tier_Process__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierProcessHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierProcessHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierProcessHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierProcessHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierProcessHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierProcessHandler.handleAfterDelete(Trigger.old);
    }
}
