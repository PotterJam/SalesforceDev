trigger MarketingStageTrigger on Marketing_Stage__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) MarketingStageHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingStageHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingStageHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) MarketingStageHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) MarketingStageHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) MarketingStageHandler.handleAfterDelete(Trigger.old);
    }
}
