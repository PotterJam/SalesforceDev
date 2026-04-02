trigger LogisticsControllerTrigger on Logistics_Controller__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsControllerHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsControllerHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsControllerHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsControllerHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsControllerHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsControllerHandler.handleAfterDelete(Trigger.old);
    }
}
