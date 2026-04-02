trigger QualityPolicyTrigger on Quality_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QualityPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QualityPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QualityPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QualityPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QualityPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
