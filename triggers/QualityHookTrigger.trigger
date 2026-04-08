trigger QualityHookTrigger on Quality_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityHookHandler.handleAfterDelete(Trigger.old);
    }
}
