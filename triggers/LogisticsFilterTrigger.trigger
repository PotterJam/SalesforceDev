trigger LogisticsFilterTrigger on Logistics_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsFilterHandler.handleAfterDelete(Trigger.old);
    }
}
