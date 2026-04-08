trigger CommissionConfigTrigger on Commission_Config__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionConfigHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionConfigHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionConfigHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionConfigHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionConfigHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionConfigHandler.handleAfterDelete(Trigger.old);
    }
}
