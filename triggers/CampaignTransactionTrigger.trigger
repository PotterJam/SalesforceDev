trigger CampaignTransactionTrigger on Campaign_Transaction__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CampaignTransactionHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTransactionHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTransactionHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CampaignTransactionHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CampaignTransactionHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CampaignTransactionHandler.handleAfterDelete(Trigger.old);
    }
}
