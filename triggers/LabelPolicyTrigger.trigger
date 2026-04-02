trigger LabelPolicyTrigger on Label_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LabelPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LabelPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LabelPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LabelPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LabelPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
