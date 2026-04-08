trigger LogisticsNodeTrigger on Logistics_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsNodeHandler.handleAfterDelete(Trigger.old);
    }
}
