trigger QuotaNodeTrigger on Quota_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) QuotaNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) QuotaNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) QuotaNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) QuotaNodeHandler.handleAfterDelete(Trigger.old);
    }
}
