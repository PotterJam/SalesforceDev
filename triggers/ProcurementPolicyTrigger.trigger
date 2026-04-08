trigger ProcurementPolicyTrigger on Procurement_Policy__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) ProcurementPolicyHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPolicyHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPolicyHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) ProcurementPolicyHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) ProcurementPolicyHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) ProcurementPolicyHandler.handleAfterDelete(Trigger.old);
    }
}
