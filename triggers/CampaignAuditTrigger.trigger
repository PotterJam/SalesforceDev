trigger CampaignAuditTrigger on Campaign_Audit__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignAuditHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignAuditHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignAuditHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignAuditHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignAuditHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignAuditHandler.handleAfterDelete(Trigger.old);
    }
}
