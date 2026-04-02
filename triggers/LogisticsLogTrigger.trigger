trigger LogisticsLogTrigger on Logistics_Log__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsLogHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsLogHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsLogHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsLogHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsLogHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsLogHandler.handleAfterDelete(Trigger.old);
    }
}
