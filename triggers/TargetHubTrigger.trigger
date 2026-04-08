trigger TargetHubTrigger on Target_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TargetHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TargetHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TargetHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TargetHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TargetHubHandler.handleAfterDelete(Trigger.old);
    }
}
