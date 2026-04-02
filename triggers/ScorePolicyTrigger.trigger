trigger ScorePolicyTrigger on Score_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ScorePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ScorePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ScorePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ScorePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
