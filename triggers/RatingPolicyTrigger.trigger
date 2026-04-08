trigger RatingPolicyTrigger on Rating_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) RatingPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) RatingPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) RatingPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) RatingPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) RatingPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
