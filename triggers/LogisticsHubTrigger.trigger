trigger LogisticsHubTrigger on Logistics_Hub__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsHubHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsHubHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsHubHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsHubHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsHubHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsHubHandler.handleAfterDelete(Trigger.old);
    }
}
