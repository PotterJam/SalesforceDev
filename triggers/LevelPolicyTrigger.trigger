trigger LevelPolicyTrigger on Level_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LevelPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LevelPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LevelPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LevelPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LevelPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
