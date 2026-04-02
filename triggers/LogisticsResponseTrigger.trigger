trigger LogisticsResponseTrigger on Logistics_Response__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsResponseHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsResponseHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsResponseHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsResponseHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsResponseHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsResponseHandler.handleAfterDelete(Trigger.old);
    }
}
