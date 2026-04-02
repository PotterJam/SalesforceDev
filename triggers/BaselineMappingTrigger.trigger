trigger BaselineMappingTrigger on Baseline_Mapping__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) BaselineMappingHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineMappingHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineMappingHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) BaselineMappingHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) BaselineMappingHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) BaselineMappingHandler.handleAfterDelete(Trigger.old);
    }
}
