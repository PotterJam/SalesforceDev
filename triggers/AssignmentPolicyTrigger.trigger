trigger AssignmentPolicyTrigger on Assignment_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) AssignmentPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) AssignmentPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) AssignmentPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) AssignmentPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
