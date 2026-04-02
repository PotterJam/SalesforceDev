trigger CommissionFilterTrigger on Commission_Filter__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionFilterHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionFilterHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionFilterHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionFilterHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionFilterHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionFilterHandler.handleAfterDelete(Trigger.old);
    }
}
