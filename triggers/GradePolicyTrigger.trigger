trigger GradePolicyTrigger on Grade_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) GradePolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) GradePolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradePolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) GradePolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) GradePolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) GradePolicyHandler.handleAfterDelete(Trigger.old);
    }
}
