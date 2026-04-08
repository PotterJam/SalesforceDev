trigger TargetHookTrigger on Target_Hook__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetHookHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetHookHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetHookHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetHookHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetHookHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetHookHandler.handleAfterDelete(Trigger.old);
    }
}
