trigger LogisticsManagerTrigger on Logistics_Manager__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsManagerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsManagerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsManagerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsManagerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsManagerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsManagerHandler.handleAfterDelete(Trigger.old);
    }
}
