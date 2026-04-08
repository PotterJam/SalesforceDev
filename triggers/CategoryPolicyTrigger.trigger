trigger CategoryPolicyTrigger on Category_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CategoryPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CategoryPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CategoryPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CategoryPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
