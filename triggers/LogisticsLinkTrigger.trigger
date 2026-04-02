trigger LogisticsLinkTrigger on Logistics_Link__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsLinkHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsLinkHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsLinkHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsLinkHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsLinkHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsLinkHandler.handleAfterDelete(Trigger.old);
    }
}
