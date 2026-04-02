trigger LogisticsFlowTrigger on Logistics_Flow__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) LogisticsFlowHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsFlowHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsFlowHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) LogisticsFlowHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) LogisticsFlowHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) LogisticsFlowHandler.handleAfterDelete(Trigger.old);
    }
}
