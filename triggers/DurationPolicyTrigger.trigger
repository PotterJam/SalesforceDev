trigger DurationPolicyTrigger on Duration_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) DurationPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) DurationPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) DurationPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) DurationPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) DurationPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
