trigger ProjectPolicyTrigger on Project_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProjectPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProjectPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProjectPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProjectPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
