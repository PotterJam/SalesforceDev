trigger CommissionNodeTrigger on Commission_Node__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionNodeHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionNodeHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionNodeHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionNodeHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionNodeHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionNodeHandler.handleAfterDelete(Trigger.old);
    }
}
