trigger CommissionViewTrigger on Commission_View__c (before insert, before update, after insert, after update, before delete, after delete) {
    if (Trigger.isBefore) {
        if (Trigger.isInsert) CommissionViewHandler.handleBeforeInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionViewHandler.handleBeforeUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionViewHandler.handleBeforeDelete(Trigger.old);
    }
    if (Trigger.isAfter) {
        if (Trigger.isInsert) CommissionViewHandler.handleAfterInsert(Trigger.new);
        if (Trigger.isUpdate) CommissionViewHandler.handleAfterUpdate(Trigger.new, Trigger.oldMap);
        if (Trigger.isDelete) CommissionViewHandler.handleAfterDelete(Trigger.old);
    }
}
