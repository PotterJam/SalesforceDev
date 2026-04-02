trigger QuotaFlowTrigger on Quota_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaFlowHandler.handleAfterDelete(Trigger.old);
    }
}
