trigger LogisticsRequestTrigger on Logistics_Request__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsRequestHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsRequestHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsRequestHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsRequestHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsRequestHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsRequestHandler.handleAfterDelete(Trigger.old);
    }
}
