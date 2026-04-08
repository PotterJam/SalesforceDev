trigger TrendConfigTrigger on Trend_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) TrendConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) TrendConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) TrendConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) TrendConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) TrendConfigHandler.handleAfterDelete(Trigger.old);
    }
}
