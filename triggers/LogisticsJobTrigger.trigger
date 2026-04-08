trigger LogisticsJobTrigger on Logistics_Job__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsJobHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsJobHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsJobHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsJobHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsJobHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsJobHandler.handleAfterDelete(Trigger.old);
    }
}
