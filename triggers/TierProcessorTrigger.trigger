trigger TierProcessorTrigger on Tier_Processor__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TierProcessorHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TierProcessorHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierProcessorHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TierProcessorHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TierProcessorHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TierProcessorHandler.handleAfterDelete(Trigger.old);
    }
}
